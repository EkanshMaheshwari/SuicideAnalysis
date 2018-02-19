import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
z=LabelEncoder()
data=pd.read_csv("part-r-00000.csv",header=None)
data["numerical"]=z.fit_transform(data[0])+1
print(data)
kmeans=KMeans(n_clusters=3)
x=data[["numerical",1]]
print(x)
kmeans.fit(x)
colors=np.array(["Green","Brown","Red"])
plt.scatter(data[0],data[1],c=colors[kmeans.labels_])
plt.xticks(rotation="vertical")
plt.xlabel("Professional Profile")
plt.ylabel("Number of the suicides")
plt.title("Clustering by the proffesional profile of the people")
plt.show()
