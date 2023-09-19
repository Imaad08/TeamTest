---
toc: True
comments: False
layout: post
title: Stock Simulator Graphs
description: Graphs for stock simulator
courses: {'compsci': {'week': 3}}
type: hacks
---

| | This blog takes 8 stocks and simulates how well a portfolio would do if invested. It also tells what the best weighting for each stock would be the most optimal. It gives important information such as risk, volatility, profit, Sharpe Ratio, etc. | | 

| | 8 stocks have been chosen at random which are Intel (INTC), Ford Motor Company (F), Walt Disney Co (DIS), Tesla (TSLA), Amazon (AMZN), Bank of America (BAC), Sony (SONY), and Meta (META) | | 

| | However it shows this process visually through the use of graphs and data tables. | |


```python
# Reading in the stocks of each stock and then creating a central data frame of each. 

import numpy as np
import pandas as pd
import pandas_datareader.data as web
# Get stock data  
all_data = {ticker: web.DataReader(ticker,'stooq')
           for ticker in ['INTC', 'F', 'DIS', 'TSLA', 'AMZN', 'BAC', 'SONY', 'META']}
# Extract the 'Adjusted Closing Price'
price = pd.DataFrame({ticker: data['Close']
                     for ticker, data in all_data.items() })

price
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>INTC</th>
      <th>F</th>
      <th>DIS</th>
      <th>TSLA</th>
      <th>AMZN</th>
      <th>BAC</th>
      <th>SONY</th>
      <th>META</th>
    </tr>
    <tr>
      <th>Date</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>2023-09-08</th>
      <td>38.0100</td>
      <td>12.30000</td>
      <td>81.58</td>
      <td>248.5000</td>
      <td>138.2300</td>
      <td>28.3600</td>
      <td>84.2200</td>
      <td>297.89</td>
    </tr>
    <tr>
      <th>2023-09-07</th>
      <td>38.1800</td>
      <td>11.96000</td>
      <td>80.57</td>
      <td>251.4900</td>
      <td>137.8500</td>
      <td>28.1300</td>
      <td>85.2300</td>
      <td>298.67</td>
    </tr>
    <tr>
      <th>2023-09-06</th>
      <td>36.9800</td>
      <td>12.07000</td>
      <td>80.98</td>
      <td>251.9200</td>
      <td>135.3600</td>
      <td>28.3900</td>
      <td>85.5000</td>
      <td>299.17</td>
    </tr>
    <tr>
      <th>2023-09-05</th>
      <td>36.7100</td>
      <td>12.09000</td>
      <td>81.19</td>
      <td>256.4900</td>
      <td>137.2700</td>
      <td>28.6500</td>
      <td>84.5400</td>
      <td>300.15</td>
    </tr>
    <tr>
      <th>2023-09-01</th>
      <td>36.6100</td>
      <td>12.14000</td>
      <td>81.64</td>
      <td>245.0100</td>
      <td>138.1200</td>
      <td>28.9800</td>
      <td>85.2600</td>
      <td>296.38</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>2018-09-17</th>
      <td>40.2749</td>
      <td>8.33527</td>
      <td>107.21</td>
      <td>19.6560</td>
      <td>95.4015</td>
      <td>27.4898</td>
      <td>58.1934</td>
      <td>160.58</td>
    </tr>
    <tr>
      <th>2018-09-14</th>
      <td>40.3824</td>
      <td>8.24767</td>
      <td>107.11</td>
      <td>19.6800</td>
      <td>98.5095</td>
      <td>27.5743</td>
      <td>58.3411</td>
      <td>162.32</td>
    </tr>
    <tr>
      <th>2018-09-13</th>
      <td>40.4097</td>
      <td>8.17819</td>
      <td>108.49</td>
      <td>19.2973</td>
      <td>99.4935</td>
      <td>27.3640</td>
      <td>56.6914</td>
      <td>161.36</td>
    </tr>
    <tr>
      <th>2018-09-12</th>
      <td>39.8432</td>
      <td>8.15184</td>
      <td>107.31</td>
      <td>19.3693</td>
      <td>99.5000</td>
      <td>27.6253</td>
      <td>56.4070</td>
      <td>162.00</td>
    </tr>
    <tr>
      <th>2018-09-11</th>
      <td>39.8432</td>
      <td>8.12587</td>
      <td>107.45</td>
      <td>18.6293</td>
      <td>99.3575</td>
      <td>28.0093</td>
      <td>55.7992</td>
      <td>165.94</td>
    </tr>
  </tbody>
</table>
<p>1257 rows × 8 columns</p>
</div>




```python
import matplotlib.pyplot as plt
```

| | This next code plots all 8 stocks on different planes on the same figure. This can be helpful for viewing each stock individually yet able to quickly see the rest of the stocks. | |

| | This code works by creating the figure, and set the figure to be broken into 8 squares (2 x 4). Then it sets the X and Y axis to be shared. Then each stock is plotted on their respective graph, set the color,  line type, and the, legend. | | 


```python
fig1, axes1 = plt.subplots(2,4, sharex = True, sharey = True)

