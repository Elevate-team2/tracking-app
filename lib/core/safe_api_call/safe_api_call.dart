import 'package:dio/dio.dart';
import 'package:tracking_app/core/api_error/api_error.dart';
import 'package:tracking_app/core/api_result/result.dart';

Future<Result<T>> safeApiCall<T>(Future<T> Function() call) async {
  try {
    final response = await call();
    return SucessResult(response);
  } on DioException catch (dioError) {
    return FailedResult(ServerFailure.fromDioError(dioError).errorMessage);
  } catch (error) {
    return FailedResult(error.toString());
  }
}
