import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/domain/entity/driver_contact_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/driver_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/vehicle_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';

@injectable
class ProfileUseCase {
  final ProfileRepository _profileRepository;
  ProfileUseCase(this._profileRepository);
  Future<Result<DriverInfoEntity>>GetDriverInfo()async{
    return _profileRepository.getDriverInfo();
  }
  Future<Result<DriverContactInfoEntity>>GetDriverContactInfo()async{
    return await _profileRepository.getDriverContactInfo();
  }
  Future<Result<VehicleInfoEntity>>GetVehicleInfo()async{
    return await _profileRepository.getVehicleInfo();
  }
}