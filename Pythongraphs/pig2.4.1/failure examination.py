import numpy as np
import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
import matplotlib.pyplot as plt
data = pd.read_csv("part-r-00000.csv",header=None)
lbmake =LabelEncoder()
data=data[data[1]=="Failure in Examination"]
data["numerical"]=lbmake.fit_transform(data[0])
print(data)
kmeans=KMeans(n_clusters=3)
print(data)
l=data[["numerical",2]]
kmeans.fit(l)
color=np.array(["Green","Brown","Red"])
plt.scatter(data[0],data[2],c=color[kmeans.labels_])
plt.xlabel("State")
plt.ylabel("Number of suicide")
plt.title("Failure in examination cluster state wise")
plt.xticks(rotation="vertical")
plt.show()