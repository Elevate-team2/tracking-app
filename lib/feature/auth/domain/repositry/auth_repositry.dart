import '../../../../core/api_result/result.dart';
import '../entity/driver_entity.dart';

abstract interface class ApplyRepository {
  Future<Result<(Driver, String)>> applyDriver(Map<String, dynamic> data);
}
