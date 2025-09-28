import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/feature/profile/domain/repository/profile_repository.dart';

@injectable
class UploadDriverPhotoUseCase {
  final ProfileRepository _profileRepository;
  UploadDriverPhotoUseCase(this._profileRepository);

  Future<Result<String>> cal(File photo) async {
    return await _profileRepository.uploadDriverPhoto(photo);
  }
}
