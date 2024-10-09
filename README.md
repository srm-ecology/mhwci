### mhwci: Marine Heat Wave for Climate Intervention

*R package for database and analysis 'Marine Heat Waves during Climate Change & Climate Intervention' (in prep)*

Authors:

-   Dr. Lala Kounta
-   Pat Bills
-   Dr. Phoebe Zarnetske

## Overview

[Package documentation](https://srm-ecology.github.io/mhwci/) ~ [source code on github](https://github.com/srm-ecology/mhwci)

This is a **work in progress** and incomplete.  Any results or visualizations shown are **draft** form and not 
to be considered the final results or any statements made by the the authors at this point.   
Description of the purpose, data sources, model basis etc are forthcoming in a publication

This 'package' is for internal use only until publication of the paper, and is a continuation of Dr. Lala Kounta's project https://github.com/srm-ecology/MHW_climateintervention

Uses the EDI data framework (more to come)

## Requirements/Install

This package relies on the [terra]() package which also requires Gdal libraries to be installed on your computer. 

Data is stored in a database file, not Rdata files.   The database is constructed from exported CSV files and SQL code in the `/db' folder

The database is in [duckdb](https://duckdb.org) format, an open source, in-process columnar database for analytics. The climate data prepared will create a database with tables with over 20M rows.

See the vignette for instructions on specifying the path to the database file to work with. 

### Note about Usage on MSU HPC

When running on your own computer, you install the software you need.  The MSU HPC uses the ['module system'](https://docs.icer.msu.edu/Intro_to_modules/) to select software already installed.  This application requires the following modules to be loaded: 

R/4.3.2-gfbf-2023a: specific to MSU, this R module also loads many packages

`module load UDUNITS, GEOS, PROJ, GDAL`

Note these are all uppercase and there are versions compatible with R installed. 

To avoid having to load these everytime, you can create a file `.Rprofile` with the following in it: 

```R
if(Sys.getenv('HPCC_CLUSTER_FLAVOR')!='') {
  # load required MSU HPC Modules for spatial work
  source(file.path(Sys.getenv("LMOD_PKG"), "init/R"))
  module("load", "UDUNITS")
  module("load", "GEOS")
  module("load", "PROJ")
  module("load", "GDAL")
}
```
  
This will only run if you are running on the MSU HPC and load the modules needed when R starts up. 


## Basic Usage

See the articles linked above or the R markdown file in the `vignettes` folder. 
