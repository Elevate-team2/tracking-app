import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/constants/constants.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provieDio() {
    final dio = Dio();
    dio.interceptors.add(getIt.get<PrettyDioLogger>());
    dio.options.headers = {Constants.contentType: Constants.appJson};

    //dio.options.baseUrl = ""; will use it when we have a url
    return dio;
  }

  @lazySingleton
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseHeader: true,
    responseBody: true,
  );
}
