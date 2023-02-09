import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_tutorial/providers/album.dart';

void main() {
  test("OTHER TEST CASES", () {
    // type check
    expect(const Album(userId: 1, id: 2, title: "title"), isA<Album>());

// null check
    int? a = 10;
    expect(a, isNotNull);
    expect("null", isNotNull);

// bool check

    expect(3 == 3, isTrue);
    expect(3 != 3, isFalse);
    // equality check
    expect("1", equals("1"));
// sign check
    expect(-1, isNegative);
    expect(1, isPositive);
    expect(0, isNonNegative);
    expect(0, isNonPositive);
    // list checks
    expect([], isEmpty);
    expect([2], isNotEmpty);
  });
}
