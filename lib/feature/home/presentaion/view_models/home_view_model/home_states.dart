import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';

class HomeStates {
  final bool isLoading;
  final List<OrderEntity>? orders;
   String? errorMessage;

   HomeStates({
    this.isLoading = true,
    this.orders,
    this.errorMessage,
  });

  HomeStates copyWith({
    bool? isLoading,
    List<OrderEntity>? orders,
    String? errorMessage,
  }) {
    return HomeStates(
      isLoading: isLoading ?? this.isLoading,
      orders: orders ?? this.orders,
      errorMessage: errorMessage ,
    );
  }
}



