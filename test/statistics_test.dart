library statistics_test;

import 'package:statistics/statistics.dart';


void test(Map options) {
  List args = options['args'];

  options['expect'].keys.forEach((input) {
    args.insert(0, input);

    var f = options["method"].toString();
    var expected = options['expect'][input];

    var result;
    try {
      result = Function.apply(options['method'], args);
      if (result != expected) {
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
      [1, 2, 3]: 2
    }
  });
}

void main() {
  testMean();
}
