import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/home/domain/repository/home_repository.dart';

@injectable
class DeleteLocalOrderUseCase {
  final HomeRepository _homeRepository;

  DeleteLocalOrderUseCase(this._homeRepository);

  Future<Result<void>> deleteOrder(String orderId) async {
    return await _homeRepository.deleteOrder(orderId);
  }
}
