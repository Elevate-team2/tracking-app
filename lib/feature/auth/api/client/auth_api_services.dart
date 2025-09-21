import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/end_points_constants.dart';
part 'auth_api_services.g.dart';

@RestApi(baseUrl: EndPointsConstants.baseUrl)
@injectable
abstract class AuthApiServices{
  @factoryMethod
  factory AuthApiServices(Dio dio)=_AuthApiServices;
}
