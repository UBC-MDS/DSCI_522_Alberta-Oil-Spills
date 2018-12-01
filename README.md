Alberta Oil Spills Analysis
================

Contributors
------------

-   `Alycia Butterworth`: [alyciakb](https://github.com/alyciakb)
-   `Huijue (Juno) Chen`: [huijuechen](https://github.com/huijuechen)

Latest
------

-   Date: November 24, 2018
-   Release v2.0

Overview
--------

The goal of this project is to find the top predictors of the cause of an oil spill/oil operations accident in Alberta.  Using data from the [Energy Resources Conservation Board (ERCB), provided by the City of Edmonton](https://data.edmonton.ca/Environmental-Services/Alberta-Oil-Spills-1975-2013/ek45-xtjs), we reviewed spills that occured between 2002 and 2013 and fit a machine learning model (decision tree) to predict spill cause as either (1) Equipment Failure or (2) Operator Error based on five factors: (1) the field house location of the spill, (2) the time of year it occured, (3) the source of the spill (well, pipeline or battery), (4) the substance spilled (oil, gas production, or water) (5) and the volume spilled.  We were able to obtain a gini score for each factor and rate them accordingly.

We will use the following contents from the data:

| Column name | datatype | Description |
| --- | -- | -- |
| cause | String | Identifier for a particular cause of spill |
| source | String | equipment source of the spill incident| 
| location | String | location of the spill incident| 
| substance | String | substance of the spill incident| 
| volume | Numeric | volume of the substance spilled (unit: cubic meter) |
| year_quarter | Numeric | quarter of the year for when the spill occured |

Our findings showed that the top three predictors for the cause of an oil spill in Alberta are:
1. source of spill
2. field location
3. type of substance spilled

The full final report that includes our analysis and interpretation, limitations, and future directions can be found within the [doc folder](doc). The report also summarizes and visualizes our original data, visualizes the decision tree model created for this project and its accuracy, and the results. The report and scripts in this project can be run by the user within their terminal. Please see the **Usage** section below for instructions.

Procedure
--------

To run this analysis yourself, the scripts need to be run in the following order:

1. Cleaning data in [1_data_cleaning.R](src/1_data_cleaning.R)
2. Visualization of data in [2_data_viz.R](src/2_data_viz.R)
3. Use `sklearn` to fit a model in [3_model_fitting.py](src/3_model_fitting.py)
4. Visualize the model decision tree in [4_model_viz.py](src/4_model_viz.py)
5. Create a final report and render it in [final_report.Rmd](doc/final_report.Rmd)

### Steps: 

1. Clone this repo and navigate to the root of this project.

2. Run the following command line arguments:

```
# step 1 Import data and clean data
Rscript src/1_data_cleaning.R data/AlbertaOilSpills_1975-2013.csv data/clean_data.csv

# step 2 Data visualization
Rscript src/2_data_viz.R data/clean_data.csv img/cause_graph.png cause
Rscript src/2_data_viz.R data/clean_data.csv img/location_graph.png location
Rscript src/2_data_viz.R data/clean_data.csv img/time_of_year_graph.png time
Rscript src/2_data_viz.R data/clean_data.csv img/source_graph.png source
Rscript src/2_data_viz.R data/clean_data.csv img/substance_graph.png substance
Rscript src/2_data_viz.R data/clean_data.csv img/volume_graph.png volume

# step 3 Analyze the data and find a decision tree
python src/3_model_fitting.py "./data/clean_data.csv"  "./results/"

# step 4 Decision tree visualization
python src/4_model_viz.py "./results/" "./results/"
sips -s format png results/oil_spills_model.pdf --out results/oil_spills_model.png

# step 5 Make final report
Rscript -e "rmarkdown::render('doc/final_report.Rmd')"
```

Or, above can be done via running a shell script:

```
bash run_all.sh
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
