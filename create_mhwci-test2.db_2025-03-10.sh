# sql files to execute to create database 
# created on 2025-03-10
export DBFILE=/mnt/ufs18/rs-008/plz-lab/CODE/mhwci/db/mhwci-test2.db
cd /mnt/research/plz-lab/DATA/ClimateData/MHW_metrics
duckdb $DBFILE < /mnt/ufs18/rs-008/plz-lab/CODE/mhwci/db/build_mhw_db.sql 

duckdb $DBFILE < /mnt/ufs18/rs-008/plz-lab/CODE/mhwci/db/build_arise10_decade_metrics.sql 

duckdb $DBFILE < /mnt/ufs18/rs-008/plz-lab/CODE/mhwci/db/build_arise15_decade_metrics.sql 

duckdb $DBFILE < /mnt/ufs18/rs-008/plz-lab/CODE/mhwci/db/build_historical_decade_metrics.sql 

duckdb $DBFILE < /mnt/ufs18/rs-008/plz-lab/CODE/mhwci/db/build_ssp245_decade_metrics.sql 

duckdb $DBFILE < /mnt/ufs18/rs-008/plz-lab/CODE/mhwci/db/build_ssp245_present_decade_metrics.sql 

