part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  final RequestState? uploadPhotoRequestState;
  final File? selectedPhoto;
  final String? uploadPhotoErrorMessage;
  final String? uploadPhotoResponse;
  final RequestState? editProfileRequestState;
  final EditProfileEntity? editedProfileInfo;
  final String? editProfileErrorMessage;

  const EditProfileState({
    this.uploadPhotoRequestState = RequestState.init,
    this.selectedPhoto,
    this.uploadPhotoResponse = "",
    this.uploadPhotoErrorMessage = "",
    this.editProfileRequestState = RequestState.init,
    this.editedProfileInfo,
    this.editProfileErrorMessage = "",
  });

  EditProfileState copyWith({
    final RequestState? uploadPhotoRequestState,
    final File? selectedPhoto,
    final String? uploadPhotoErrorMessage,
    final String? uploadPhotoResponse,
    final RequestState? editProfileRequestState,
    final EditProfileEntity? editedProfileInfo,
    final String? editProfileErrorMessage,
  }) {
    return EditProfileState(
      uploadPhotoRequestState:
          uploadPhotoRequestState ?? this.uploadPhotoRequestState,
      selectedPhoto: selectedPhoto ?? this.selectedPhoto,
      uploadPhotoResponse: uploadPhotoResponse ?? this.uploadPhotoResponse,
      uploadPhotoErrorMessage:
          uploadPhotoErrorMessage ?? this.uploadPhotoErrorMessage,
      editProfileRequestState:
          editProfileRequestState ?? this.editProfileRequestState,
      editedProfileInfo: editedProfileInfo ?? this.editedProfileInfo,
      editProfileErrorMessage:
          editProfileErrorMessage ?? this.editProfileErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    uploadPhotoRequestState,
    uploadPhotoResponse,
    uploadPhotoErrorMessage,
    editProfileRequestState,
    editedProfileInfo,
    editProfileErrorMessage,
  ];
}
