import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_tutorial/counter.dart';

void main() {
  // Single test
  // test('Counter value should be incremented!', () {
  //
  //   final Counter counter = Counter();
  //
  //   counter.increment();
  //
  //   expect(counter.value, 1);
  // });
  //Group test
  group("Counter ->", () {
    test("value should start at zero", () {
      expect(Counter().value, 0);
    });

    test("value should be incremented", () {
      final Counter counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test("value should be decremented", () {
      final Counter counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
