-- create tables for SSP-245 decade-limited metrics
-- requires build_mhw_db.sql scripts to run first


create table ssp245_decade_metrics as
SELECT *, '001' AS ensemble, 'SSP-245' AS scenario, 2015 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2015-2024_Model_001.mat.mhw.csv'
 union
SELECT *, '002' AS ensemble, 'SSP-245' AS scenario, 2015 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2015-2024_Model_002.mat.mhw.csv'
 union
SELECT *, '003' AS ensemble, 'SSP-245' AS scenario, 2015 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2015-2024_Model_003.mat.mhw.csv'
 union
SELECT *, '004' AS ensemble, 'SSP-245' AS scenario, 2015 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2015-2024_Model_004.mat.mhw.csv'
 union
SELECT *, '005' AS ensemble, 'SSP-245' AS scenario, 2015 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2015-2024_Model_005.mat.mhw.csv'
 union
SELECT *, '006' AS ensemble, 'SSP-245' AS scenario, 2015 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2015-2024_Model_006.mat.mhw.csv'
 union
SELECT *, '007' AS ensemble, 'SSP-245' AS scenario, 2015 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2015-2024_Model_007.mat.mhw.csv'
 union
SELECT *, '008' AS ensemble, 'SSP-245' AS scenario, 2015 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2015-2024_Model_008.mat.mhw.csv'
 union
SELECT *, '009' AS ensemble, 'SSP-245' AS scenario, 2015 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2015-2024_Model_009.mat.mhw.csv'
 union
SELECT *, '010' AS ensemble, 'SSP-245' AS scenario, 2015 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2015-2024_Model_010.mat.mhw.csv'
 union
SELECT *, '001' AS ensemble, 'SSP-245' AS scenario, 2025 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2025-2034_Model_001.mat.mhw.csv'
 union
SELECT *, '002' AS ensemble, 'SSP-245' AS scenario, 2025 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2025-2034_Model_002.mat.mhw.csv'
 union
SELECT *, '003' AS ensemble, 'SSP-245' AS scenario, 2025 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2025-2034_Model_003.mat.mhw.csv'
 union
SELECT *, '004' AS ensemble, 'SSP-245' AS scenario, 2025 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2025-2034_Model_004.mat.mhw.csv'
 union
SELECT *, '005' AS ensemble, 'SSP-245' AS scenario, 2025 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2025-2034_Model_005.mat.mhw.csv'
 union
SELECT *, '006' AS ensemble, 'SSP-245' AS scenario, 2025 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2025-2034_Model_006.mat.mhw.csv'
 union
SELECT *, '007' AS ensemble, 'SSP-245' AS scenario, 2025 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2025-2034_Model_007.mat.mhw.csv'
 union
SELECT *, '008' AS ensemble, 'SSP-245' AS scenario, 2025 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2025-2034_Model_008.mat.mhw.csv'
 union
SELECT *, '009' AS ensemble, 'SSP-245' AS scenario, 2025 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2025-2034_Model_009.mat.mhw.csv'
 union
SELECT *, '010' AS ensemble, 'SSP-245' AS scenario, 2025 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2025-2034_Model_010.mat.mhw.csv'
 union
SELECT *, '001' AS ensemble, 'SSP-245' AS scenario, 2040 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2040-2049_Model_001.mat.mhw.csv'
 union
SELECT *, '002' AS ensemble, 'SSP-245' AS scenario, 2040 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2040-2049_Model_002.mat.mhw.csv'
 union
SELECT *, '003' AS ensemble, 'SSP-245' AS scenario, 2040 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2040-2049_Model_003.mat.mhw.csv'
 union
SELECT *, '004' AS ensemble, 'SSP-245' AS scenario, 2040 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2040-2049_Model_004.mat.mhw.csv'
 union
SELECT *, '005' AS ensemble, 'SSP-245' AS scenario, 2040 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2040-2049_Model_005.mat.mhw.csv'
 union
SELECT *, '006' AS ensemble, 'SSP-245' AS scenario, 2040 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2040-2049_Model_006.mat.mhw.csv'
 union
SELECT *, '007' AS ensemble, 'SSP-245' AS scenario, 2040 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2040-2049_Model_007.mat.mhw.csv'
 union
SELECT *, '008' AS ensemble, 'SSP-245' AS scenario, 2040 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2040-2049_Model_008.mat.mhw.csv'
 union
