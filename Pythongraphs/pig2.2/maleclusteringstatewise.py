import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
data= pd.read_csv("part-r-00000.csv",header=None)
z=LabelEncoder()
kmeans=KMeans(n_clusters=3)
#colors=np.array(["Brown","Green","Red"])
print(data)
k=data[data[0]=='Male']
k=k[[1,2]]
k["numericalstate"]=z.fit_transform(k[1])+1
j=k[["numericalstate",2]]
kmeans.fit(j)
print(j)
print(k)
colors=np.array(["Green","Red","Brown"])
plt.scatter(k[1],j[2],c=colors[kmeans.labels_])
plt.xticks(rotation="vertical")
plt.xlabel("State")
plt.ylabel("Number of suicide")
plt.title("Number of suicides clustered by the male")
print(k)
plt.show()