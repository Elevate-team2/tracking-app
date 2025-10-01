import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';
import 'package:tracking_app/feature/home/api/models/remote_order_item_model.dart';
import 'package:tracking_app/feature/home/api/models/remote_shipping_address_model.dart';
import 'package:tracking_app/feature/home/api/models/remote_store_model.dart';
import 'package:tracking_app/feature/home/api/models/remote_user_model.dart';
part 'remote_order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RemoteOrderModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "user")
  RemoteUserModel? user;
  @JsonKey(name: "orderItems")
  List<RemoteOrderItemModel>? orderItems;
  @JsonKey(name: "totalPrice")
  int? totalPrice;
  @JsonKey(name: "shippingAddress")
  RemoteShippingAddressModel? shippingAddress;
  @JsonKey(name: "paymentType")
  String? paymentType;
  @JsonKey(name: "isPaid")
  bool? isPaid;
  @JsonKey(name: "paidAt")
  String? paidAt;
  @JsonKey(name: "isDelivered")
  bool? isDelivered;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "orderNumber")
  String? orderNumber;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "store")
  RemoteStoreModel? store;

  RemoteOrderModel({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.shippingAddress,
    this.paymentType,
    this.isPaid,
    this.paidAt,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
    this.store,
  });

  factory RemoteOrderModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOrderModelToJson(this);

  OrderEntity toEntity() {
    return OrderEntity(
      id: id ?? '',
      user: user!.toEntity(),
      orderItems: orderItems?.map((order) => order.toEntity()).toList()??[],
      totalPrice: totalPrice ?? 0,
      shippingAddress: RemoteShippingAddressModel.toEntity(shippingAddress),
      paymentType: paymentType ?? '',
      isPaid: isPaid ?? false,
      isDelivered: isDelivered ?? false,
      state: state ?? '',
      orderNumber: orderNumber ?? '',
      store: store!.toEntity(),
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      v: v ?? -1,
      paidAt: paidAt ?? '',
    );
  }

  factory RemoteOrderModel.fromEntity(OrderEntity entity) {
    return RemoteOrderModel(
      id: entity.id,
      user: RemoteUserModel.fromEntity(entity.user),
      orderItems: entity.orderItems
          .map(RemoteOrderItemModel.fromEntity)
          .toList(),
      totalPrice: entity.totalPrice,
      shippingAddress: RemoteShippingAddressModel.fromEntity(
        entity.shippingAddress,
      ),
      paymentType: entity.paymentType,
      isPaid: entity.isPaid,
      isDelivered: entity.isDelivered,
      state: entity.state,
      orderNumber: entity.orderNumber,
      store: RemoteStoreModel.fromEntity(entity.store),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      paidAt: entity.paidAt,
      v: entity.v
    );
  }
}
