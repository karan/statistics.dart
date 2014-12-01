part of statistics;

class StatisticsException implements Exception {
  String cause;
  StatisticsException(this.cause);

  String toString() => 'StatisticsException';
}
