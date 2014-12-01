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
