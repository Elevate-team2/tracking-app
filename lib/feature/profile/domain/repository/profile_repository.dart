import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';



abstract interface class ProfileRepository {
  Future<Result<DriverEntity>> getLoggedDriver();
  Future<Result<void>> logoutDriver();
  Future<Result<String>> uploadDriverPhoto(File photo);
  Future<Result<EditProfileEntity>> editProfile(EditProfileRequest request);

}
