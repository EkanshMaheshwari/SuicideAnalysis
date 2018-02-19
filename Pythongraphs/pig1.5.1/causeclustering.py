import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
data=pd.read_csv("part-r-00000.csv",header=None)
#print(data)
z=LabelEncoder()
data["numerical"]=z.fit_transform(data[0])+1
#print(data)
kmeans=KMeans(n_clusters=3)
x=data[["numerical",1]]
print(x)
kmeans.fit(x)
#color=np.array(["Green","Red","Brown"])
colors=np.array(["Green","Brown","Red"])
plt.scatter(data[0],data[1],c=colors[kmeans.labels_])
print(kmeans.labels_)
plt.ylabel("Number of suicides")
plt.xlabel("The causes")
plt.xticks(rotation="vertical")
plt.title("Cause wise clustering")
plt.show()