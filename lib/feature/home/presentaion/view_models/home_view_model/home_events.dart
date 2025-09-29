import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';

abstract class HomeEvents {}

class GetAllPaindingOrdersEvent extends HomeEvents {}

class SaveDataToLocalEvent extends HomeEvents {
  final List<OrderEntity>? orders;

  SaveDataToLocalEvent(this.orders);
}

class GetAllLocalOrdersEvent extends HomeEvents {}

class GetOrdersEvent extends HomeEvents {}

class DeleteOrderLocalyEvent extends HomeEvents {
  String orderId;
  DeleteOrderLocalyEvent(this.orderId);
}
class RefreshOrdersEvent extends HomeEvents{}
