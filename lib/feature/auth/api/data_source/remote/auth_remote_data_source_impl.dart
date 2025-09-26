<<<<<<< HEAD
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_error/api_error.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/api/client/auth_api_services.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';
import 'package:tracking_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';


@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
 final AuthApiServices _authApiServices;
 const AuthRemoteDataSourceImpl(this._authApiServices);
  @override
  Future<Result<LoginResponse>> login(LoginRequest request)async {
try{
  final response=await _authApiServices.login(request);
  return SucessResult(response);
}catch(error){
  if(error is DioException){
return FailedResult(ServerFailure.fromDioError(error).errorMessage);

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements
    AuthRemoteDataSource{
  final AuthApiServices _authApiServices;
  const AuthRemoteDataSourceImpl(this._authApiServices);
  @override
  Future<Result<List<VehicleEntity>>> getAllVehicles()async {
try{
  final response=await _authApiServices.getAllVehicles();
  final vehicles=response.vehicles?.map((e)=>e.toEntity()).toList()??[];
  return SucessResult(vehicles);
}catch(error){
  if(error is DioException){
    return FailedResult(ServerFailure.fromDioError(error).errorMessage);
>>>>>>> origin/feature/register1
  }else{
    return FailedResult(error.toString());
  }
}
  }


  
  @override
  Future<Result<String>> forgetPassword(String email) async {
    try {
      final response = await _authApiServices.forgetPassword({"email": email});
      if (response.info != null && response.info!.isNotEmpty) {
        return SucessResult<String>(response.info!);
      } else {
        final errorMessage =
            response.error ?? response.message ?? "Unknown error";
        return FailedResult<String>(errorMessage);
      }
    } on DioException catch (dioError) {
      final errorMessage = dioError.response?.data["error"] ?? dioError.message;
      return FailedResult<String>(errorMessage);
    } catch (error) {
      return FailedResult<String>(error.toString());
    }
  }

  @override
  Future<Result<String>> verifyResetCode(String code) async {
    try {
      final response = await _authApiServices.verifyResetCode({
        "resetCode": code,
      });

      if (response['error'] != null &&
          (response['error'] as String).isNotEmpty) {
        return FailedResult<String>(response['error']!);
      }

      final message = response['status'] ?? response['message'] ?? "Success";
      return SucessResult<String>(message);
    } on DioException catch (dioError) {
      final errorMessage =
          dioError.response?.data['error'] ??
          dioError.response?.data['message'] ??
          dioError.message;
      return FailedResult<String>(errorMessage);
    } catch (error) {
      return FailedResult<String>(error.toString());
    }
  }

  @override
  Future<Result<String>> resetPassword(String email, String newPassword) async {
    try {
      final response = await _authApiServices.resetPassword({
        "email": email,
        "newPassword": newPassword,
      });
      if (response.message != null && response.message!.isNotEmpty) {
        return SucessResult<String>(response.message!);
      } else {
        final errorMessage = response.error ?? "Unknown error";
        return FailedResult<String>(errorMessage);
      }
    } on DioException catch (dioError) {
      final errorMessage =
          dioError.response?.data['error'] ??
          dioError.response?.data['message'] ??
          dioError.message;
      return FailedResult<String>(errorMessage);
    } catch (error) {
      return FailedResult<String>(error.toString());
    }
  }
  
}

  @override
  Future<Result<List<CountryEntity>>> getCountries()
  async {
    try {
      final response = await
      rootBundle.loadString("assets/json/country.json");
      final data = jsonDecode(response) as List<dynamic>;

      final countries = data.map((json) {
        final timezonesJson = json["timezones"] as List<dynamic>;
        final times = timezonesJson
            .map(
              (e) => Timezone(
            zoneName: e["zoneName"],
            gmtOffset: e["gmtOffset"],
            gmtOffsetName: e["gmtOffsetName"],
            abbreviation: e["abbreviation"],
            tzName: e["tzName"],
          ),
        )
            .toList();
        return CountryEntity(
          isoCode: json["isoCode"],
          name: json["name"],
          phoneCode: json["phoneCode"],
          flag: json["flag"],
          currency: json["currency"],
          latitude: json["latitude"],
          longitude: json["longitude"],
          timezones: times,
        );
      }).toList();
      return SucessResult(countries);
    } catch (error) {
      return FailedResult(error.toString());
    }
  }


  @override
  Future<Result<DriverEntity>> apply(ApplyRequest request) async {
    try {
      final formData = request.toFormData();

      final response = await _authApiServices.apply(formData);

      final driver = response.driver!.toEntity();
      return SucessResult(driver);

    } catch (error) {
      if (error is DioException) {
        return FailedResult(ServerFailure.fromDioError(error).errorMessage);
      } else {
        return FailedResult(error.toString());
      }
    }
  }



  }




