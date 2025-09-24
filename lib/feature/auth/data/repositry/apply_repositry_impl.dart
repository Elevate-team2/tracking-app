import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';
import 'package:tracking_app/feature/auth/domain/repositry/auth_repositry.dart';
import 'package:tracking_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';

@Injectable(as: ApplyRepository)
class ApplyRepositoryImpl implements ApplyRepository {
  final AuthRemoteDataSource remoteDataSource;

  ApplyRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<(Driver, String)>> applyDriver(Map<String, dynamic> data) async {
    try {
      final result = await remoteDataSource.applyDriver(data);

      if (result is SuccessResult<(Driver, String)>) {
        return result;
      } else if (result is FailedResult) {
        return result;
      }

      return FailedResult("Unknown error", "Unexpected result type");
    } catch (e) {
      return FailedResult("Exception occurred", e.toString());
    }
  }
}