axes1[0,0].plot(price['INTC'],'-', color = 'gold', label = 'INTC')
axes1[0,0].legend(loc = 'best')

axes1[0,1].plot(price['F'],'-', color = 'red', label = 'F')
axes1[0,1].legend(loc = 'best')

axes1[0,2].plot(price['DIS'],'-', color = 'blue', label = 'DIS')
axes1[0,2].legend(loc = 'best')

axes1[0,3].plot(price['TSLA'],'-', color = 'royalblue', label = 'TSLA')
axes1[0,3].legend(loc = 'best')

axes1[1,0].plot(price['AMZN'],'-', color = 'black', label = 'AMZN')
axes1[1,0].legend(loc = 'best')

axes1[1,1].plot(price['BAC'],'-', color = 'purple', label = 'BAC')
axes1[1,1].legend(loc = 'best')

axes1[1,2].plot(price['SONY'],'-', color = 'pink', label = 'SONY')
axes1[1,2].legend(loc = 'best')

axes1[1,3].plot(price['META'],'-', color = 'green', label = 'META')
axes1[1,3].legend(loc = 'best') 

# fig1.savefig('stocks1.png')
```


    

    


| <img src="https://i.ibb.co/yS39Zdf/stocks1.png" width = auto height = auto> |



```python
fig = plt.figure()
ax = fig.add_subplot(1,1,1)
plt.plot(price['INTC'], '-',color = 'gold', label = 'INTC')
plt.plot(price['F'],'-', color = 'red', label = 'F')
plt.plot(price['DIS'],'-', color = 'blue', label = 'DIS')
plt.plot(price['TSLA'],'-', color = 'royalblue', label = 'TSLA')
plt.plot(price['AMZN'],'-', color = 'black', label = 'AMZN')
plt.plot(price['BAC'],'-', color = 'purple', label = 'BAC')
plt.plot(price['SONY'],'-', color = 'pink', label = 'SONY')
plt.plot(price['META'],'-', color = 'green', label = 'META')
ax.legend(loc = 'best')
ax.set_ylabel("Price", fontsize=12)
ax.set_xlabel("Year", fontsize=12)
ax.set_title("Sample Portfolio", fontsize = 16)
# fig.savefig('stocks2.png')
```


    

    


| <img src="https://i.ibb.co/3FyyqLH/stocks2.png" width = auto height = auto > |

| | The standard deviation is how investors measure volatility and risk. STD measures the average distance from the mean, so the higher the STD the less concise the data is. In the finance world, if the STD is higher, that means that the price of the stock can be more unpredictable. This equates to risk. The lower the STD the better, and vice versa. | | 


```python
# finding standard deviation
price.std()
```




    INTC      9.271631
    F         3.717336
    DIS      29.862946
    TSLA    112.230378
    AMZN     32.588195
    BAC       6.760020
    SONY     21.678872
    META     68.657542
    dtype: float64



| | The correlation between each of the stocks shows how well the portfolio will do. The correlation in math shows the relationship and the proportion between two variables. In finance the correlation dictates how two stocks will react in relationship. In layman terms it shows if one stock will go up what will another stock do. Correlation ranges from -1 to 1, where -1 is the most optimal. | | 


```python
colors = ['gold', 'red', 'blue', 'royalblue', 'black', 'purple', 'pink', 'green']

