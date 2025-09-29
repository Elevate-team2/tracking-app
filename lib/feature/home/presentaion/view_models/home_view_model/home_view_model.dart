import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';
import 'package:tracking_app/feature/home/domain/usecase/delete_local_order.dart';
import 'package:tracking_app/feature/home/domain/usecase/get_all_pending_orders.dart';
import 'package:tracking_app/feature/home/domain/usecase/get_all_saved_orders.dart';
import 'package:tracking_app/feature/home/domain/usecase/save_data_to_local.dart';
import 'package:tracking_app/feature/home/presentaion/view_models/home_view_model/home_events.dart';
import 'package:tracking_app/feature/home/presentaion/view_models/home_view_model/home_states.dart';

@singleton
class HomeViewModel extends Bloc<HomeEvents, HomeStates> {
  final GetAllPendingOrdersUseCase _getAllPendingOrdersUseCase;
  final SaveDataToLocalUseCase _saveDataToLocalUseCase;
  final GetAllSavedOrdersUseCase _getAllSavedOrdersUseCase;
  final DeleteLocalOrderUseCase _deleteLocalOrderUseCase;
  bool firtTime = true;
  int count = 0;
  HomeViewModel(
    this._getAllPendingOrdersUseCase,
    this._saveDataToLocalUseCase,
    this._getAllSavedOrdersUseCase,
    this._deleteLocalOrderUseCase,
  ) : super(HomeStates()) {
    on<GetAllPaindingOrdersEvent>(_getAllPedningOrders);
    on<GetAllLocalOrdersEvent>(_getLocalOrders);
    on<GetOrdersEvent>(_getOrders);
    on<DeleteOrderLocalyEvent>(_deleteOrderLocaly);
    on<RefreshOrdersEvent>(_refreshOrders);
  }

  void _getOrders(GetOrdersEvent event, Emitter<HomeStates> emit) async {
    if (firtTime) {
      await _getAllPedningOrders(GetAllPaindingOrdersEvent(), emit);
      firtTime = false;
    } else {
      await _getLocalOrders(GetAllLocalOrdersEvent(), emit);
    }
  }

  Future<void> _getAllPedningOrders(
    GetAllPaindingOrdersEvent event,
    Emitter emit,
  ) async {
    count++;
    print(count);
    emit(state.copyWith(isLoading: true));
    final res = await _getAllPendingOrdersUseCase.getAllPendingOrders();

    switch (res) {
      case SucessResult<List<OrderEntity>?>():
        _saveDataToLocalUseCase.saveDataToLocalStorage(res.sucessResult);
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
    }
  }

  Future<void> _getLocalOrders(
    GetAllLocalOrdersEvent event,
    Emitter emit,
  ) async {
    count++;
    print(count);
    print("local");
    final res = await _getAllSavedOrdersUseCase.getAllSavedOrders();
    switch (res) {
      case SucessResult<List<OrderEntity>?>():
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
    }
  }

  Future<void> _deleteOrderLocaly(
    DeleteOrderLocalyEvent event,
    Emitter emit,
  ) async {
    count++;
    print(count);
    final res = await _deleteLocalOrderUseCase.deleteOrder(event.orderId);

    switch (res) {
      case SucessResult():
        await _getLocalOrders(GetAllLocalOrdersEvent(), emit);

      case FailedResult():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: res.errorMessage,
            orders: null,
          ),
        );
    }
  }

  void _refreshOrders(RefreshOrdersEvent event, emit) async {
   await  _getAllPedningOrders(GetAllPaindingOrdersEvent(), emit);
  }
}
