import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
data= pd.read_csv("part-r-00000.csv",header=None)
z=LabelEncoder()
kmeans =KMeans(n_clusters=3)
data=data[data[0]=="Male"]
print(data)
data["numerical"]=z.fit_transform(data[1])+1
l=data[["numerical",2]]
kmeans.fit(l)
color=np.array(["Red","Green","Brown"])
plt.scatter(data[1],data[2],c=color[kmeans.labels_])
plt.xlabel("Age group of the male commiting suicide")
plt.ylabel("Number of suicides")
plt.title("Age group wise male commiting suicide")
plt.show()
print(l)