fig6 = plt.figure(figsize=(6, 6))
axes6 = fig6.add_subplot(1, 1, 1)
priceSTD = price.std()
# Create the bar chart with custom colors
priceSTD.plot(ax=axes6, kind="bar", rot=45, color=colors)

axes6.set_ylabel("STD", fontsize=12)
axes6.set_xlabel("Stocks", fontsize=12)
axes6.set_title("STD of all 8 stocks", fontsize=20)

plt.show()

# fig6.savefig('stocks3.png')
```


    

    


| <img src="https://i.ibb.co/Fbg0z9p/stocks3.png" width = auto height = auto > |


```python
# finding correlation of stocks
price.corr()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>INTC</th>
      <th>F</th>
      <th>DIS</th>
      <th>TSLA</th>
      <th>AMZN</th>
      <th>BAC</th>
      <th>SONY</th>
      <th>META</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>INTC</th>
      <td>1.000000</td>
      <td>-0.208127</td>
      <td>0.707272</td>
      <td>-0.139785</td>
      <td>0.373879</td>
      <td>0.087796</td>
      <td>0.101667</td>
      <td>0.459680</td>
    </tr>
    <tr>
      <th>F</th>
      <td>-0.208127</td>
      <td>1.000000</td>
      <td>0.208047</td>
      <td>0.827063</td>
      <td>0.447749</td>
      <td>0.879415</td>
      <td>0.748847</td>
      <td>0.377090</td>
    </tr>
    <tr>
      <th>DIS</th>
      <td>0.707272</td>
      <td>0.208047</td>
      <td>1.000000</td>
      <td>0.238776</td>
      <td>0.612845</td>
      <td>0.491507</td>
      <td>0.471521</td>
      <td>0.641178</td>
    </tr>
    <tr>
      <th>TSLA</th>
      <td>-0.139785</td>
      <td>0.827063</td>
      <td>0.238776</td>
      <td>1.000000</td>
      <td>0.723475</td>
      <td>0.743327</td>
      <td>0.886687</td>
      <td>0.518362</td>
    </tr>
    <tr>
      <th>AMZN</th>
      <td>0.373879</td>
      <td>0.447749</td>
      <td>0.612845</td>
      <td>0.723475</td>
      <td>1.000000</td>
      <td>0.521952</td>
      <td>0.805776</td>
      <td>0.837410</td>
    </tr>
    <tr>
      <th>BAC</th>
      <td>0.087796</td>
      <td>0.879415</td>
      <td>0.491507</td>
      <td>0.743327</td>
      <td>0.521952</td>
      <td>1.000000</td>
      <td>0.762983</td>
      <td>0.458293</td>
    </tr>
    <tr>
      <th>SONY</th>
      <td>0.101667</td>
      <td>0.748847</td>
      <td>0.471521</td>
      <td>0.886687</td>
      <td>0.805776</td>
      <td>0.762983</td>
      <td>1.000000</td>
      <td>0.719643</td>
    </tr>
    <tr>
      <th>META</th>
      <td>0.459680</td>
      <td>0.377090</td>
      <td>0.641178</td>
      <td>0.518362</td>
      <td>0.837410</td>
      <td>0.458293</td>
      <td>0.719643</td>
      <td>1.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
priceCORR = price.corr()

colors = ['gold', 'red', 'blue', 'royalblue', 'black', 'purple', 'pink', 'green']

fig, ax = plt.subplots(figsize=(10, 6))
priceCORR.plot(kind='bar', stacked=True, ax=ax, color=colors)
ax.set_ylabel("Correlation", fontsize=12)
ax.set_xlabel("Stocks", fontsize=12)
ax.set_title("Correlation between Stocks", fontsize=16)

