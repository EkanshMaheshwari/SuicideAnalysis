import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
data= pd.read_csv("part-r-00000.csv",header=None)
z=LabelEncoder()
kmeans =KMeans(n_clusters=3)
data["numerical"]=z.fit_transform(data[0])
l=data[["numerical",2]]
kmeans.fit(l)
color=np.array(["Green","Red","Brown"])
plt.scatter(data[0],data[2],c=color[kmeans.labels_])
plt.xlabel("Educational status the person commiting suicide")
plt.ylabel("Number of Suicides")
plt.title("Clustering by the Educational Status of the person commiting suicide")
plt.xticks(rotation="vertical")
plt.show()