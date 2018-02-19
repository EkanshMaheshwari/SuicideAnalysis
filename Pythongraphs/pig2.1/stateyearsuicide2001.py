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
s=data[data[1]==2001]
s["numericalstate"]=z.fit_transform(s[0])+1
print(s)
l=s[["numericalstate",2]]
print(l)
z =kmeans.fit(l)
plt.scatter(s[0],s[2],c=colors[kmeans.labels_])
plt.title("Year 2001 state wise clustering of risk of the suicides")
plt.xlabel("States")
plt.ylabel("Number of suicides")
print(kmeans.labels_)
plt.xticks(rotation="vertical")
plt.show()
#
#v["numericalstate"]=z.fit_transform(s[0])+1
