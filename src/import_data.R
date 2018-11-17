# import_data.R
# Huijue Chen, Nov 17 2018
#
# This script imports the data from AlbertaOilSpills_1975-2013.csv
# And print the tibble
#
# Usage: Rscript import_data.R

oil_spills <- as_tibble(read.csv("data/AlbertaOilSpills_1975-2013.csv"))
print(oil_spills)