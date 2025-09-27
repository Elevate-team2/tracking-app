import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';
import '../../../../core/api_result/result.dart';
import '../entity/country_entity.dart';

@injectable
class GetAllCountriesUseCase{
  final AuthRepositry _authRepositry;
  const GetAllCountriesUseCase(this._authRepositry);
  Future<Result<List<CountryEntity>>> getCountries()
  async {
    return await _authRepositry.getCountries();
  }
}