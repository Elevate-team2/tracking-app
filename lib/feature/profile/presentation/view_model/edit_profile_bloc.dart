import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/feature/profile/api/models/edit_profile/request/edit_profile_request.dart';
import 'package:tracking_app/feature/profile/domain/entity/edit_profile_entity.dart';
import 'package:tracking_app/feature/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:tracking_app/feature/profile/domain/use_case/upload_driver_photo_use_case.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final UploadDriverPhotoUseCase _uploadDriverPhotoUseCase;
  final EditProfileUseCase _editProfileUseCase;
  EditProfileBloc(this._uploadDriverPhotoUseCase, this._editProfileUseCase)
    : super(const EditProfileState()) {
    on<UploadDriverPhotoEvent>(_uploadDriverPhoto);
    on<EditBtnSubmitEvent>(_editBtnSubmitEvent);
  }
  Future<void> _uploadDriverPhoto(
    UploadDriverPhotoEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(state.copyWith(uploadPhotoRequestState:  RequestState.loading));
    final result = await _uploadDriverPhotoUseCase.call(event.photo);

    switch (result) {
      case SucessResult<String>():
        emit(
          state.copyWith(
            uploadPhotoRequestState: RequestState.success,
            uploadPhotoResponse: result.sucessResult
          ),
        );
      case FailedResult<String>():
        emit(
          state.copyWith(
            uploadPhotoRequestState: RequestState.error,
            uploadPhotoErrorMessage: result.errorMessage,
          ),
        );
    }
  }

  Future<void> _editBtnSubmitEvent(
    EditBtnSubmitEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(state.copyWith(editProfileRequestState: RequestState.loading));
    final result = await _editProfileUseCase.call(event.request);

    switch (result) {
      case SucessResult<EditProfileEntity>():
        emit(
          state.copyWith(
            editProfileRequestState: RequestState.success,
            editedProfileInfo: result.sucessResult
          ),
        );
      case FailedResult<EditProfileEntity>():
        emit(
          state.copyWith(
            editProfileRequestState: RequestState.error,
            editProfileErrorMessage: result.errorMessage,
          ),
        );
    }
  }
}
