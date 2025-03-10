-- create tables for arise10 decade-limited metrics
-- requires build_mhw_db.sql scripts to run first

create table arise15_decade_metrics as 
SELECT *, '001' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2040-2049_Model_001.mat.mhw.csv'
 union
SELECT *, '002' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2040-2049_Model_002.mat.mhw.csv'
 union
SELECT *, '003' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2040-2049_Model_003.mat.mhw.csv'
 union
SELECT *, '004' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2040-2049_Model_004.mat.mhw.csv'
 union
SELECT *, '005' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2040-2049_Model_005.mat.mhw.csv'
 union
SELECT *, '006' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2040-2049_Model_006.mat.mhw.csv'
 union
SELECT *, '007' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2040-2049_Model_007.mat.mhw.csv'
 union
SELECT *, '008' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2040-2049_Model_008.mat.mhw.csv'
 union
SELECT *, '009' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2040-2049_Model_009.mat.mhw.csv'
 union
SELECT *, '010' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2040-2049_Model_010.mat.mhw.csv'
 union
SELECT *, '001' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2050-2059_Model_001.mat.mhw.csv'
 union
SELECT *, '002' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2050-2059_Model_002.mat.mhw.csv'
 union
SELECT *, '003' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2050-2059_Model_003.mat.mhw.csv'
 union
SELECT *, '004' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2050-2059_Model_004.mat.mhw.csv'
 union
SELECT *, '005' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2050-2059_Model_005.mat.mhw.csv'
 union
SELECT *, '006' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2050-2059_Model_006.mat.mhw.csv'
 union
SELECT *, '007' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2050-2059_Model_007.mat.mhw.csv'
 union
SELECT *, '008' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2050-2059_Model_008.mat.mhw.csv'
 union
SELECT *, '009' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2050-2059_Model_009.mat.mhw.csv'
 union
SELECT *, '010' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2050-2059_Model_010.mat.mhw.csv'
 union
SELECT *, '001' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2060-2069_Model_001.mat.mhw.csv'
 union
SELECT *, '002' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2060-2069_Model_002.mat.mhw.csv'
 union
SELECT *, '003' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2060-2069_Model_003.mat.mhw.csv'
 union
SELECT *, '004' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2060-2069_Model_004.mat.mhw.csv'
 union
SELECT *, '005' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2060-2069_Model_005.mat.mhw.csv'
 union
SELECT *, '006' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2060-2069_Model_006.mat.mhw.csv'
 union
SELECT *, '007' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2060-2069_Model_007.mat.mhw.csv'
 union
SELECT *, '008' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2060-2069_Model_008.mat.mhw.csv'
 union
SELECT *, '009' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2060-2069_Model_009.mat.mhw.csv'
 union
SELECT *, '010' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-15/2040-2069/MHW_metrics_2060-2069_Model_010.mat.mhw.csv';


alter table  arise15_decade_metrics add column mhw_onset_date DATE;
alter table  arise15_decade_metrics add column mhw_end_date DATE;

update  arise15_decade_metrics set mhw_onset_date = cast(strptime(cast(mhw_onset as varchar), '%Y%m%d') as date) , 
                      mhw_end_date = cast(strptime(cast(mhw_end as varchar), '%Y%m%d') as date);


alter table  arise15_decade_metrics add column lat DOUBLE;
alter table  arise15_decade_metrics add column lon DOUBLE;

update  arise15_decade_metrics set lat = lat_index.lat from lat_index where  arise15_decade_metrics.yloc = lat_index.yloc ;
update  arise15_decade_metrics set lon = lon_index.lon from lon_index where  arise15_decade_metrics.xloc = lon_index.xloc ;

create index arise15_decade_metrics_onset_date_idx on  arise15_decade_metrics (mhw_onset_date);
create index arise15_decade_metrics_end_date_idx on  arise15_decade_metrics (mhw_end_date);
create index arise15_decade_metrics_lat_lon_idx on  arise15_decade_metrics (lat, lon);

