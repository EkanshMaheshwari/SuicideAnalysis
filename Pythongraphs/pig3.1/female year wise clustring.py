import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
data= pd.read_csv("part-r-00000.csv",header=None)
kmeans=KMeans(n_clusters=3)
data=data[data[0]=="Female"]
print(data)
l=data[[1,2]]
kmeans.fit(l)
color=np.array(["Red","Green","Brown"])
plt.scatter(data[1],data[2],c=color[kmeans.labels_])
plt.xlabel("Year")
plt.ylabel("Number of suicide")
plt.title("Clustering by female suicides yearwise")
plt.xticks(data[1])
plt.show()