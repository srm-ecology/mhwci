-- Marine Heatwave Analysis
-- Lala Kounta, Phoebe Zarnetske, Pat Bills, MSU
-- build mhw database from CSV files using duckdb dialect
-- assumes CSV files mentioned here are present in the subdirectories as exported from matlab

-- -----------
-- base tables

create table years (year integer);

create table decades (decade CHAR, decade_start DATE, decade_end DATE);
insert into  decades values 
    ('2040', DATE '2040-01-01', DATE '2049-12-31'),
    ('2050', DATE '2050-01-01', DATE '2059-12-31'), 
    ('2060', DATE '2060-01-01', DATE '2069-12-31');

-- table to distinguish historical period from future modeled period
create table historical_decades(decade CHAR, decade_start DATE, decade_end DATE);
insert into  historical_decades values 
    ('1980', DATE '1980-01-01', DATE '1989-12-31'),
    ('1990', DATE '1990-01-01', DATE '1999-12-31'), 
    ('2000', DATE '2000-01-01', DATE '2009-12-31');
    
    
-- get lat and lon from matlab index file export.  Used to replace xloc with lon and yloc with lat
-- note the lat_ssp.csv is exported with "writematrix" which does not have a header row since writetable can't work with doubles
create table lat_index as select column0 as lat, row_number() OVER () as yloc from 'lat_ssp.csv';
create table lon_index as select column0 as lon, row_number() OVER () as xloc from 'lon_ssp.csv';


create table ensembles (model char, ensemble char);

# this one was too big and not used in the end
-- create table mclim as select * from 'mclim.csv'
