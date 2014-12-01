statistics.dart
===============

Functions for calculating mathematical statistics of numeric data.

**Note**: Unless explicitly noted otherwise, these functions support `int` and `double`.

## Usage

\<install instructions\>

## Averages and central measures

| Method | Description |
| ------ | ----------- |
| **mean(List data)** | Return the sample arithmetic mean of data |
| **median(List data)** | Return the median (middle value) of numeric data |
| **median_low(List data)** | Return the low median of numeric data |
| **median_high(List data)** | Return the high median of numeric data |
| **median_grouped(List data, [int interval = 1])** | Return the median, or 50th percentile, of grouped data |
| **mode(List data)** | Return the most common data point from discrete or nominal data |

*All methods throw `StatisticsException` if `data` is empty.*

## Measure of spread

| Method | Description |
| ------ | ----------- |
| **pstdev(List data, [num mu])** | Return the population standard deviation. If the optional second argument `mu` is given, it should be the mean of data. If it is missing or `null`, the mean is automatically calculated |
| **pvariance(List data, [num mu])** | Return the population variance of data. If the optional second argument `mu` is given, it should be the mean of data. If it is missing or `null`, the mean is automatically calculated |
| **stdev(List data, [num xbar])** | Return the sample standard deviation. If the optional second argument `xbar` is given, it should be the mean of data. If it is missing or null, the mean is automatically calculated. |
| **variance(List data, [num xbar])** | Return the sample variance of data. If the optional second argument `xbar` is given, it should be the mean of data. If it is missing or null, the mean is automatically calculated. |

*`pstdev` and `pvariance` throw `StatisticsException` if `data` is empty.*
*`stdev` and `variance` throw `StatisticsException` if `data` has less than two elements.*
