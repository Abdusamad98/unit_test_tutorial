import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_tutorial/providers/album.dart';
import 'package:unit_test_tutorial/providers/counter.dart';

void main() {
  // Single test
  test('COUNTER TEST PASSED', () {
    final Counter counter = Counter();
    counter.increment();
    counter.increment();
    expect(counter.value, 2);
  });

  test('A IS 15 PASSED', () {
    const int a = 10;
    expect(a, 10);
  });

  group("FULL COUNTER TESTING", () {
    test("INITIAL VALUE 0", () {
      Counter counter = Counter();
      expect(counter.value, 0);
    });

    test("INCREMENTED WORKED", () {
      Counter counter = Counter();
      counter.increment();
      counter.increment();
      expect(counter.value, 2);

      counter.increment();
      expect(counter.value, 3);
    });

    test("DECREMENT WORKED", () {
      Counter counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });

    group("Inner GROUP", () {
      test("TEST1", () {
        expect([], isEmpty);
      });
    });
  });


  group("ALBUM PROVIDER TEST", () {
    test("ALBUM TEST 1", () {
      Album album = const Album(userId: 1, id: 1, title: "title");
      expect(album.id == album.userId, true);
    });
  });

  //Group test
  // group("Counter ->", () {
  //   test("value should start at zero", () {
  //     expect(Counter().value, 0);
  //   });
  //
  //   test("value should be incremented", () {
  //     final Counter counter = Counter();
  //     counter.increment();
  //     expect(counter.value, 1);
  //   });
  //
  //   test("value should be decremented", () {
  //     final Counter counter = Counter();
  //     counter.decrement();
  //     expect(counter.value, -1);
  //   });
  // });
}
