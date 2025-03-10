-- --------------------- 
-- import data for 'metrics' files, 
-- OBSOLETE these are not used in the paper analysis./ .  
-- the 'metrics' files is just my name for those model outputs
-- for which no decade barrier is created.  the '..._decade ' files were created 
-- by constraing the model to each decade (e.g. outputs must fall inside the decade
-- in which they were run. ).  The CSV files listed below were generated without
-- that restriction.   the main analysis was using the decade files, not these. 

-- note that each model scenario has it's own table, and these tables do not have a 'scenario' 

-- --------
-- ARISE 1.0 ensembles 

insert into ensembles values 
    ('ARISE-1.0', '001'),
    ('ARISE-1.0', '002'),
    ('ARISE-1.0', '003'),
    ('ARISE-1.0', '004'),
    ('ARISE-1.0', '005'),
    ('ARISE-1.0', '006'),
    ('ARISE-1.0', '007'),
    ('ARISE-1.0', '008'),
    ('ARISE-1.0', '009'),
    ('ARISE-1.0', '010');

create table arise10_metrics as 
    SELECT *, '001' AS ensemble, 'ARISE-1.0' AS scenario FROM 'ARISE-1.0/MHW_metrics_Model_001.mat.mhw.csv'
    UNION
    SELECT *, '002' AS ensemble, 'ARISE-1.0' AS scenario FROM 'ARISE-1.0/MHW_metrics_Model_002.mat.mhw.csv'
    UNION
    SELECT *, '003' AS ensemble, 'ARISE-1.0' AS scenario FROM 'ARISE-1.0/MHW_metrics_Model_003.mat.mhw.csv'
    UNION
    SELECT *, '004' AS ensemble, 'ARISE-1.0' AS scenario FROM 'ARISE-1.0/MHW_metrics_Model_004.mat.mhw.csv'
    UNION
    SELECT *, '005' AS ensemble, 'ARISE-1.0' AS scenario FROM 'ARISE-1.0/MHW_metrics_Model_005.mat.mhw.csv'
    UNION
    SELECT *, '006' AS ensemble, 'ARISE-1.0' AS scenario FROM 'ARISE-1.0/MHW_metrics_Model_006.mat.mhw.csv'
    UNION
    SELECT *, '007' AS ensemble, 'ARISE-1.0' AS scenario FROM 'ARISE-1.0/MHW_metrics_Model_007.mat.mhw.csv'
    UNION
    SELECT *, '008' AS ensemble, 'ARISE-1.0' AS scenario FROM 'ARISE-1.0/MHW_metrics_Model_008.mat.mhw.csv'
    UNION
    SELECT *, '009' AS ensemble, 'ARISE-1.0' AS scenario FROM 'ARISE-1.0/MHW_metrics_Model_009.mat.mhw.csv'
    UNION
    SELECT *, '010' AS ensemble, 'ARISE-1.0' AS scenario FROM 'ARISE-1.0/MHW_metrics_Model_010.mat.mhw.csv';

alter table arise10_metrics add column mhw_onset_date DATE;
alter table arise10_metrics add column mhw_end_date DATE;

update arise10_metrics set mhw_onset_date = cast(strptime(cast(mhw_onset as varchar), '%Y%m%d') as date) , 
                      mhw_end_date = cast(strptime(cast(mhw_end as varchar), '%Y%m%d') as date);


alter table arise10_metrics add column lat DOUBLE;
alter table arise10_metrics add column lon DOUBLE;

update arise10_metrics set lat = lat_index.lat from lat_index where arise10_metrics.yloc = lat_index.yloc ;
update arise10_metrics set lon = lon_index.lon from lon_index where arise10_metrics.xloc = lon_index.xloc ;

create index arise10_onset_date_idx on arise10_metrics (mhw_onset_date);
create index arise10_end_date_idx on arise10_metrics (mhw_end_date);

create index arise10_lat_lon_idx on arise10_metrics (lat, lon);


-- ---------
-- ARISE 1.5 ensembles

                      
insert into ensembles values 
  ('ARISE-1.5', '001'),
  ('ARISE-1.5', '002'),
  ('ARISE-1.5', '003'),
  ('ARISE-1.5', '004'),
  ('ARISE-1.5', '005'),
  ('ARISE-1.5', '006'),
  ('ARISE-1.5', '007'),
  ('ARISE-1.5', '008'),
  ('ARISE-1.5', '009'),
  ('ARISE-1.5', '010');
  
