import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';
import 'package:tracking_app/feature/home/domain/usecase/get_all_pending_orders.dart';
import 'package:tracking_app/feature/home/presentaion/view_models/home_view_model/home_events.dart';
import 'package:tracking_app/feature/home/presentaion/view_models/home_view_model/home_states.dart';

@injectable
class HomeViewModel extends Bloc<HomeEvents, HomeStates> {
  final GetAllPendingOrdersUseCase _getAllPendingOrdersUseCase;
  HomeViewModel(this._getAllPendingOrdersUseCase) : super( HomeStates()) {
    on<GetAllPaindingOrdersEvent>(_getAllPedningOrders);
  }

  Future<void> _getAllPedningOrders(
    GetAllPaindingOrdersEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final res = await _getAllPendingOrdersUseCase.getAllPendingOrders();

    switch (res) {
      case SucessResult<List<OrderEntity>?>():
        print("came here");
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: null,
            orders: res.sucessResult,
          ),
        );
      case FailedResult<List<OrderEntity>?>():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: res.errorMessage,
            orders: null,
          ),
        );
        throw UnimplementedError();
    }
  }
}
