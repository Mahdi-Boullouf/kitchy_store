import 'package:flutter_test/flutter_test.dart';
import 'package:kitchy_store/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ProductsServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
