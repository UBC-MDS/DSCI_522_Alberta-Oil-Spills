Alberta Oil Spills Analysis
================

Contributors
------------

-   `Alycia Butterworth`: [alyciakb](https://github.com/alyciakb)
-   `Huijue (Juno) Chen`: [huijuechen](https://github.com/huijuechen)

Latest
------

-   Date: December 8, 2018
-   Release v4.0

Overview
--------

The goal of this project is to find the top predictors of the cause of a spill incident in the Alberta oil industry. Using data from the [Energy Resources Conservation Board (ERCB), provided by the City of Edmonton](https://data.edmonton.ca/Environmental-Services/Alberta-Oil-Spills-1975-2013/ek45-xtjs), we reviewed spills that occurred between 2002 and 2013 and fit a machine learning model (decision tree) to predict spill cause as either (1) Equipment Failure or (2) Operator Error based on five factors: (1) the field house location of the spill, (2) the time of year it occurred, (3) the source of the spill (well, pipeline or battery), (4) the substance spilled (oil, gas production, or water) (5) and the volume spilled.  We were able to obtain a gini score for each factor and rate them accordingly.

We will use the following contents from the data:

| Column name | datatype | Description |
| --- | -- | -- |
| cause | String | Identifier for a particular cause of spill |
| source | String | equipment source of the spill incident| 
| location | String | location of the spill incident| 
| substance | String | substance of the spill incident| 
| volume | Numeric | volume of the substance spilled (unit: cubic metre) |
| year_quarter | Numeric | quarter of the year for when the spill occurred |

Our findings showed that the top three predictors for the cause of an oil spill in Alberta are:
1. source of spill
2. field location
3. type of substance spilled

The full final report that includes our analysis and interpretation, limitations, and future directions can be found within the [doc folder](doc). The report also summarizes and visualizes our original data, visualizes the decision tree model created for this project and its accuracy, and the results. The report and scripts in this project can be run by the user within their terminal. Please see the **Procedure** section below for instructions.

Procedure
--------

To run this analysis yourself, the scripts need to be run in the following order:

1. Cleaning data in [1_data_cleaning.R](src/1_data_cleaning.R)
2. Visualization of data in [2_data_viz.R](src/2_data_viz.R)
3. Use `sklearn` to fit a model in [3_model_fitting.py](src/3_model_fitting.py)
4. Visualize the model decision tree in [4_model_viz.py](src/4_model_viz.py)
5. Create a final report and render it in [final_report.Rmd](doc/final_report.Rmd)

The output files creating when running this report are:

1. A `clean_data.csv` file that is used for the rest of the analysis.
2. Six graphs, saved as png files, stored in the `img` folder that help the user visualize the data we are using for the analysis.
3. Six small dataframes stored as csv files in the `results` folder.
4. An image called `depth_compare.png`, that shows the results of the 10-fold cross validation, saved in the `results` folder.
5. The decision tree code model, saved in the `results` folder as `final_model.sav`.
6. A visual representation of the decision tree, called `spills_tree_model.png` a png file in the `results` folder.
7. Rendered markdown and rendered html versions of the final analysis report, saved in the `doc` folder.

#### Reproduce with Docker

This report can be reproduced using Docker. To run the analysis using Docker:
1. Clone/download this repository.
2. Navigate to the root of this project in your terminal.
3. Type the following command in your terminal (filling in PATH_ON_YOUR_COMPUTER with the absolute path to the root of this project on your computer):

`docker run --rm -v PATH_ON_YOUR_COMPUTER:/home/alberta_oil_spills alyciakb/dsci_522_alberta-oil-spills make -C '/home/alberta_oil_spills' all`

4. To clean and remove files created by running the analysis:

`docker run --rm -v PATH_ON_YOUR_COMPUTER:/home/alberta_oil_spills alyciakb/dsci_522_alberta-oil-spills make -C '/home/alberta_oil_spills' clean`


#### Reproduce with Makefile:

This report can be run in the Docker environment or without Docker. To run this report directly from your terminal, we have provided a `Makefile` that will run the scripts in the correct order and produce all output. To run the analysis using the `Makefile`:

1. Clone this repo.
2. Navigate to the root of this project in your terminal.
3. Type the following command in your terminal:  `make all`.
4. To remove files created by the  `Makefile`, type the following command in your terminal: `make clean`.


Dependencies
--------

**R & R Libraries:**

- `R (version 3.5.1)`
- `rmarkdown (version 1.10)`
- `tidyverse (version 1.2.1)`
- `lubridate (version 1.7.4)`
- `gridExtra (version 2.3)`

**Python & Python Libraries:**

- `Python (version 3.7.1)`
- `numpy (version 1.15.1)`
- `pandas (version 0.23.2)`
- `seaborn (version 0.9.0)`
- `matplotlib (version 3.0.2)`
- `scikit-learn/sklearn (version 0.20.1)`
- `graphviz (version 0.10.1)`


Release History
--------

| Version | Description |
| ------- | ----------- |
| [V1.0](https://github.com/UBC-MDS/DSCI_522_Alberta-Oil-Spills/releases/tag/V1.0) | Initial Project Proposal |
| [V2.0](https://github.com/UBC-MDS/DSCI_522_Alberta-Oil-Spills/releases/tag/V2.0) | Milestone 1 - Project Analysis First Draft Complete |
| [V3.0](https://github.com/UBC-MDS/DSCI_522_Alberta-Oil-Spills/releases/tag/V3.0) | Milestone 2 - Makefile Automation Added & Project Analysis Edits |
