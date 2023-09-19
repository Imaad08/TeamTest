---
toc: True
comments: False
layout: post
title: Stock Protfolio Simulation
description: Python Invesment Portfolio Simulator
courses: {'compsci': {'week': 2}}
type: hacks
---

This blog takes 8 stocks and simulates how well a portfolio would do if invested. It also tells what the best weighting for each stock would be the most optimal. It gives important information such as risk, volatility, profit, Sharpe Ratio, etc. 

8 stocks have been chosen at random which are Intel (INTC), Ford Motor Company (F), Walt Disney Co (DIS), Tesla (TSLA), Amazon (AMZN), Bank of America (BAC), Sony (SONY), and Meta (META)


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
      <th>2023-08-31</th>
      <td>35.1400</td>
      <td>12.13000</td>
      <td>83.68</td>
      <td>258.0800</td>
      <td>138.0100</td>
      <td>28.6700</td>
      <td>83.1900</td>
      <td>295.89</td>
    </tr>
    <tr>
      <th>2023-08-30</th>
      <td>34.5300</td>
      <td>12.03000</td>
      <td>84.28</td>
      <td>256.9000</td>
      <td>135.0700</td>
      <td>29.0400</td>
      <td>82.3500</td>
      <td>295.10</td>
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
    <tr>
      <th>2018-09-10</th>
      <td>41.0554</td>
      <td>8.18682</td>
      <td>108.50</td>
      <td>19.0333</td>
      <td>96.9505</td>
      <td>27.9808</td>
      <td>55.6325</td>
      <td>164.18</td>
    </tr>
    <tr>
      <th>2018-09-07</th>
      <td>41.1893</td>
      <td>8.09099</td>
      <td>108.79</td>
      <td>17.5493</td>
      <td>97.6035</td>
      <td>28.0181</td>
      <td>55.4838</td>
      <td>163.04</td>
    </tr>
  </tbody>
</table>
<p>1257 rows × 8 columns</p>
</div>



The standard deviation is how investors measure volatility and risk. STD measures the average distance from the mean, so the higher the STD the less concise the data is. In the finance world, if the STD is higher, that means that the price of the stock can be more unpredictable. This equates to risk. The lower the STD the better, and vice versa. 


```python
# finding standard deviation
price.std()
```




    INTC      9.269080
    F         3.718751
    DIS      29.812228
    TSLA    112.305918
    AMZN     32.601511
    BAC       6.760205
    SONY     21.699832
    META     68.639090
    dtype: float64



The correlation between each of the stocks shows how well the portfolio will do. The correlation in math shows the relationship and the proportion between two variables. In finance the correlation dictates how two stocks will react in relationship. In layman terms it shows if one stock will go up what will another stock do. Correlation ranges from -1 to 1, where -1 is the most optimal. 


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
      <td>-0.207316</td>
      <td>0.707290</td>
      <td>-0.138098</td>
      <td>0.374776</td>
      <td>0.087599</td>
      <td>0.102494</td>
      <td>0.461628</td>
    </tr>
    <tr>
      <th>F</th>
      <td>-0.207316</td>
      <td>1.000000</td>
      <td>0.209967</td>
      <td>0.827277</td>
      <td>0.448191</td>
      <td>0.879887</td>
      <td>0.749091</td>
      <td>0.377600</td>
    </tr>
    <tr>
      <th>DIS</th>
      <td>0.707290</td>
      <td>0.209967</td>
      <td>1.000000</td>
      <td>0.242519</td>
      <td>0.615637</td>
      <td>0.491690</td>
      <td>0.473677</td>
      <td>0.646180</td>
    </tr>
    <tr>
      <th>TSLA</th>
      <td>-0.138098</td>
      <td>0.827277</td>
      <td>0.242519</td>
      <td>1.000000</td>
      <td>0.723774</td>
      <td>0.744394</td>
      <td>0.887155</td>
      <td>0.518510</td>
    </tr>
    <tr>
      <th>AMZN</th>
      <td>0.374776</td>
      <td>0.448191</td>
      <td>0.615637</td>
      <td>0.723774</td>
      <td>1.000000</td>
      <td>0.522691</td>
      <td>0.806006</td>
      <td>0.837762</td>
    </tr>
    <tr>
      <th>BAC</th>
      <td>0.087599</td>
      <td>0.879887</td>
      <td>0.491690</td>
      <td>0.744394</td>
      <td>0.522691</td>
      <td>1.000000</td>
      <td>0.763278</td>
      <td>0.459897</td>
    </tr>
    <tr>
      <th>SONY</th>
      <td>0.102494</td>
      <td>0.749091</td>
      <td>0.473677</td>
      <td>0.887155</td>
      <td>0.806006</td>
      <td>0.763278</td>
      <td>1.000000</td>
      <td>0.720367</td>
    </tr>
    <tr>
      <th>META</th>
      <td>0.461628</td>
      <td>0.377600</td>
      <td>0.646180</td>
      <td>0.518510</td>
      <td>0.837762</td>
      <td>0.459897</td>
      <td>0.720367</td>
      <td>1.000000</td>
    </tr>
  </tbody>
</table>
</div>



By finding the correlation of the entire portfolio, it will show how well it will do. The closer to -1 the better. 


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




    0.5729350722124822



This is where the math and the real fun begins. This next code finds the optimal weights of each stock. It does this by running through 6000 differnt scenarios each with different weighting. It finds the weights by finding the retention factor and the volatility of each stock and then compare it to each of the other 7 stocks. Then once it has done that it'll compare it to average yearly stock prices where it will then compare all 6000 scenarios and output the most optimal. 


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

The Sharpe Ratio is how investors determine the profability of a portfolio in a single number that can be compared to other portfolios. In finance, the Sharpe ratio measures the performance of an investment such as a security or portfolio compared to a risk-free asset, after adjusting for its risk. 


```python
# printing the max sharpe ratio
print("Max Sharpe Ratio = ",sharpe_arr.max())
sharpe_arr.argmax()
max_sr_ret =  ret_arr[sharpe_arr.argmax()]
max_sr_vol =  vol_arr[sharpe_arr.argmax()]
```

    Max Sharpe Ratio =  -8.584010866738334e-05


<script src="https://utteranc.es/client.js"
        repo="student2"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script> 
