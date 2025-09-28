import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';

abstract interface class HomeLocalDataSource {
  Future<Result<List<OrderEntity>?>> getAllLocalOrders();
}
