import 'package:isar/isar.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';
import 'package:tracking_app/feature/home/local/models/product_model_local.dart';
import 'package:tracking_app/feature/home/local/models/order_item_local_model.dart';
import 'package:tracking_app/feature/home/local/models/shipping_address_local_model.dart';
import 'package:tracking_app/feature/home/local/models/store_local_model.dart';
import 'package:tracking_app/feature/home/local/models/user_local_model.dart';

part 'order_local_model.g.dart';


@Collection()
class OrderLocalModel {
  Id id = Isar.autoIncrement;
  late String orderId;
  late UserLocalModel user;
  late List<OrderItemLocalModel> orderItems;
  late int totalPrice;
  late ShippingAddressLocalModel shippingAddress;
  late String paymentType;
  late bool isPaid;
  late bool isDelivered;
  late String state;
  late String orderNumber;
  late StoreLocalModel store;
   late String paidAt;
  late String createdAt;
  late String updatedAt;
  late int v;

  static OrderLocalModel toLocalModel(OrderEntity entity) {
    return OrderLocalModel()
      ..orderId = entity.id
      ..user = UserLocalModel.fromEntity(entity.user)
      ..orderItems = entity.orderItems
          .map(OrderItemLocalModel.fromEntity)
          .toList()
      ..totalPrice = entity.totalPrice
      ..shippingAddress = ShippingAddressLocalModel.fromEntity(
        entity.shippingAddress,
      )
      ..paymentType = entity.paymentType
      ..isPaid = entity.isPaid
      ..isDelivered = entity.isDelivered
      ..state = entity.state
      ..orderNumber = entity.orderNumber
      ..createdAt=entity.createdAt
      ..updatedAt=entity.updatedAt..v=entity.v..paidAt=entity.paidAt
      ..store = StoreLocalModel.fromEntity(entity.store);
  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: orderId,
      user: user.toEntity(),
      orderItems: orderItems.map((local) => local.toEntity()).toList(),
      totalPrice: totalPrice,
      shippingAddress: shippingAddress.toEntity(),
      paymentType: paymentType,
      isPaid: isPaid,
      isDelivered: isDelivered,
      state: state,
      orderNumber: orderNumber,
      store: store.toEntity(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      paidAt: paidAt,
    );
  }
}
