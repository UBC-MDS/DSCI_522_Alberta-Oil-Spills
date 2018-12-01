
# Makefile
# Authors: Alycia Butterworth, Huijue Chen
# Date: November 28, 2018
# Purpose: This script is to create an entire data analysis project pipline
# Usage: clean inputs from previous saved inputs by "clean:", run all scripts by "all :"

#####################################
# Run all scripts
#####################################
all : doc/final_report.md

#####################################
# Run Scripts
#####################################

# step 1. Import and clean data
data/clean_data.csv : data/AlbertaOilSpills_1975-2013.csv src/1_data_cleaning.R
	Rscript src/1_data_cleaning.R data/AlbertaOilSpills_1975-2013.csv data/clean_data.csv

# step 2. Data visualization
img : data/clean_data.csv src/2_data_viz.R
	Rscript src/2_data_viz.R data/clean_data.csv img/cause_graph.png cause
	Rscript src/2_data_viz.R data/clean_data.csv img/location_graph.png location
	Rscript src/2_data_viz.R data/clean_data.csv img/time_of_year_graph.png time
	Rscript src/2_data_viz.R data/clean_data.csv img/source_graph.png source
	Rscript src/2_data_viz.R data/clean_data.csv img/substance_graph.png substance
	Rscript src/2_data_viz.R data/clean_data.csv img/volume_graph.png volume

# step 3. Analyze the data and find a decision tree
results : data/clean_data.csv src/3_model_fitting.py
	python src/3_model_fitting.py "./data/clean_data.csv"  "./results/"

# step 4. Decision tree visualization
results_viz : results src/4_model_viz.py
	python src/4_model_viz.py "./results/" "./results/"

# step 5. convert oil_spills_model.pdf to oil_spills_model.png
results/oil_spills_model.png : results results_viz
	sips -s format png results/oil_spills_model.pdf --out results/oil_spills_model.png

# step 6. render the final report
doc/final_report.md : doc/final_report.Rmd results results_viz results/oil_spills_model.png img
	Rscript -e "rmarkdown::render('./doc/final_report.Rmd', 'github_document')"

#####################################
# Remove all files
#####################################
clean:
	rm -f data/clean_data.csv
	rm -f img/cause_graph.png
	rm -f img/time_of_year_graph.png
	rm -f img/location_graph.png
	rm -f img/source_graph.png
	rm -f img/substance_graph.png
	rm -f img/volume_graph.png
	rm -f results/cause.csv
	rm -f results/depth_compare.png
	rm -f results/feature_compare.csv
	rm -f results/finalized_model.sav
	rm -f results/location.csv
	rm -f results/model_score.csv
	rm -f results/oil_spills_model
	rm -f results/oil_spills_model.pdf
	rm -f results/oil_spills_model.png
	rm -f results/source.csv
	rm -f results/substance.csv
	rm -f doc/final_report.md
	rm -f final_report.html
