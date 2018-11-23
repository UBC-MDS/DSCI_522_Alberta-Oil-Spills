import pandas as pd

oil_spills = pd.read_csv("../data/AlbertaOilSpills_1975-2013.csv") 
print(oil_spills.head(10))