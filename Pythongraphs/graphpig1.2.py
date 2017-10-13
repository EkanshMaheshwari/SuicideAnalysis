import pandas as pd
import matplotlib.pyplot as plt
type = pd.read_csv("pig1.2\part-r-00000.csv",header=None)
print (type)
i=1
s=1
a =[]
b=[]
l=1
for i in type[0]:
    a.append(s)
    b.append(l)
    l=l+6
print (b)
plt.bar(b,type[1],align='center',width=3)
plt.xticks(b,type[0])
plt.xticks(rotation=34)
plt.verticalalignment='top'
plt.xlabel('aa')
plt.
plt.show()
