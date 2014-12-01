library statistics_test;

import 'package:statistics/statistics.dart';


const double DELTA = 0.0001;


void test(Map options) {
  List args = options['args'];

  options['expect'].keys.forEach((input) {
    args.insert(0, input);

    var f = options["method"].toString();
    var expected = options['expect'][input];

    var result;
    try {
      result = Function.apply(options['method'], args);
      if (((expected - result).abs() > DELTA)) {
        throw new Exception('$f($args) failed but should have passed');
      }
    } on StatisticsException {
      if (expected != 'StatisticsException') {
        throw new Exception('$f($args) failed but should have passed');
      }
    }

    args.removeAt(0);
  });
}


void testMean() {
  test({
    'method': mean,
    'args':[],
    'expect': {
      []: 'StatisticsException',
      [1, 2, 3]: 2,
      [1.0, 1.5, 1.6]: 1.366666,
      [1.0, -1.0, 2.0, -2.0]: 0
    }
  });
}


void testMedian() {
  test({
    'method': median,
    'args':[],
    'expect': {
      []: 'StatisticsException',
      [1, 2, 3]: 2,
      [-1, -2, -3]: -2,
      [1, 1, 1, 1]: 1,
      [1, 2, 3, 1]: 1.5
    }
  });
}


void testMedianLow() {
  test({
    'method': median_low,
    'args':[],
    'expect': {
      []: 'StatisticsException',
      [1, 2, 3]: 2,
      [-1, -2, -3]: -2,
      [1, 1, 1, 1]: 1,
      [1, 2, 3, 1]: 1
    }
  });
}


void testMedianHigh() {
  test({
    'method': median_high,
    'args':[],
    'expect': {
      []: 'StatisticsException',
      [1, 2, 3]: 2,
      [-1, -2, -3]: -2,
      [1, 1, 1, 1]: 1,
      [1, 2, 3, 1]: 2
    }
  });
}


void testMedianGrouped() {
  test({
    'method': median_grouped,
    'args':[2],
    'expect': {
      []: 'StatisticsException',
      [1, 3, 3, 5, 7]: 3.5
    }
  });

  test({
    'method': median_grouped,
    'args':[],
    'expect': {
      []: 'StatisticsException',
      [1, 3, 3, 5, 7]: 3.25
    }
  });
}


void testMode() {
  test({
    'method': mode,
    'args':[],
    'expect': {
      []: 'StatisticsException',
      [1, 1, 2, 3, 1]: 1,
      [1, 1, 2, 3, 3, 3, 3, 4]: 3
    }
  });
}


void main() {
  testMean();
  testMedian();
  testMedianLow();
  testMedianHigh();
  testMedianGrouped();
  testMode();

  print('-------------------------------------');
  print('All tests complete.');
  print('-------------------------------------');
}
