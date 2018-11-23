Alberta Oil Spills Analysis
================

Contributors
------------

-   `Alycia Butterworth`: [alyciakb](https://github.com/alyciakb)
-   `Huijue (Juno) Chen`: [huijuechen](https://github.com/huijuechen)

Latest
------

-   Date: November 23, 2018
-   Release v1.0

Overview
--------

This project sets out to find the top predictors of the cause of an oil spill/oil operations accident in Alberta.  Using data from the [Energy Resources Conservation Board (ERCB), provided by the City of Edmonton](https://data.edmonton.ca/Environmental-Services/Alberta-Oil-Spills-1975-2013/ek45-xtjs), we reviewed spills that occured between 2002 and 2013 and fit a machine learning model to predict spill cause as either (1) Equipment Failure or (2) Operator Error based on five factors: the field house location of the spill, the time of year it occured, the source of the spill (well, pipeline or battery), the substance spilled (oil, gas production, or water) and the volume spilled.  We were able to obtain a gini score for each factor and rate them accordingly.

Our findings showed that the top three predictors for the cause of an oil spill in Alberta are:
1. 
2. 
3. 


Usage
--------

1. Clone this repo and navigate to the root of this project.

2. Run the following command line arguments:

```
Rscript src/1_data_cleaning.R src/import_data.R data/clean_data.csv
Rscript src/2_data_viz.R data/clean_data.csv img/cause_graph.png cause
Rscript src/2_data_viz.R data/clean_data.csv img/location_graph.png location
Rscript src/2_data_viz.R data/clean_data.csv img/time_of_year_graph.png time
Rscript src/2_data_viz.R data/clean_data.csv img/source_graph.png source
Rscript src/2_data_viz.R data/clean_data.csv img/substance_graph.png substance
Rscript src/2_data_viz.R data/clean_data.csv img/volume_graph.png volume

```


Dependencies
--------

**R & R Libraries:**

- `rmarkdown`
- `tidyverse`
- `lubridate`
- `gridExtra`

**Python & Python Libraries:**

- `numpy`
- `pandas`
- `seaborn`
- `matplotlib`
- `argparse`
- `pickle`
- `sklearn`
- `graphviz`
