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

# usage:
# 0. adjust the BASE_FOLDER and scenarios table with current file paths in this file
# 1. source this file
# 2. test sql code - are the CSV files in the correct path?     
#     scenario = scenarios[[1]]
#     sql = create_scenario_table_sql(scenario_name = scenario[['name']], path = file.path(base_folder,scenario[['folder']]), table_name = scenario[['']]
# 3. test write a file
#     scenario = scenarios[[1]]
#     write_sql_file(scenario)  # will print a file name
# 4. write them all
#   write_all_sql_files(scenarios, base_folder=BASE_FOLDER)

BASE_FOLDER=Sys.getenv(MHW_METRICS_FOLDER, unset = '/mnt/research/plz-lab/DATA/ClimateData/MHW_metrics')

scenarios<- list(
  c(name = 'ARISE-1.0', folder = 'ARISE-1.0', table='arise10_decade_metrics'),
  c(name = 'ARISE-1.5', folder = 'ARISE-1.5', table='arise15_decade_metrics'),
  c(name = 'HISTORICAL', folder = 'HISTORICAL', table='historical_decade_metrics'),
  c(name = 'SSP245', folder = 'SSP245/2040-2069', table='ssp245_decade_metrics'),
  c(name = 'SSP245-Present', folder = 'SSP245/Present', table='ssp245_present_decade_metrics')
) 


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
select_statment = function(ensemble_id, scencario_name, csv_file){
  return(paste("SELECT *, '", ensemble_id, "' AS ensemble, '", scenario_name, "' AS scenario FROM '", csv_file))
}


#' create SQL to create a table by selecting from csv files, 
#' and using UNION to join them together.   
#' e.g. `create table S as select * from file1.csv union select * from file2.csv` etc
#' 
create_scenario_table_sql < - function(scenario_name, path, table_name){

  scenario_csv_files = list.files(
                path = path , 
                pattern = '.*\.csv')

  # start with a create table statement, follow with select statements  
  sql = paste("create table ", scenario_name, " as \n")
  
  num_files = length(scenario_csv_files)
  for(i in (1:num_files)) {
    sql = sql + select_statement(ensemble_id = ensemble_from_filename(scenario_csv_files[[i]]), 
                                 scenario_name = scenario_name, 
                                 csv_file = scenario_csv_files[[i]]
                                 )
    if (i != num_files){ 
      sql = sql + " UNION \n" 
    } else { 
      sql = sql + ";"
    }
  }
  
  return(sql)  
}


write_sql_file<- function(scenario) {
    sql_file = paste0("create_", scenario[['name']], '.sql')
    sql = create_scenario_table_sql(scenario_name = scenario[['name']], 
                                    path = file.path(base_folder,scenario[['folder']]), 
                                    table_name = scenario[['']]
    )
    
    cat(sql, sql_file)
    return(sql_file)

}
  

#' write a file of sql commands for each scenario
#' 
#' create files of SQL commands based on files present
#' and table of scenarios and paths
#' will overwrite any file present
write_all_sql_files <- function(scenarios, base_folder=BASE_FOLDER){
  for (scenario in scenarios){
    sql_file <- write_sql_file(scenario)
    print(sql_file)
  }
}

