import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/country_entity.dart';
import 'package:tracking_app/feature/auth/domain/entity/time_zone.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';
import 'package:tracking_app/feature/auth/domain/use_case/get_all_countries_use_case.dart';

import 'login_use_case_test.mocks.dart';
@GenerateMocks([AuthRepositry])
void main() {
  late MockAuthRepositry mockAuthRepositry;
  late GetAllCountriesUseCase getAllCountriesUseCase;
setUp((){
mockAuthRepositry=MockAuthRepositry();
getAllCountriesUseCase=GetAllCountriesUseCase(mockAuthRepositry);
provideDummy<Result<List<CountryEntity>>>(FailedResult("errorMessage"));
});
  final List<CountryEntity> countries=[
    const CountryEntity(isoCode: "AF", name: "Afghanistan",
        phoneCode: "93", flag: "🇦🇫", currency: "AFN",
        latitude: "33.00000000", longitude: "65.00000000",
        timezones: [
          Timezone(zoneName: "Asia/Kabul",
              gmtOffset: 16200,
              gmtOffsetName: "UTC+04:30",
              abbreviation: "AFT",
              tzName: "Afghanistan Time")
        ])
  ];
  test('return SuccessResult when repo success', ()async {

when(mockAuthRepositry.getCountries()).thenAnswer((_)async=>
    SucessResult(countries));
final result=await getAllCountriesUseCase.getCountries();
expect(result, isA<SucessResult>());
expect((result as SucessResult).sucessResult, countries);
verify(mockAuthRepositry.getCountries()).called(1);

  });
  test('return SuccessResult when repo success', ()async {
final exception=Exception("throw exception");
    when(mockAuthRepositry.getCountries()).thenAnswer((_)async=>
        FailedResult(exception.toString()));
    final result=await getAllCountriesUseCase.getCountries();
    expect(result, isA<FailedResult>());
    expect((result as FailedResult).errorMessage, exception.toString());
    verify(mockAuthRepositry.getCountries()).called(1);

  });
}