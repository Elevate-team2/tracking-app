import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/order/domain/entity/order_driver_entity.dart';

abstract interface class OrderRemoteDataSource {
  Future<Result<OrderDriverEntity>> getAllDriverOrders();
}
