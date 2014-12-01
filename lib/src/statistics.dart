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
