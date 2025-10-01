import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_bloc.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/edit_profile_bloc.dart';

import 'edit_vehicle_info_test.mocks.dart' ;
@GenerateMocks([
  EditProfileBloc,
  ApplyBloc,
  ImagePicker,
  Directory,
])
void main() {
  late MockEditProfileBloc mockEditProfileBloc;
  late  MockApplyBloc mockApplyBloc;
  setUp((){
    mockEditProfileBloc=MockEditProfileBloc();
    mockApplyBloc=MockApplyBloc();
    when(mockEditProfileBloc.state).
    thenReturn(const EditProfileState());
    when(mockEditProfileBloc.stream).
    thenAnswer((_)=>Stream.fromIterable([
    ]));

  });
  test('Verfiy Structure', () {

  });
}