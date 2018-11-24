# run_all.sh

###################################################
## 2018 Nov 24
## Huijue Chen
## This driver script completes the data analysis of the project.
## This script takes no arguments.
## Usage: bash run_all.sh
##################################################

# step 1 Clean data
Rscript src/1_data_cleaning.R src/import_data.R data/clean_data.csv

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

# step 5 make report
Rscript -e "rmarkdown::render('./doc/final_report.Rmd', 'github_document')"
