import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/feature/order/domain/entity/order_driver_entity.dart';
import '../../../domain/usecase/get_all_driver_orders.dart';
import 'order_events.dart';
import 'order_states.dart';

@singleton
class OrderBloc extends Bloc<OrderEvent, OrderStates> {
  final GetAllDriverOrdersUseCase _getDriverOrdersUseCase;

  OrderBloc(this._getDriverOrdersUseCase) : super(const OrderStates()) {
    on<GetDriverOrdersEvent>(_getDriverOrders);
    on<RefreshDriverOrdersEvent>(_refreshOrders);
  }

  Future<void> _getDriverOrders(
      GetDriverOrdersEvent event,
      Emitter<OrderStates> emit,
      ) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await _getDriverOrdersUseCase.getAllDriverOrders();

    switch (result) {
      case SucessResult<OrderDriverEntity>():
        emit(
          state.copyWith(
            requestState: RequestState.success,
            orders: result.sucessResult,
          ),
        );

      case FailedResult<OrderDriverEntity>():
        emit(
          state.copyWith(
            requestState: RequestState.error,
            errorMessage: result.errorMessage,
          ),
        );
    }
  }

  Future<void> _refreshOrders(
      RefreshDriverOrdersEvent event,
      Emitter<OrderStates> emit,
      ) async {
    await _getDriverOrders(const GetDriverOrdersEvent(), emit);
  }
}
