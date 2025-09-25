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
      return result;
    } catch (e) {
      return FailedResult("Repository error", e.toString());
    }
  }
}
