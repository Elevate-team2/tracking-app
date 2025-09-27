import 'package:dio/dio.dart';

import '../../feature/auth/api/models/apply/request/apply_request.dart';

extension ApplyRequestMapper on ApplyRequest {
  FormData toFormData() {
    final formData = FormData();

    // الحقول النصية
    toJson().forEach((key, value) {
      if (value != null) {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    });

    // الملفات (أسماء لازم تطابق السيرفر)
    if (vehicleLicense != null) {
      formData.files.add(
        MapEntry(
          "vehicleLicense", // <-- غير الاسم حسب المطلوب
          MultipartFile.fromFileSync(
            vehicleLicense!.path,
            filename: vehicleLicense!.path.split('/').last,
          ),
        ),
      );
    }

    if (NIDImg != null) {
      formData.files.add(
        MapEntry(
          "NIDImg", // <-- تأكد من الكابيتال
          MultipartFile.fromFileSync(
            NIDImg!.path,
            filename: NIDImg!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}
