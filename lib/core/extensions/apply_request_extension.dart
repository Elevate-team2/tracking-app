// import 'package:dio/dio.dart';
// import 'package:tracking_app/core/constants/json_serlization_constants.dart';
//
// import '../../feature/auth/api/models/apply/request/apply_request.dart';
//
// extension ApplyRequestMapper on ApplyRequest {
//   FormData toFormData() {
//     final formData = FormData();
//
//     toJson().forEach((key, value) {
//       if (value != null) {
//         formData.fields.add(MapEntry(key, value.toString()));
//       }
//     });
//
//     if (vehicleLicense != null) {
//       formData.files.add(
//         MapEntry(
//           JsonSerlizationConstants.vehicleLicense,
//           MultipartFile.fromFileSync(
//             vehicleLicense!.path,
//             filename: vehicleLicense!.path.split('/').last,
//           ),
//         ),
//       );
//     }
//
//     if (nidimg != null) {
//       formData.files.add(
//         MapEntry(
//           JsonSerlizationConstants.nidImg,
//           MultipartFile.fromFileSync(
//             nidimg!.path,
//             filename: nidimg!.path.split('/').last,
//           ),
//         ),
//       );
//     }
//
//     return formData;
//   }
// }
import 'dart:io';

import 'package:dio/dio.dart';

import '../../feature/auth/api/models/apply/request/apply_request.dart';
extension ApplyRequestFormData on ApplyRequest {
  Future<FormData> toFormData() async {
    final formData = FormData();

    // Personal Info
    if (personalInfo != null) {
      formData.fields.addAll([
        MapEntry('firstName', personalInfo!.firstName ?? ''),
        MapEntry('lastName', personalInfo!.lastName ?? ''),
        MapEntry('gender', personalInfo!.gender ?? ''),
        MapEntry('phone', personalInfo!.phone ?? ''),
        MapEntry('email', personalInfo!.email ?? ''),
        MapEntry('NID', personalInfo!.nid ?? ''),
      ]);

      if (personalInfo!.nidimg != null) {
        formData.files.add(
          MapEntry(
            'NIDImg',
            await _fileToMultipart(personalInfo!.nidimg!),
          ),
        );
      }
    }

    // Location Info
    if (locationInfo != null) {
      if (locationInfo!.country != null) {
        formData.fields.add(MapEntry('country', locationInfo!.country!));
      }
    }

    // Vehicle Info
    if (vehicleInfo != null) {
      formData.fields.addAll([
        MapEntry('vehicleType', vehicleInfo!.vehicleType ?? ''),
        MapEntry('vehicleNumber', vehicleInfo!.vehicleNumber ?? ''),
      ]);

      if (vehicleInfo!.vehicleLicense != null) {
        formData.files.add(
          MapEntry(
            'vehicleLicense',
            await _fileToMultipart(vehicleInfo!.vehicleLicense!),
          ),
        );
      }
    }

    // Authentication Info
    if (authenticationInfo != null) {
      formData.fields.addAll([
        MapEntry('password', authenticationInfo!.password ?? ''),
        MapEntry('rePassword', authenticationInfo!.rePassword ?? ''),
      ]);
    }

    return formData;
  }

  Future<MultipartFile> _fileToMultipart(File file) async {
    return MultipartFile.fromFile(
      file.path,
      filename: file.path.split('/').last,
    );
  }
}

