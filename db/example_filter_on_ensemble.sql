-- !preview conn=DBI::dbConnect(duckdb::duckdb(), dbdir = 'mhwci_v4.db')

-- example of a method to filter on 'ensemble' for a scenario
-- in this database the ensemble is stored as a character string with leading zeros:  001 002 010 
-- if you compare that against a string that is a list of ensembles with a separator like this '080,090,010' 
-- this sql will include those ensembles that are on the list.   
-- the list of ensembles must be a single string and the separator does not have to be a comma

SELECT  
  (mhw_onset- mod(mhw_onset,100000))/10000 as decade,
   ensemble, 
   avg(mhw_dur) as avg_dur,
   count(mhw_dur) as n
FROM
   arise10_decade_metrics 
WHERE
   contains('006,007,008,009,010', ensemble)
GROUP BY 
   decade, ensemble 
ORDER BY 
  decade, ensemble
;

