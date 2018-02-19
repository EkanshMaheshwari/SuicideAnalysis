import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import LabelEncoder
from sklearn.cluster import KMeans
import pandas as pd
data = pd.read_csv("part-r-00000.csv",header=None)
lbmake =LabelEncoder()
data["numerical"]=lbmake.fit_transform(data[0])
print(data)
x=data[["numerical",1]]
kmeans=KMeans(n_clusters=3)
kmeans.fit(x)
colors=np.array(["Red","Green","Brown"])
plt.scatter(data[0],data[1],c=colors[kmeans.labels_])
plt.xlabel("The age group")
plt.yticks(data[1])
plt.ylabel("Number of the suicides")
plt.title("Clustering by the age groups")
print(kmeans.labels_)
plt.show()
