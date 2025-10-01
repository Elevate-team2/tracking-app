import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/api/models/update_state_order_items.dart';
import 'package:tracking_app/feature/home/domain/entity/start_order_response_entity.dart';

part 'update_state_order_model.g.dart';

@JsonSerializable()
class UpdateStateOrderModel {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "user")
  String user;
  @JsonKey(name: "orderItems")
  List<UpdateStateOrderItems> orderItems;
  @JsonKey(name: "totalPrice")
  int totalPrice;
  @JsonKey(name: "paymentType")
  String paymentType;
  @JsonKey(name: "isPaid")
  bool isPaid;
  @JsonKey(name: "isDelivered")
  bool isDelivered;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "orderNumber")
  String orderNumber;
  @JsonKey(name: "__v")
  int v;

  UpdateStateOrderModel({
    required this.id,
    required this.user,
    required this.orderItems,
    required this.totalPrice,
    required this.paymentType,
    required this.isPaid,
    required this.isDelivered,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.orderNumber,
    required this.v,
  });

  factory UpdateStateOrderModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateStateOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateStateOrderModelToJson(this);

  StartOrderResponseEntity toEntity() {
    return StartOrderResponseEntity(
      id: id,
      user: user,
      orderItems: orderItems.map((model) => model.toEntity()).toList(),
      totalPrice: totalPrice,
      paymentType: paymentType,
      isPaid: isPaid,
      isDelivered: isDelivered,
      state: state,
      orderNumber: orderNumber,
    );
  }
}
