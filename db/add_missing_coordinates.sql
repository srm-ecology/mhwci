-- !preview conn=DBI::dbConnect(duckdb::duckdb(), dbdir = 'db/mhwci_v4.db')

-- example of running SQL from Rstudio
-- in the top line, change the file path in dbdir parameter to match your 

-- select * from arise10_decade_metrics limit 10;

-- in the SQL below, change the table name in the 'FROM' section

SELECT 
  lat, lon, 
  (mhw_onset- mod(mhw_onset,100000))/10000 as decade,
  avg(mhw_dur) as avg_dur
FROM 
  arise10_decade_metrics inner join 
WHERE 
  mhw_onset/10000 >= 2040 and mhw_onset/10000 <= 2069+1
GROUP BY 
  lat, lon, decade 
ORDER by 
  decade, lat, lon
LIMIT 20