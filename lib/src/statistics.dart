part of statistics;


/// Return a of the given numeric data.
/// If [start] is given, it is added to the sum. If [data] is empty,
/// 0 is returned.
num _sum(List data, [num start=0]) {
  num sum = start;
  for (num x in data) {
    sum += x;
  }
  return sum;
}


/// Return a Map with <key, count> for each [key] in passed list.
Map _count(List data) {
  Map ret = new Map();
  for (num v in data) {
    if (ret.containsKey(v)) {
      ret[v]++;
    } else {
      ret[v] = 1;
    }
  }
  return ret;
}


/// Return the sample arithmetic mean of [data].
/// If [data] is empty, [StatisticsException] will be thrown.
num mean(List data) {
  if (data.runtimeType == Iterable) {
    data = data.toList();
  }
  int n = data.length;
  if (n < 1) {
    throw new StatisticsException('mean requires at least one data point.');
  }
  return _sum(data) / n;
}


/// Return the median (middle value) of numeric data
/// If [data] is empty, [StatisticsException] will be thrown.
num median(List data) {
  data.sort();
  int n = data.length;
  int halfN = (n ~/ 2);

  if (n < 1) {
    throw new StatisticsException('median requires at least one data point.');
  }
  if (n % 2 == 1) {
    return data[halfN];
  } else {
    return (data[halfN - 1] + data[halfN]) / 2;
  }
}


/// Return the low median of numeric data
/// If [data] is empty, [StatisticsException] will be thrown.
num median_low(List data) {
  data.sort();
  int n = data.length;
  int halfN = (n ~/ 2);

  if (n < 1) {
    throw new StatisticsException('median_low requires at least one data point.');
  }
  if (n % 2 == 1) {
    return data[halfN];
  } else {
    return data[halfN - 1];
  }
}


/// Return the high median of numeric data
/// If [data] is empty, [StatisticsException] will be thrown.
num median_high(List data) {
  data.sort();
  int n = data.length;
  int halfN = (n ~/ 2);

  if (n < 1) {
    throw new StatisticsException('median_high requires at least one data point.');
  }

  return data[halfN];
}


/// Return the 50th percentile (median) of grouped continuous data
/// Optional argument [interval] represents the class interval, and defaults to
/// 1. Changing the class interval naturally will change the interpolated
/// 50th percentile value.
/// If [data] is empty, [StatisticsException] will be thrown.
num median_grouped(List data, [num interval = 1]) {
  data.sort();
  int n = data.length;
  int halfN = n ~/ 2;

  if (n < 1) {
    throw new StatisticsException('median_grouped requires at least one data point.');
  } else if (n == 1) {
    return data[0];
  }

  num x = data[halfN];
  num L = x - interval / 2;
  int cf = data.indexOf(x);
  int f = 0;
  data.forEach((v) {
    if (v == x) {
      f++;
    }
  });

  return L + interval * (n / 2 - cf) / f;
}


/// Return the most common data point from discrete or nominal data.
num mode(List data) {
  Map counts = _count(data);
  if (counts.keys.length < 1) {
    throw new StatisticsException('mode requires at least one data point.');
  }

  num max_key, max_val;
  for (num k in counts.keys) {
    if (counts[k] > k) {
      max_key = k;
      max_val = counts[k];
    }
  }
  return max_key;
}
