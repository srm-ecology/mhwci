# create_sql_files_to_build_db.R
# Pat Bills for Dr. Lala Kounta 
# version 1, new in 2025
# previously the SQL code was hand written but 
# for this next version of the database, the file locations and names have changed
# this script uses the file locations and file names to create the SQL code that
# was previously created by hand
# 
# note this script has functions for all operations to allow for testing  of 
# each part, and one file at a time. 
# REQUIREMENTS: stringr package, a dependency of this package
#  installing the mhwci package is not required to run this script, only stringr

# usage:
# 0. adjust the BASE_FOLDER and scenarios table with current file paths in this file
# 1. source this file
# 2. test sql code - are the CSV files in the correct path?     
#     scenario = scenarios[[1]]
#     sql <- create_scenario_table_sql(scenario_name = scenario[['name']], path = file.path(BASE_FOLDER,scenario[['folder']]), table_name = scenario[['table']])
# 3. test write a file
#     scenario = scenarios[[1]]
#     write_sql_file(scenario, sql_folder = 'db')  # will print a file name
# 4. write them all
#   write_all_sql_files(scenarios, base_folder=BASE_FOLDER)


BASE_FOLDER=Sys.getenv("MHW_METRICS_FOLDER", unset = '/mnt/research/plz-lab/DATA/ClimateData/MHW_metrics')

message(paste("BASE_FOLDER set to ", BASE_FOLDER))
if(!dir.exists(BASE_FOLDER)){ message("BASE_FOLDER not found on path, set in MHW_METRICS_FOLDER in .Renviron")}

scenarios<- list(
  c(name = 'ARISE-1.0', folder = 'ARISE-1.0', table='arise10_decade_metrics'),
  c(name = 'ARISE-1.5', folder = 'ARISE-1.5', table='arise15_decade_metrics'),
  c(name = 'HISTORICAL', folder = 'HISTORICAL', table='historical_decade_metrics'),
  c(name = 'SSP245', folder = 'SSP245/2040-2069', table='ssp245_decade_metrics'),
  c(name = 'SSP245-Present', folder = 'SSP245/Present', table='ssp245_present_decade_metrics')
) 

message("scenarios: ")
message(scenarios)


#' get the ensemble ID from a CSV file name
#' 
#' outputs from Lala's matlab models have filenames like
#' MHW_metrics_2040-2049_Model_001.mat (or with mhw.csv)  
#' where the ensemble of the model is 001.  
#' Value: a string of the ensemble ID with leading zeros
#' 
ensemble_from_filename <- function(filename){
  pattern <- ".*_(\\d\\d\\d)\\.mat.*"
  matches<- stringr::str_match(string = filename, pattern = pattern)
  ensemble_id  = matches[1,2]
  return(ensemble_id)
}

#' SQL to import data from a CSV File
#' 
#' with ensembleID and scenario name in the data rows
select_statement <- function(ensemble_id, scenario_name, csv_file){
  return(paste0("SELECT '", ensemble_id, "' AS ensemble, '", scenario_name, "' AS scenario, * FROM '", csv_file))
}


#' create SQL to create a table by selecting from csv files, 
#' and using UNION to join them together.   
#' e.g. `create table S as select * from file1.csv union select * from file2.csv` etc
#' 
create_scenario_table_sql <- function(scenario_name, path, table_name){

  scenario_csv_files = list.files(path = path, pattern = '.*\\.csv')

  # start with a create table statement, follow with select statements  
  sql = paste("create table ", table_name, " as \n")
  num_files = length(scenario_csv_files)
  for(i in (1:num_files)) {
    
    sql <- paste0(sql, select_statement(ensemble_id = ensemble_from_filename(scenario_csv_files[[i]]), 
                                 scenario_name = scenario_name, 
                                 csv_file = scenario_csv_files[[i]]
                                 )
    )
    if (i != num_files){ 
      sql <- paste0(sql, " UNION \n")
    } else { 
      sql <- paste0(sql, ";")
    }
  }
  
  sql <-  paste(sql, "\n\n", additional_sql(table = table_name))
  
  return(sql)  
}


