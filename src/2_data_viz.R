# 1_data_viz.R
# Alycia Butterworth, Nov. 22, 2018
#
# This script creates graphs and a table to visualize the Alberta Oil Spills data.
# It reads the clean_data.csv as input and outputs graph images as PNGs.
# It takes an input filename, an output filename, and a column category
# as the variable arguments.
# Arguments:
#     ARG1 = input file path
#     ARG2 = output file path
# Usage: Rscript src/2_data_viz.R

#' load dependencies
library(dplyr)
library(ggplot2)
library(gridExtra)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output <- args[2]
category <- args[3]

main <- function() {

  #' Read in the csv file
  oil_spills <- read.csv(input_file)

  #' Graph number of spills by each cause
  if(category == "cause") {
    cause_graph <- oil_spills %>% ggplot(aes(cause, fill = cause)) +
    geom_bar(stat = 'count') +
    labs(x = "Cause of Spill", y = "Number of Spills",
         title = "Spills at Alberta Oil Fields, 2002-2013") +
    theme_minimal() +
    theme(legend.position = "none")

    #' Save the `cause` graph as an output file
    ggsave(output, width = 4, height = 4)
  }

  #' Create graphs comparing features by cause type
  #' Use proportions as y-axis to create meaningful comparisons
  feature_graph <- function(feature) {
    feature <- rlang::enquo(feature)

    #' Calculate the proportion for each feature, grouped by `cause`` type
    proportions <- oil_spills %>% group_by(!!feature, cause) %>%
      summarize(count = n()) %>%
      left_join(oil_spills %>%  group_by(cause) %>% summarize(total_count = n())) %>%
      mutate(prop = count/total_count)

    #' Create the proportions graphs
    proportions %>% ggplot(aes(x = factor(!!feature), y = prop, fill = cause)) +
     geom_bar(width = 0.6, position = position_dodge(width = 0.6), stat = 'identity') +
     ylab("Proportion of Spills") +
     theme_minimal() +
     theme(legend.position = "bottom",
           legend.box.background = element_rect(colour = "black", fill=NA))
  }

  #' Call the `feature_graph` function for all five features
  #' Graph `location` feature
  if(category == "location") {
    location_graph <- feature_graph(location) +
      xlab("Location") +
      ggtitle("Proportions of Spills by Location") +
      theme(axis.text.x = element_text(angle = 90))

    #' Save the `location` proportions graph as an output file
    ggsave(output, width = 4, height = 4)
  }

  #' Graph `year_quarter` feature
  if(category == "time") {
    year_quarter_graph <- feature_graph(year_quarter) +
      scale_x_discrete(labels=c("Q1\nJan-Mar", "Q2\nApr-Jun",
                                "Q3\nJul-Sep", "Q4\nOct-Dec")) +
      xlab("Time of Year") +
      ggtitle("Proportions of Spills by Time of Year")

    #' Save the `year_quater` proportions graph as an output file
    ggsave(output, width = 4, height = 4)
    }

  #' Graph `source` feature
  if(category == "source") {
    source_graph <- feature_graph(source) +
      xlab("Spill Source") +
      ggtitle("Proportions of Spills by Spill Source")

    #' Save the `source` proportions graph as an output file
    ggsave(output, width = 4, height = 4)
    }

  #' Graph `substance` feature
  if(category == "substance") {
    substance_graph <- feature_graph(substance) +
      xlab("Substance Spilled") +
      ggtitle("Proportions of Spills by Substance Spilled")

    #' Save the `substance` proportions graph as an output file
    ggsave(output, width = 4, height = 4)
    }

  #' graph `volume` feature
  if(category == "volume") {
    volume_graph <- feature_graph(volume) +
      xlab("Volume Spilled (metres cubed)") +
      scale_x_discrete(labels=c("0.1 to 10 Cubic Metre", "10+ Cubic Metre")) +
      ggtitle("Proportions of Spills by Volume of Spilled")

    #' Save the `volume` proportions graph as an output file
    ggsave(output, width = 4, height = 4)
  }

}

# call main function
main()
