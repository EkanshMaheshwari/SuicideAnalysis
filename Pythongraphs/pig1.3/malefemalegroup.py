import numpy as np
import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
import matplotlib.pyplot as plt
data = pd.read_csv("part-r-00000.csv",header=None)
lbmake =LabelEncoder()
data["numerical"]=lbmake.fit_transform(data[0])+1
print(data)
kmeans=KMeans(n_clusters=2)
x=data[[1,"numerical"]]
kmeans.fit(x)
colormap =np.array(["Green","Red"])
print(kmeans.labels_)
z=plt.scatter(data[0],data[1],c=colormap[kmeans.labels_])
plt.xlabel("Gender")
plt.ylabel("Number of suicides")
plt.title("Clustering by the gender")
print(kmeans.labels_)
plt.yticks(data[1])
plt.show()