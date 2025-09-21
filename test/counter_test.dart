import 'package:flutter_test/flutter_test.dart';
import 'package:test/counter.dart';



void main() {
  group('Counter', () {
    test('initial value should be 0', () {
      final counter = Counter();
      expect(counter.value, 0);
    });

    test('increment increases value by 1', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('decrement decreases value by 1', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
