import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
datas= pd.read_csv("part-r-00000.csv",header=None)
kmeans=KMeans(n_clusters=3)
data=data[data[0]=="60+"]
data=data[[1,2]]
print(data)
kmeans.fit(data)
color=np.array(["Green","Red","Brown"])
plt.scatter(data[1],data[2],c=color[kmeans.labels_])
plt.xlabel("Year")
plt.ylabel("Number of suicides")
plt.title("Clusters by number of suicides in a year for age group 60+")
plt.xticks(data[1])
plt.show()