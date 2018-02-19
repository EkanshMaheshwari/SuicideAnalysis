import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
data= pd.read_csv("part-r-00000.csv",header=None)
z=LabelEncoder()
#data["numericalstate"]=z.fit_transform(data[0])+1
#data["numericalyear"]=z.fit_transform(data[1])+1
#k=data[["numericalstate","numericalyear",2]]
kmeans =KMeans(n_clusters=3)
colors=np.array(["Green","Red","Brown"])
#data["cluster"]=kmeans.labels_
s=data[data[0]=="SIKKIM"]
#s["numericalstate"]=z.fit_transform(s[0])+1
print(s)
l=s[[1,2]]
z =kmeans.fit(l)
plt.scatter(l[1],s[2],c=colors[kmeans.labels_])
plt.title("Sikkim State year wise clustering of suicide")
plt.xlabel("Year")
plt.ylabel("Number of suicides")
print(kmeans.labels_)
print(s)
plt.xticks(s[1])
#plt.xticks(rotation="vertical")
plt.show()
#
#v["numericalstate"]=z.fit_transform(s[0])+1