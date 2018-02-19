from email._header_value_parser import Header
from sklearn import preprocessing
import numpy as np
import pandas as pd
from sklearn import datasets
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from matplotlib import style
style.use("ggplot")

data=pd.read_csv('part-r-00000.csv',header=None)
data.columns=['Year','Numbe']
#x= preprocessing.scale(data)
a=KMeans(n_clusters=3)
a.fit(data)
colormap=np.array(['Green','Red','Brown'])
s=data.Year
z = plt.bar(data.Year, data.Numbe, color=colormap[a.labels_])
plt.xticks(data.Year)
plt.xlabel("Year")
plt.ylabel("Number of suicides")
plt.title("Clustering by number of suicides each year")
plt.show()
print(a)