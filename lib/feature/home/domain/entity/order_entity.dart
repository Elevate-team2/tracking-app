import 'package:tracking_app/feature/home/domain/entity/order_item_entity.dart';
import 'package:tracking_app/feature/home/domain/entity/shipping_address_entity.dart';
import 'package:tracking_app/feature/home/domain/entity/store_entity.dart';
import 'package:tracking_app/feature/home/domain/entity/user_entity.dart';

class OrderEntity {
    String id;
    UserEntity user;
    List<OrderItemEntity> orderItems;
    int totalPrice;
    ShippingAddressEntity shippingAddress;
    String paymentType;
    bool isPaid;

    bool isDelivered;
    String state;
    String orderNumber;
   
    StoreEntity store;

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
    });

}




