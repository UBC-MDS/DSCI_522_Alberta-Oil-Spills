Alberta Oil Spills Final Report
================
Nov. 24, 2018

Introduction
------------

The purpose of this project is to determine the three factors that are most predictive of the cause of spill incidents in the Alberta oil industry.

The two spill causes we looked at were: Equipment Failure and Operator (human) Error. The factors we tested on were: the field house location of the spill, the time of year it occured, the source of the spill (well, pipeline or battery), the substance spilled (oil, gas production, or water), and the volume spilled.

The Data
--------

The data we used in this analysis was compiled and managed by the Energy Resources Conservation Board (ERCB) and spans 12 years, 2002-2013. We removed all incidents that did not have complete data about the five factors or the cause type and did not fall into our source or substance categories.

After cleaning our data set, we had 10,985 observations and produced the following table:

*Table 1: A Sample of the Alberta Oil Spills Cleaned Data Set*

------------------------------------------------------------------------

The majority of the spills (9,082 observations) were as a result of equipment failure, and the remaining 1,903 were a result of operator error.

<img src="../img/cause_graph.png" alt="Fig 1: Spills by Cause Graph" width="400"/>

*Figure 1: Overall Number of Spills by Each Cause Type*

Due to the large difference in number of equipment failure versus operator error caused spills, we looked at proportions to visualize each factor in a comparative way. For example, on the location graph below you can see that almost 24% of all operator error caused spills occur in Bonnyville, whereas only 10% of all equipment failure caused spills occur in Bonnyville.

![Fig 2: Location Graph](../img/location_graph.png) *Figure 2: Proportions of spills of each cause type by field house location.*

![Fig 3: Time of Year Graph](../img/time_of_year_graph.png) *Figure 3: Proportions of spills of each cause type by the quarter of the year that it occured.*

![Fig: 4: Source of Spill Graph](../img/source_graph.png) *Figure 4: Proportions of spills of each cause type by the source of the spill.*

![Fig 5: Substance Spilled Graph](../img/substance_graph.png) *Figure 5: Proportions of spills of each cause type by the substance spilled.*

![Fig 6: Volume Spilled Graph](../img/volume_graph.png) *Figure 6: Proportions of spills of each cause type by the volume spilled*

**Note:** We divided the volume factor into only two groups: A "small" spill that resulted in 0.1 to 10*m*<sup>3</sup> volume of a substance being spilled or a "large" spill that resulted in over 10*m*<sup>3</sup> volume being spilled.

We used only two volume groups because over 60% of our data fall into the "small" category and we did not want to have the number of observations per volume group to be highly skewed. This is a drawback of our analysis, because the "large" spill category includes spills that are anywhere from 10.1*m*<sup>3</sup> up to the largest spill in our data set, an equipment failure caused pipeline incident in St. Albert in 2009 that resulted in 25 million *m*<sup>3</sup> of gas production being spilled. Obviously, those two spills are of a very different magnitude, but to keep the volume groups simple, fall into the same category in this analysis.

The Analysis
------------

In order to rank the predictive quality of our factors, we first fit a decision tree model. We represented each of our categorical variables as numbers. If you are interested in which numbers are associated with which variable, you can find the data in csv files within the [results](../results). We split our data into a training group (80% of the data) and a test group (20% of the data). We tested many potential depths and used 10-fold cross validation to test both the training and test accuracy of each model. When the user runs the command line arguments in their terminal for the script [3\_data\_fitting.py](../src/3_data_fitting.py), the optimal depth is chosen by the program and both the depth and testing accuracy are printed to the terminal. You can see the graphical comparison of model accuracy at the different depths at [results/depth\_compare](../results/depth_compare.png).

We produced the following decision tree:

![Fig 7: Decision Tree](../results/oil_spills_model.png)

*Figure 7: Decision Tree for determining cause type of an oil spill, based on the factors: location, time of year, source of spill, substance spilled, and volume spilled.*

The results of our test

The Results
-----------

The analysis calculated the gini scores of each of the five factors and ranked them as most predictive to least:

*Table 1: Ranking the Most Predictive to Least Predictive Factors*

Our results show that the best predictor in our analysis was the source of the spill. This result is compatible with our data visualization at the start of this report. You can see in Figure 4 that there are large differences between the two cause types for each variable within the `source` factor.

The question we set out to answer with this project was: "What are the top three predictors of the cause of an oil spill incident in Alberta?" Based on our analysis, the top predictors are:

1.  Source of spill
2.  Field location of spill
3.  Type of substance spilled

Limitations
-----------

We understand that our analysis has its limitations: - We only looked at five factors, but there are likely many other factors that relate to the cause of an oil spill. - As mentioned earlier, we only divided our data into two volume groups. - We did not take into consideration the quantity of oil or gas being produced or moved by the location or sources. - We addressed the substance spilled and volume spilled as separate entities, but it might be useful to think of them together (e.g. is differences in the average volumes spilled of each individual substance depending on the cause?) - The accuracy of our model is 83%, therefore approximately every 1 in 5 predictions by our model results in an incorrect answer. - There is likely a more accurate machine learning approach to answer this question, but we haven't learned it yet.

Next Steps
----------

This analysis is only a tiny sliver of information that can be learned from this data set (and related data). If we were to continue working with it, the next questions we would like to ask are:

1.  Is production volume in an area a predictor of spill cause?
2.  Do spills increase or decrease linearly with production volume?
3.  Are the overall number of incidents per year increasing or decreasing over time?
4.  Are the number of incidents by cause type increasing or decreasing over time?
5.  Why are Operator Error caused incidents in Bonnyville so high? (See Figure 2)

The more we understand about the factors related to spill incidents, the more we can start to answer why and how spills happen. If we understand why and how they happen, companies can take preventative measures to hopefully help reduce the number of spills occuring and the severity of the spills.

References
----------

Data Source
