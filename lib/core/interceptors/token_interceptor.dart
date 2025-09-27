import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/feature/auth/api/data_source/local/user_local_storage_impl.dart';

@lazySingleton
class TokenInterceptor extends Interceptor {
  final UserLocalStorageImpl _localStorage;

  TokenInterceptor(this._localStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await _localStorage.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers[Constants.authorizationHeader] =
        '${Constants.bearerPrefix}$token';
      }
    } catch (e) {
      // log
    }

    super.onRequest(options, handler);
  }
}
