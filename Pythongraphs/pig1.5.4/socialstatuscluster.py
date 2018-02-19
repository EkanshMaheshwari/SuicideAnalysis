import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
data=pd.read_csv("part-r-00000.csv",header=None)
z=LabelEncoder()
data["numerical"]=z.fit_transform(data[0])
kmeans=KMeans(n_clusters=3)
x=data[[1,"numerical"]]
z=kmeans.fit(x)
colors=np.array(["Green","Red","Brown"])
print(kmeans.labels_)
plt.scatter(data[0],data[1],c=colors[kmeans.labels_])
plt.xticks(rotation="vertical")
plt.xlabel("Social Status of the person commiting suicide")
plt.ylabel("Number of the suicides  commited")
plt.title("Social status clustering")
plt.show()