from sklearn.preprocessing import LabelEncoder
import pandas as pd
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt
import numpy as np
type= pd.read_csv("part-r-00000.csv",header=None)
print(type)
lbmake=LabelEncoder()
type["numerical"]=lbmake.fit_transform(type[0])+1
kmeans = KMeans(n_clusters=3)
x=type[["numerical",1]]
print(x)
kmeans.fit(x)
colormap=np.array(['Red','Green','Brown'])
z=plt.scatter(type[0],type[1],c=colormap[kmeans.labels_])
# for cluster konsa group me hai dikhane ke liye hai aur kuch nahi print(kmeans.labels_)
#type["cluster"]=kmeans.labels_
#print(type)
#plt.yticks([50,734825,814059,849936,901945,538946,451535,330858,302354])
plt.xticks(rotation="vertical")
plt.xlabel("States")
plt.ylabel("Number of suicides")
plt.title("Clustering by number of suicides each states")

plt.show()

#state wale ka complete code