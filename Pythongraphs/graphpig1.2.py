import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.colors import _ColorMapping

type = pd.read_csv("pig1.2\part-r-00000.csv",header=None)
print(type)
i=1
s=1
a =[]
b=[]
l=1
for i in type[0]:
    a.append(s)
    b.append(l)
    l=l+1
print (b)
print(type[0][1])
plt.bar(b,type[1],align='center',width=3)
plt.xticks(b,type[0])
plt.xticks(rotation='vertical')
plt.verticalalignment='top'
plt.xlabel('State')
plt.ylabel('Year')
plt.title('No of suicides in each year every state')
plt.show()
