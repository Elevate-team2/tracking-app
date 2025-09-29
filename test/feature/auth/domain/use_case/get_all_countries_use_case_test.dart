import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';
import 'package:tracking_app/feature/auth/domain/use_case/get_all_countries_use_case.dart';

import 'login_use_case_test.mocks.dart';
@GenerateMocks([AuthRepositry])
void main() {
  late MockAuthRepositry mockAuthRepositry;
  late GetAllCountriesUseCase getAllCountriesUseCase;
setUp((){

});
  test('TODO: Implement tests for get_all_countries_use_case.dart', () {
    // TODO: Implement test
  });
}