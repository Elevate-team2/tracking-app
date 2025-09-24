import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';

import '../repositry/auth_repositry.dart';
@lazySingleton
class ApplyDriverUseCase {
  final ApplyRepository repository;
  ApplyDriverUseCase(this.repository);
  Future<Result<(Driver, String)>> call(Map<String, dynamic> body) {
    return repository.applyDriver(body);
  }
}
