import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/api/models/edit_profile/request/edit_profile_request.dart';
import 'package:tracking_app/feature/profile/domain/entity/edit_profile_entity.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepository _profileRepository;
  EditProfileUseCase(this._profileRepository);

  Future<Result<EditProfileEntity>> call(EditProfileRequest request)async{
    return await _profileRepository.editProfile(request);
  }

}