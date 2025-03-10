create table  historical_decade_metrics  as 
SELECT '001' AS ensemble, 'HISTORICAL' AS scenario, * FROM '/mnt/research/plz-lab/DATA/ClimateData/MHW_metrics/HISTORICAL/MHW_metrics_1990-2009_Model_001.mat.mhw.csv'  UNION 
SELECT '002' AS ensemble, 'HISTORICAL' AS scenario, * FROM '/mnt/research/plz-lab/DATA/ClimateData/MHW_metrics/HISTORICAL/MHW_metrics_1990-2009_Model_002.mat.mhw.csv'  UNION 
SELECT '003' AS ensemble, 'HISTORICAL' AS scenario, * FROM '/mnt/research/plz-lab/DATA/ClimateData/MHW_metrics/HISTORICAL/MHW_metrics_1990-2009_Model_003.mat.mhw.csv' ; 

 alter table  historical_decade_metrics add column mhw_onset_date DATE;

alter table  historical_decade_metrics add column mhw_end_date DATE;

update  historical_decade_metrics set mhw_onset_date = cast(strptime(cast(mhw_onset as varchar), '%Y%m%d') as date) , 
  mhw_end_date = cast(strptime(cast(mhw_end as varchar), '%Y%m%d') as date);

alter table historical_decade_metrics add column lat DOUBLE;

alter table historical_decade_metrics add column lon DOUBLE;

update historical_decade_metrics set lat = lat_index.lat from lat_index where historical_decade_metrics.yloc = lat_index.yloc ;

update historical_decade_metrics set lon = lon_index.lon from lon_index where  historical_decade_metrics.xloc = lon_index.xloc ;

create index historical_decade_metrics_onset_date_idx on historical_decade_metrics (mhw_onset_date);

create index historical_decade_metrics_end_date_idx  on  historical_decade_metrics (mhw_end_date);

create index historical_decade_metrics_lat_lon_idx   on  historical_decade_metrics (lat, lon);