create table arise15_metrics as 
  SELECT *, '001' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-1.5/MHW_metrics_Model_001.mat.mhw.csv'
  UNION
  SELECT *, '002' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-1.5/MHW_metrics_Model_002.mat.mhw.csv'
  UNION
  SELECT *, '003' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-1.5/MHW_metrics_Model_003.mat.mhw.csv'
  UNION
  SELECT *, '004' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-1.5/MHW_metrics_Model_004.mat.mhw.csv'
  UNION
  SELECT *, '005' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-1.5/MHW_metrics_Model_005.mat.mhw.csv'
  UNION
  SELECT *, '006' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-1.5/MHW_metrics_Model_006.mat.mhw.csv'
  UNION
  SELECT *, '007' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-1.5/MHW_metrics_Model_007.mat.mhw.csv'
  UNION
  SELECT *, '008' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-1.5/MHW_metrics_Model_008.mat.mhw.csv'
  UNION
  SELECT *, '009' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-1.5/MHW_metrics_Model_009.mat.mhw.csv'
  UNION
  SELECT *, '010' AS ensemble, 'ARISE-1.5' AS scenario FROM 'ARISE-1.5/MHW_metrics_Model_010.mat.mhw.csv';

alter table arise15_metrics add column mhw_onset_date DATE;
alter table arise15_metrics add column mhw_end_date DATE;

update arise15_metrics set mhw_onset_date = cast(strptime(cast(mhw_onset as varchar), '%Y%m%d') as date) , 
                      mhw_end_date = cast(strptime(cast(mhw_end as varchar), '%Y%m%d') as date);


alter table arise15_metrics add column lat DOUBLE;
alter table arise15_metrics add column lon DOUBLE;

update arise15_metrics set lat = lat_index.lat from lat_index where arise15_metrics.yloc = lat_index.yloc ;
update arise15_metrics set lon = lon_index.lon from lon_index where arise15_metrics.xloc = lon_index.xloc ;

create index arise15_onset_date_idx on arise15_metrics (mhw_onset_date);
create index arise15_end_date_idx on arise15_metrics (mhw_end_date);

create index arise15_lat_lon_idx on arise15_metrics (lat, lon);


-- ------------
-- SSP2-4.5 

insert into ensembles values 
  ('SSP2-4.5', '001'),
  ('SSP2-4.5', '002'),
  ('SSP2-4.5', '003'),
  ('SSP2-4.5', '004'),
  ('SSP2-4.5', '005'),
  ('SSP2-4.5', '006'),
  ('SSP2-4.5', '007'),
  ('SSP2-4.5', '008'),
  ('SSP2-4.5', '009'),
  ('SSP2-4.5', '010');
  
create table ssp245_metrics as 
  SELECT *, '001' AS ensemble, 'SSP2-4.5' AS scenario FROM 'SSP2-4.5/MHW_metrics_Model_001.mat.mhw.csv'
  UNION
  SELECT *, '002' AS ensemble, 'SSP2-4.5' AS scenario FROM 'SSP2-4.5/MHW_metrics_Model_002.mat.mhw.csv'
  UNION
  SELECT *, '003' AS ensemble, 'SSP2-4.5' AS scenario FROM 'SSP2-4.5/MHW_metrics_Model_003.mat.mhw.csv'
  UNION
  SELECT *, '004' AS ensemble, 'SSP2-4.5' AS scenario FROM 'SSP2-4.5/MHW_metrics_Model_004.mat.mhw.csv'
  UNION
  SELECT *, '005' AS ensemble, 'SSP2-4.5' AS scenario FROM 'SSP2-4.5/MHW_metrics_Model_005.mat.mhw.csv'
  UNION
  SELECT *, '006' AS ensemble, 'SSP2-4.5' AS scenario FROM 'SSP2-4.5/MHW_metrics_Model_006.mat.mhw.csv'
  UNION
  SELECT *, '007' AS ensemble, 'SSP2-4.5' AS scenario FROM 'SSP2-4.5/MHW_metrics_Model_007.mat.mhw.csv'
  UNION
  SELECT *, '008' AS ensemble, 'SSP2-4.5' AS scenario FROM 'SSP2-4.5/MHW_metrics_Model_008.mat.mhw.csv'
  UNION
  SELECT *, '009' AS ensemble, 'SSP2-4.5' AS scenario FROM 'SSP2-4.5/MHW_metrics_Model_009.mat.mhw.csv'
  UNION
  SELECT *, '010' AS ensemble, 'SSP2-4.5' AS scenario FROM 'SSP2-4.5/MHW_metrics_Model_010.mat.mhw.csv';

alter table ssp245_metrics add column mhw_onset_date DATE;
alter table ssp245_metrics add column mhw_end_date DATE;

update ssp245_metrics set mhw_onset_date = cast(strptime(cast(mhw_onset as varchar), '%Y%m%d') as date) , 
                      mhw_end_date = cast(strptime(cast(mhw_end as varchar), '%Y%m%d') as date);


alter table ssp245_metrics add column lat DOUBLE;
alter table ssp245_metrics add column lon DOUBLE;

update ssp245_metrics set lat = lat_index.lat from lat_index where ssp245_metrics.yloc = lat_index.yloc ;
update ssp245_metrics set lon = lon_index.lon from lon_index where ssp245_metrics.xloc = lon_index.xloc ;

create index ssp245_onset_date_idx on ssp245_metrics (mhw_onset_date);
create index ssp245_end_date_idx on ssp245_metrics (mhw_end_date);

create index ssp245_lat_lon_idx on ssp245_metrics (lat, lon);

