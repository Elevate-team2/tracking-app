import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/home/data/source/home_local_data_source.dart';
import 'package:tracking_app/feature/home/data/source/home_remote_data_source.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';
import 'package:tracking_app/feature/home/domain/repository/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepositoryImp(this._homeRemoteDataSource, this._homeLocalDataSource);

  @override
  Future<Result<List<OrderEntity>?>> getAllPendingOrders() async {
    return await _homeRemoteDataSource.getAllPendingOrders();
  }

  @override
  Future<Result<List<OrderEntity>?>> getAllLocalOrders() async {
    return await _homeLocalDataSource.getAllLocalOrders();
  }
}
