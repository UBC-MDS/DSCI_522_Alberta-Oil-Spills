DSCI 522
================

Contributors
------------

-   `Alycia Butterworth`: [alyciakb](https://github.com/alyciakb)
-   `Huijue (Juno) Chen`: [huijuechen](https://github.com/huijuechen)

Latest
------

-   Date: November 15, 2018
-   Release v1.0

Data Set
--------

We are using the dataset "Alberta Oil Spills 1975-2013" from Energy Resources Conservation Board (ERCB), provided by the City of Edmonton. The dataset can be found [online here.](https://data.edmonton.ca/Environmental-Services/Alberta-Oil-Spills-1975-2013/ek45-xtjs)

**To load the data set in Python:**

<<<<<<< HEAD
``` r
oil_spills <- as_tibble(read.csv("data/AlbertaOilSpills_1975-2013.csv"))
print(oil_spills)
=======
```Python
import pandas as pd

oil_spills = pd.read_csv("data/AlbertaOilSpills_1975-2013.csv") 
print(oil_spills.head(10))
>>>>>>> 2936b423b5b2f62c188fdf29b6be252ce83d80d1
```
![Oil Spills Data Frame](img/data_asDF.png)

<<<<<<< HEAD
    ## # A tibble: 15,351 x 7
    ##    date      cause      source      location substance volume volume_units
    ##    <fct>     <fct>      <fct>       <fct>    <fct>      <dbl> <fct>       
    ##  1 July 22 … Operator … Multiphase… Midnapo… ""          NA   ""          
    ##  2 March 02… Operator … Unknown     Midnapo… ""          NA   ""          
    ##  3 March 07… Operator … Multiphase… Midnapo… ""          NA   ""          
    ##  4 12/8/2003 Equipment… Oil Well    RED DEER Propane      0.1 103m3       
    ##  5 December… Operator … Natural Ga… Wainwri… ""          NA   ""          
    ##  6 December… Operator … Water Pipe… Wainwri… ""          NA   ""          
    ##  7 1/4/2008  Operator … Unknown     Red Deer Condensa…    0.1 m3          
    ##  8 March 02… Operator … Other Pipe… RED DEER ""          NA   ""          
    ##  9 January … Operator … Sour Gas P… Red Deer ""          NA   ""          
    ## 10 6/12/2007 Equipment… Oil Well    Red Deer Air          0.1 103m3       
    ## # ... with 15,341 more rows
=======
-----------------------------
>>>>>>> 2936b423b5b2f62c188fdf29b6be252ce83d80d1

Question for Initial Analysis
-----------------------------

<<<<<<< HEAD
Are there differences in the spill location, time of year (month), source (well, pipeline, etc), type of substance spilled and volume spilled between an equipment failure caused oil spill and operator (human) error caused oil spill in Alberta?

*This is an exploratory question, the purpose of it is to determine which, if any, factors are indicitive of the cause of an oil spill in Alberta. If we find there to be a meaningful relationship between any of the factors and the cause of the spill, this analysis could serve as a starting point for further testing and hypotheses.*

Are we able to predict with 90% or more accuracy whether an Alberta oil spill is caused by equipment failure or operator error when given the inputs: spill location, time of year (month), source (well, pipeline, etc), type of substance spilled and volume spilled?

Given the inputs: spill location, time of year (month), source (well, pipeline, etc), type of substance spilled and volume spilled, are we able to predict wth 90% or more accuracy whether an Alberta oil spill is caused by equipment failure or operator error?

*This is an exploratory question using predictive mechanisms?*
=======
Are we able to predict with 90% or more accuracy whether an Alberta oil spill is caused by equipment failure or operator error when given the inputs: spill location, time of year (month), source (well, pipeline, etc), type of substance spilled and volume spilled?

Given the following inputs: spill location, time of year (month), source (well, pipeline, etc), type of substance spilled and volume spilled, are we able to predict with 90% or more accuracy whether an Alberta oil spill is caused by equipment failure or operator error?

*This is predictive? Or exploratory using predictive mechanisms?*

-----------------------------
>>>>>>> 2936b423b5b2f62c188fdf29b6be252ce83d80d1

Analysis Plan
-------------

<<<<<<< HEAD
This question requires five hypothesis tests, one for each of the factors:

1.  spill location
2.  time of year (month)
3.  source (well, pipeline, etc)
4.  type of substance released
5.  volume released

Depending on whether the factor is numerical or categorical, we will calculate the mean or proportion and a confidence interval for both both equipment failure caused accidents and operator error accidents of each factor. We will plot the data to have a visual representation of our factors.

Next we will start our hypothesis testing.

Each hypothesis test will have the following null and alternative hypotheses: *H*<sub>0</sub>: There are no differences between the \[factor\] when the cause of an Alberta oil spill is equipment failure or operator error. *H*<sub>*A*</sub>: There is a difference between the \[factor\] when the cause of an Alberta oil spill is equipment failure or operator error.

We will be using the simulation method to complete our hypothesis tests. For each factor we will define a sample test statistic, use permutation to create a distribution for our test statistic, plot the threshold quantile lines on our distribution graph (based on the selected alpha value), and plot our sample test statistic. We will calculate the p-value and compare it to our alpha value.

Finally, we will reject or fail to reject the null hypothesis for each factor. We will need to keep in mind that because we are calculating five hypothesis tests, we may encounter a false positive reading. If we have a situation where the p-value is close to the alpha value, we may need to examine our confidence intervals to determine whether to reject or fail to reject the null hypothesis.
=======
First, we will clean our data set to only use data points that have all the necessary input and output data. We will then create five graphs, one for each feature. The graphs will have two sets of data displayed: how the feature relates to target 1 (Equipment Failure) and how the feature relates to target 2 (Operator Error). If all of the graphs show little differences between those two sets of data, we can expect that they are not indicitive of the cause of the oil spill and that our model will not be accurate in predicting the target.

Regardless, we will then create a supervised learning decision tree model that will take the following five features and output one of the following targets:

**Features:**
  1. spill location
  2. time of year (month)
  3. source (well, pipeline, etc)
  4. type of substance released
  5. volume released

**Target Options:**
  1. Equipment Failure
  2. Operator Error
  
The next step is to test the model using the same data set to see if the model predicts the correct target. Creating a dataframe that compares the true targets to the predicted targets, we can calculate and communicate the accuracy of our model.

-----------------------------
>>>>>>> 2936b423b5b2f62c188fdf29b6be252ce83d80d1

Analysis Presentation
---------------------

<<<<<<< HEAD
The graphics we will create that will be included with our analysis conclusions will be:

1.  Confidence interval graphs
2.  Simulation hypothesis graphs
3.  A table with information for each factor, including: confidence intervals, sample test statistic, p-value, and results (reject/do not reject *H*<sub>0</sub>).
=======
We will have the following series of graphics to present with our written analysis:
 1. Graphs that show how each feature relates to each target
 2. The decision tree that shows how the model is making the decision
 3. A table that shows the accuracy of our model predictions
>>>>>>> 2936b423b5b2f62c188fdf29b6be252ce83d80d1
