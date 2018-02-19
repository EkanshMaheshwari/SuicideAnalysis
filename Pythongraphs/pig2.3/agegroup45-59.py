import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
data= pd.read_csv("part-r-00000.csv",header=None)
z=LabelEncoder()
kmeans=KMeans(n_clusters=3)
#colors=np.array(["Brown","Green","Red"])
#print(data)
j=data[data[0]=='45-59']
j["numerical"]=z.fit_transform(j[1])+1
k=j[["numerical",2]]
print(j)
print(k)
kmeans.fit(k)
color=np.array(["Brown","Red","Green"])
plt.scatter(j[1],k[2],c=color[kmeans.labels_])
plt.xlabel("State")
plt.xticks(rotation="vertical")
plt.ylabel("Number of suicide")
plt.title("Age group 45-59 clustering of the suicides")
plt.show()
