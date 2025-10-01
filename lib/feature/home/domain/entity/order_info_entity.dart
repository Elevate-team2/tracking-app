class OrderInfoEntity {
   final int totalPrice;
  final bool isDelivered;
  final String state;
  final String orderNumber;
  final String createdAt;
  final String updatedAt;
  final int v;

  OrderInfoEntity(
    this.isDelivered,
    this.state,
    this.orderNumber,
    this.createdAt,
    this.updatedAt,
    this.v, this.totalPrice,
  );
}
