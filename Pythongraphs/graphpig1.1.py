from matplotlib import pyplot as plt
import numpy as np
x,y =np.loadtxt('pig1.1\part-r-00000.csv',unpack=True,delimiter=',')
plt.bar(x,y)
plt.title('No of suicides in each state')
plt.xlabel('Year')
plt.ylabel('No of Suicides')
plt.show()