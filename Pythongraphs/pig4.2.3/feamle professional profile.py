import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
data= pd.read_csv("part-r-00000.csv",header=None)
z=LabelEncoder()
kmeans=KMeans(n_clusters=3)
data=data[data[1]=='Female']
data["numerical"]=z.fit_transform(data[0])
k=data[["numerical",2]]
kmeans.fit(k)
color=np.array(["Green","Red","Brown"])
plt.scatter(data[0],data[2],c=color[kmeans.labels_])
plt.xlabel("Profesional profile of female commiting suicide")
plt.ylabel("Number of Suicide")
plt.title("Clustering by the professional profile of the female commiting suicide")
plt.xticks(rotation="vertical")
print(data)
print(k)
plt.show()