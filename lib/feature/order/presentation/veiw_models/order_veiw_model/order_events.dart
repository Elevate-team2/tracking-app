import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class GetDriverOrdersEvent extends OrderEvent {
  const GetDriverOrdersEvent();
}

class RefreshDriverOrdersEvent extends OrderEvent {
  const RefreshDriverOrdersEvent();
}
