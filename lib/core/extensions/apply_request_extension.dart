import 'package:dio/dio.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';

import '../../feature/auth/api/models/apply/request/apply_request.dart';

extension ApplyRequestMapper on ApplyRequest {
  FormData toFormData() {
    final formData = FormData();

    toJson().forEach((key, value) {
      if (value != null) {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    });

    if (vehicleLicense != null) {
      formData.files.add(
        MapEntry(
          JsonSerlizationConstants.vehicleLicense,
          MultipartFile.fromFileSync(
            vehicleLicense!.path,
            filename: vehicleLicense!.path.split('/').last,
          ),
        ),
      );
    }

    if (nidimg != null) {
      formData.files.add(
        MapEntry(
          JsonSerlizationConstants.nidImg,
          MultipartFile.fromFileSync(
            nidimg!.path,
            filename: nidimg!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}
