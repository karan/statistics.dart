statistics.dart
===============

Functions for calculating mathematical statistics of numeric data.

**Note**: These functions support `int` and `double` `List`s.

## Usage

### 1. Depend on it

In your `pubspec.yaml`, add:

    dependencies:
      statistics: ">=0.01"

### 2. Install it

Run from your command line:

    $ pub get

Alternatively, your editor might support pub. Check the docs for your editor to learn more.

### 3. Import it

In your Dart code:

    import 'package:statistics/statistics.dart';

### 4. Use it

    print(mean([1, 2, 3, 4]));

## Supported methods

| Method | Description |
| ------ | ----------- |
| **mean(List data)** | Return the sample arithmetic mean of data |
| **median(List data)** | Return the median (middle value) of numeric data |
| **median_low(List data)** | Return the low median of numeric data |
| **median_high(List data)** | Return the high median of numeric data |
| **median_grouped(List data, [int interval = 1])** | Return the median, or 50th percentile, of grouped data |
| **mode(List data)** | Return the most common data point from discrete or nominal data |

*All methods throw `StatisticsException` if `data` is empty.*
