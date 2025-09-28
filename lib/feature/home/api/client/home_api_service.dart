import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tracking_app/core/constants/end_points_constants.dart';
import 'package:tracking_app/feature/home/api/models/pending_response_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: EndPointsConstants.baseUrl)
@injectable
abstract class HomeApiService {
  @factoryMethod
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(EndPointsConstants.homeEndPoint)
  Future<PendingOrdersResponse> getAllPendingOrders();
}