plt.legend(title='Stocks', loc='upper right')
plt.xticks(rotation=0)  # Rotate x-axis labels if needed
plt.show()

# fig.savefig('stocks4.png')
```


    
    


| <img src="https://i.ibb.co/jDqGdXL/stocks4.png" width = auto height = auto > |

| | By finding the correlation of the entire portfolio, it will show how well it will do. The closer to -1 the better. | | 


```python
# Finding average correlation to show profability of portfolio
averageCorr = price.corr()
averageCorrMean = averageCorr.mean()
averageCorrMean

column_sum = 0

# For loop to find the mean of the entire data table
for i in range(len(averageCorrMean)):
    column_sum += averageCorrMean[i]
column_sum = column_sum/len(averageCorrMean)
column_sum
```




    0.5720103203499337



| | This is where the math and the real fun begins. This next code finds the optimal weights of each stock. It does this by running through 6000 differnt scenarios each with different weighting. It finds the weights by finding the retention factor and the volatility of each stock and then compare it to each of the other 7 stocks. Then once it has done that it'll compare it to average yearly stock prices where it will then compare all 6000 scenarios and output the most optimal. | | 


```python
# finding weights, return, volitilty, and sharpe ratio. 

stocks = pd.concat([price['INTC'], price['F'], price['DIS'], price['TSLA'], price['AMZN'], price['BAC'], price['SONY'], price['META']], axis = 1)
log_ret = np.log(stocks/stocks.shift(1))

# setting up variables
np.random.seed(42)
num_ports = 6000
num_stocks = 8
all_weights = np.zeros((num_ports, len(stocks.columns)))
ret_arr = np.zeros(num_ports)
vol_arr = np.zeros(num_ports)
sharpe_arr = np.zeros(num_ports)

# going through all possible weights
for x in range(num_ports):
    # Weights
    weights = np.array(np.random.random(num_stocks))
    weights = weights/np.sum(weights)
    
    # Save weights
    all_weights[x,:] = weights
    
    # Expected return
    ret_arr[x] = np.sum( (log_ret.mean() * weights * 252))
    
    # Expected volatility
    vol_arr[x] = np.sqrt(np.dot(weights.T, np.dot(log_ret.cov()*252, weights)))
    
    # Sharpe Ratio
    sharpe_arr[x] = ret_arr[x]/vol_arr[x]
```

| | The Sharpe Ratio is how investors determine the profability of a portfolio in a single number that can be compared to other portfolios. In finance, the Sharpe ratio measures the performance of an investment such as a security or portfolio compared to a risk-free asset, after adjusting for its risk. | | 


```python
# printing the max sharpe ratio
print("Max Sharpe Ratio = ",sharpe_arr.max())
sharpe_arr.argmax()
max_sr_ret =  ret_arr[sharpe_arr.argmax()]
max_sr_vol =  vol_arr[sharpe_arr.argmax()]
```

    Max Sharpe Ratio =  -0.012687474431392547


| | This is my favorite and probably the most important graph. It may not look like it but there are 6000 points on this graph. Each point represents one of the possible portfolios that the code simulated to find the most optimal weightings. It graphs this by volatilty by return. The graph also represents the Sharpe Ratio of each possible portfolio. With all these calculations in mind, it finds the most opitmal portfolio and then highlights in red (the red dot). In finance this graph is part of a larger graph is called a efficient frontier. | | 


```python
import matplotlib.pyplot as plt
plt.figure(figsize=(12,8))
plt.scatter(vol_arr, ret_arr, c=sharpe_arr, cmap='viridis')
plt.colorbar(label='Sharpe Ratio')
plt.xlabel('Volatility')
plt.ylabel('Return')
plt.scatter(max_sr_vol, max_sr_ret,c='red', s=50) # red dot

# plt.savefig('stocks5.png')
```


    
    


| <img src="https://i.ibb.co/MMRhs07/stocks5.png" width = auto height = auto > |



<script src="https://utteranc.es/client.js"
        repo="student2"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script> 
