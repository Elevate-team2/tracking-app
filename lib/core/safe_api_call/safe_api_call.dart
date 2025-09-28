import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tracking_app/core/api_error/api_error.dart';
import 'package:tracking_app/core/api_result/result.dart';

import '../firebase_error/firebase_error.dart';

Future<Result<T>> safeCall<T>(Future<T> Function() call) async {
  try {
    final response = await call();
    return SucessResult(response);
  } on Exception catch (error) {
    if (error is DioException) {
      return FailedResult(ServerFailure.fromDioError(error).errorMessage);
    } else if (error is FirebaseException) {
      return FailedResult(FirebaseErrorHandler.handle(error).errorMessage);
    } else {
      return FailedResult(error.toString());
    }
  } catch (error) {
    return FailedResult(error.toString());
  }
}
