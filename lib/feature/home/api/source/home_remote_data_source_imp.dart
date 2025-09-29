import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/feature/home/api/client/home_api_service.dart';
import 'package:tracking_app/feature/home/api/models/order_model.dart';
import 'package:tracking_app/feature/home/data/source/home_remote_data_source.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final HomeApiService _homeApiService;

  HomeRemoteDataSourceImp(this._homeApiService);

  @override
  Future<Result<List<OrderEntity>?>> getAllPendingOrders() async {
    try {
      final pendingOrderResponse = await _homeApiService.getAllPendingOrders();
      final orderEntity = pendingOrderResponse.orders!
          .map(OrderModel.orderModelToEntity)
          .toList();

          

      return SucessResult(orderEntity);
    } on DioException catch (dioError) {
      final errorMessage =
          dioError.response?.data[Constants.error] ??
          dioError.response?.data[Constants.message] ??
          dioError.message;
      return FailedResult(errorMessage);
    } catch (error) {
      return FailedResult(error.toString());
    }
  }
}
