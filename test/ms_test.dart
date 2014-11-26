library ms_test;

import 'package:ms/ms.dart';


void test(test_val, expected_val, [Map options]) {
  var val = ms(test_val);
  if (val != expected_val) {
    throw new Exception('ms($test_val): Expect: $expected_val, Got: $val');
  }
}

void main() {
  test('100', 100);
  test('1m', 60000);
  test('1h', 3600000);
  test('2d', 172800000);
  test('1s', 1000);
  test('100ms', 100);
  test('1.5h', 5400000);
  test('1   s', 1000);
  test('1.5H', 5400000);
  test('.5ms', .5);

  test('53 milliseconds', 53);
  test('17 msecs', 17);
  test('1 sec', 1000);
  test('1 min', 60000);
  test('1 hr', 3600000);
  test('2 days', 172800000);
  test('1.5 hours', 5400000);

  print('-------------------');
  print('All tests complete.');
  print('-------------------');
}