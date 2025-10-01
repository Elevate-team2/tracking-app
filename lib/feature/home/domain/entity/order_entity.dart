import 'package:tracking_app/feature/home/domain/entity/order_item_entity.dart';
import 'package:tracking_app/feature/home/domain/entity/shipping_address_entity.dart';
import 'package:tracking_app/feature/home/domain/entity/store_entity.dart';
import 'package:tracking_app/feature/home/domain/entity/user_entity.dart';
class OrderEntity {
  final String id;
  final UserEntity user;
  final List<OrderItemEntity> orderItems;
  final int totalPrice;
  final ShippingAddressEntity shippingAddress;
  final String paymentType;
  final bool isPaid;
  final bool isDelivered;
  final String state;
  final String orderNumber;
  final String paidAt;
  final String createdAt;
  final String updatedAt;
  final int v;
  final StoreEntity store;

  OrderEntity({
    required this.id,
    required this.user,
    required this.orderItems,
    required this.totalPrice,
    required this.shippingAddress,
    required this.paymentType,
    required this.isPaid,
    required this.isDelivered,
    required this.state,
    required this.orderNumber,
    required this.store,
    required this.createdAt,
    required this.paidAt,
    required this.updatedAt,
    required this.v,
  });

  OrderEntity copyWith({
    String? id,
    UserEntity? user,
    List<OrderItemEntity>? orderItems,
    int? totalPrice,
    ShippingAddressEntity? shippingAddress,
    String? paymentType,
    bool? isPaid,
    bool? isDelivered,
    String? state,
    String? orderNumber,
    String? paidAt,
    String? createdAt,
    String? updatedAt,
    int? v,
    StoreEntity? store,
  }) {
    return OrderEntity(
      id: id ?? this.id,
      user: user ?? this.user,
      orderItems: orderItems ?? this.orderItems,
      totalPrice: totalPrice ?? this.totalPrice,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      paymentType: paymentType ?? this.paymentType,
      isPaid: isPaid ?? this.isPaid,
      isDelivered: isDelivered ?? this.isDelivered,
      state: state ?? this.state,
      orderNumber: orderNumber ?? this.orderNumber,
      paidAt: paidAt ?? this.paidAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      store: store ?? this.store,
    );
  }
}
