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

**To load the data set in R:**

``` r
oil_spills <- as.tibble(read_csv("data/AlbertaOilSpills_1975-2013.csv"))
print(oil_spills)
```

    ## # A tibble: 15,351 x 7
    ##    date      cause      source      location substance volume volume_units
    ##    <chr>     <chr>      <chr>       <chr>    <chr>      <dbl> <chr>       
    ##  1 July 22 … Operator … Multiphase… Midnapo… <NA>        NA   <NA>        
    ##  2 March 02… Operator … Unknown     Midnapo… <NA>        NA   <NA>        
    ##  3 March 07… Operator … Multiphase… Midnapo… <NA>        NA   <NA>        
    ##  4 12/8/2003 Equipment… Oil Well    RED DEER Propane      0.1 103m3       
    ##  5 December… Operator … Natural Ga… Wainwri… <NA>        NA   <NA>        
    ##  6 December… Operator … Water Pipe… Wainwri… <NA>        NA   <NA>        
    ##  7 1/4/2008  Operator … Unknown     Red Deer Condensa…    0.1 m3          
    ##  8 March 02… Operator … Other Pipe… RED DEER <NA>        NA   <NA>        
    ##  9 January … Operator … Sour Gas P… Red Deer <NA>        NA   <NA>        
    ## 10 6/12/2007 Equipment… Oil Well    Red Deer Air          0.1 103m3       
    ## # ... with 15,341 more rows

Question for Initial Analysis
-----------------------------

Can we accurately predict the cause of oil spills (as either Equipment Failure or Operator Error) in Alberta based on the incident features: spill location, company, month, type of substance released and volume released?

*This is a predictive question.*

Analysis Plan
-------------

Use supervised machine learning to create a decision tree model that will take five features and output a cause.

**Features:** 
1. spill location 
2. company 
3. month 
4. source (well, pipeline, etc) 
5. type of substance released 6. volume released

**Target Options:** 1. Equipment Failure 2. Operator Error

Analysis Presentation
---------------------

We will have a series of graphics, including: 1. The decision tree that shows how the model is making the decision 2. Supporting graphs that show which features are most predictive of the targets 3. A table that shows the accuracy of our model predictions
