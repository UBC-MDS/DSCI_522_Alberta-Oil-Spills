# 1_data_cleaning.R
# Huijue Chen, Nov. 22, 2018
#
# This script reads a .R data import file as input and outputs a cleaned data .csv file.
# It takes an input filename and output filename as variable arguments.
# Arguments:
#     ARG1 = input file path
#     ARG2 = output file path
# Usage: Rscript src/1_data_cleaning.R

#' load dependencies
library(lubridate)
library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

main <- function() {
  #' Read in the data
  oil_spills <- as_tibble(read.csv(input_file))


  #' 1. Remove all the rows with null/empty/`unkown` values (mostly in the columns of `source`, `substance`, `volume`, `volume_units`)

  oil_spills <-oil_spills[!grepl("Unknown", oil_spills$source),]
  oil_spills <-oil_spills[complete.cases(oil_spills), ]

  #' 2. Update volume and volume unit into consistent number format,
  #' and change `volume` column to reflect the actual volume
  #' then group the volumes into 3 groups,
  #' drop `other`.

  oil_spills <- oil_spills %>%
        mutate(volume = if_else(volume_units == "103m3", volume * 10**3, volume)) %>%
        mutate(volume = if_else(volume < 0.1, 0,
                              if_else(volume <= 10, 1, 2))) %>%
        filter(volume != 0) %>%

  #' 3. Put all the dates in the ISO format,
  #'    Then group the dates into by the quarters of the years, such as Jan-Mar would be Quarter 1.
        mutate(month = month(mdy(date)),
                             year_quarter = if_else(month <= 3, 1,
                                            if_else(month <= 6, 2,
                                            if_else(month <= 9, 3, 4)))) %>%

  #' 4. Group the sources into 4 different groups, `pipeline`, `battery`, `well`, and `other`,
  #'    Drop `other`
         mutate(source = if_else(str_detect(source, "Well"), "well",
                         if_else(str_detect(source, "Pipeline"), "pipeline",
                         if_else(str_detect(source, "Batt"),"battery", "Other")))) %>%
         filter(source != "Other") %>%

  #' 5. Group the substance into 4 different groups, `water`, `oil`, `gas`, and `other`
  #'    Drop `other`
         mutate(substance = if_else(str_detect(substance, "Water"), "water",
                            if_else(str_detect(substance, "Oil"), "oil",
                            if_else(str_detect(substance, "Gas Production"),
                                    "gas","other")))) %>%
         filter(substance != "other") %>%

  #' 6. Capitalize the `location` column to group the same location together.
         mutate(location = toupper(location)) %>%

  #' 7. Drop the columns with detailed information that will no longer be in use.
         select(-month, -volume_units)

  #' Export the data after cleaning
         write.csv(oil_spills, file = output_file)
}

# call main function
main()

####### Testing if grouping processes were done correctly:

#oil_source <-oil_spills %>% group_by(source) %>% summarise(n=n())
#oil_loc <-oil_spills %>% group_by(location) %>% summarise(n=n())
#oil_substance <-oil_spills %>% group_by(substance) %>% summarise(n=n())
