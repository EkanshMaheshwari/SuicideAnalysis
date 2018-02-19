import matplotlib.pyplot as plt

#data
x=[1,2,4]
y=[11,12,8]
prop_iter = iter(plt.rcParams['axes.prop_cycle'])

for i in range(0,len(x)):
  plt.bar(x[i],y[i],color=next(prop_iter)['color'])

plt.show()