SELECT *, '009' AS ensemble, 'SSP-245' AS scenario, 2040 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2040-2049_Model_009.mat.mhw.csv'
 union
SELECT *, '010' AS ensemble, 'SSP-245' AS scenario, 2040 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2040-2049_Model_010.mat.mhw.csv'
 union
SELECT *, '001' AS ensemble, 'SSP-245' AS scenario, 2050 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2050-2059_Model_001.mat.mhw.csv'
 union
SELECT *, '002' AS ensemble, 'SSP-245' AS scenario, 2050 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2050-2059_Model_002.mat.mhw.csv'
 union
SELECT *, '003' AS ensemble, 'SSP-245' AS scenario, 2050 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2050-2059_Model_003.mat.mhw.csv'
 union
SELECT *, '004' AS ensemble, 'SSP-245' AS scenario, 2050 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2050-2059_Model_004.mat.mhw.csv'
 union
SELECT *, '005' AS ensemble, 'SSP-245' AS scenario, 2050 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2050-2059_Model_005.mat.mhw.csv'
 union
SELECT *, '006' AS ensemble, 'SSP-245' AS scenario, 2050 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2050-2059_Model_006.mat.mhw.csv'
 union
SELECT *, '007' AS ensemble, 'SSP-245' AS scenario, 2050 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2050-2059_Model_007.mat.mhw.csv'
 union
SELECT *, '008' AS ensemble, 'SSP-245' AS scenario, 2050 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2050-2059_Model_008.mat.mhw.csv'
 union
SELECT *, '009' AS ensemble, 'SSP-245' AS scenario, 2050 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2050-2059_Model_009.mat.mhw.csv'
 union
SELECT *, '010' AS ensemble, 'SSP-245' AS scenario, 2050 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2050-2059_Model_010.mat.mhw.csv'
 union
SELECT *, '001' AS ensemble, 'SSP-245' AS scenario, 2060 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2060-2069_Model_001.mat.mhw.csv'
 union
SELECT *, '002' AS ensemble, 'SSP-245' AS scenario, 2060 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2060-2069_Model_002.mat.mhw.csv'
 union
SELECT *, '003' AS ensemble, 'SSP-245' AS scenario, 2060 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2060-2069_Model_003.mat.mhw.csv'
 union
SELECT *, '004' AS ensemble, 'SSP-245' AS scenario, 2060 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2060-2069_Model_004.mat.mhw.csv'
 union
SELECT *, '005' AS ensemble, 'SSP-245' AS scenario, 2060 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2060-2069_Model_005.mat.mhw.csv'
 union
SELECT *, '006' AS ensemble, 'SSP-245' AS scenario, 2060 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2060-2069_Model_006.mat.mhw.csv'
 union
SELECT *, '007' AS ensemble, 'SSP-245' AS scenario, 2060 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2060-2069_Model_007.mat.mhw.csv'
 union
SELECT *, '008' AS ensemble, 'SSP-245' AS scenario, 2060 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2060-2069_Model_008.mat.mhw.csv'
 union
SELECT *, '009' AS ensemble, 'SSP-245' AS scenario, 2060 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2060-2069_Model_009.mat.mhw.csv'
 union
SELECT *, '010' AS ensemble, 'SSP-245' AS scenario, 2060 as decade_name FROM 'SSP-245/2015-2069/MHW_metrics_2060-2069_Model_010.mat.mhw.csv';

alter table  ssp245_decade_metrics add column mhw_onset_date DATE;
alter table  ssp245_decade_metrics add column mhw_end_date DATE;

update ssp245_decade_metrics set mhw_onset_date = cast(strptime(cast(mhw_onset as varchar), '%Y%m%d') as date) , 
                      mhw_end_date = cast(strptime(cast(mhw_end as varchar), '%Y%m%d') as date);


alter table ssp245_decade_metrics add column lat DOUBLE;
alter table ssp245_decade_metrics add column lon DOUBLE;

update ssp245_decade_metrics set lat = lat_index.lat from lat_index where ssp245_decade_metrics.yloc = lat_index.yloc ;
update ssp245_decade_metrics set lon = lon_index.lon from lon_index where ssp245_decade_metrics.xloc = lon_index.xloc ;

create index ssp245_decade_metrics_onset_date_idx on ssp245_decade_metrics (mhw_onset_date);
create index ssp245_decade_metrics_end_date_idx on ssp245_decade_metrics (mhw_end_date);
create index ssp245_decade_metrics_lat_lon_idx on ssp245_decade_metrics (lat, lon);