write_sql_file<- function(scenario, base_folder = BASE_FOLDER, sql_folder = "db") {
    sql_file = file.path(sql_folder, paste0("create_", scenario[['name']], '.sql'))
    sql = create_scenario_table_sql(scenario_name = scenario[['name']], 
                                    path = file.path(base_folder,scenario[['folder']]), 
                                    table_name = scenario[['table']]
    )
    
    cat(sql, file=sql_file)
    return(sql_file)

}
  

#' sql statements to complete table
#' 
#' these sql statements for each MHW metrics table are needed
#' to help them work with R and to work faster
#' This is a short cut to have to paste this at the end of each SQL file, 
#' which used to be done manually
#' For these to run, requires the table to be in the database, with the standard
#' MHW fields, and the table lat_index and lon_index must exist
#' these are created with the file `db/build_mhw_db.sql`
#' 
additional_sql <- function(table) {
  sql <- ''
  # ", table, "
  sql <- paste0(sql, "alter table  ", table, " add column mhw_onset_date DATE;","\n\n") 
  sql <- paste0(sql, "alter table  ", table, " add column mhw_end_date DATE;","\n\n") 
  sql <- paste0(sql, "update  ", table, " set mhw_onset_date = cast(strptime(cast(mhw_onset as varchar), '%Y%m%d') as date) , 
  mhw_end_date = cast(strptime(cast(mhw_end as varchar), '%Y%m%d') as date);","\n\n") 
  
  sql <- paste0(sql, "alter table ", table, " add column lat DOUBLE;","\n\n") 
  sql <- paste0(sql,  "alter table ", table, " add column lon DOUBLE;","\n\n") 
  
  sql <- paste0(sql, "update ", table, " set lat = lat_index.lat from lat_index where  arise10_decade_metrics.yloc = lat_index.yloc ;","\n\n") 
  sql <- paste0(sql, "update", table, " set lon = lon_index.lon from lon_index where  arise10_decade_metrics.xloc = lon_index.xloc ;","\n\n") 
  
  sql <- paste0(sql, "create index ", table, "_onset_date_idx on ", table, " (mhw_onset_date);","\n\n") 
  sql <- paste0(sql, "create index ", table, "_end_date_idx on  arise10_decade_metrics (mhw_end_date);","\n\n") 
  sql <- paste0(sql, "create index ", table, "_lat_lon_idx on  arise10_decade_metrics (lat, lon);","\n\n") 
  return(sql)
}

#' write a file of sql commands for each scenario
#' 
#' create files of SQL commands based on files present
#' and table of scenarios and paths
#' will overwrite any file present
write_all_sql_files <- function(scenarios, base_folder=BASE_FOLDER, sql_folder = 'db', db_file_name='mhwci.db'){
  db_file_path <- file.path(base_folder, sql_folder, db_file_name)
  
  shell_script <- "# sql files to execute to create database \n"
  shell_script <- paste0(shell_script, "# created on ", Sys.Date(), "\n")
  
  shell_script <- paste0(shell_script, "export DBFILE=", db_file_path, "\n")
  # note for now, assuming the script build_mhw_db.sql exists
  shell_script <- paste0(shell_script, "duckdb $DBFILE < build_mhw_db.sql \n\n")
  
  for (scenario in scenarios){
    sql_file <- write_sql_file(scenario, sql_folder = sql_folder)
    print(sql_file)
    shell_script <- paste0(shell_script, "duckdb $DBFILE < ", sql_file, " \n\n")

  }
  
  shell_script_file = paste0("create_", db_file_name, "_", Sys.Date(), ".sh")
  message(paste("writing shell script file ", shell_script_file))
  cat(shell_script, file = shell_script_file)
}