import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
import 'package:tracking_app/feature/profile/api/models/edit_profile/response/driver_model.dart';
import 'package:tracking_app/feature/profile/domain/entity/edit_profile_entity.dart';

part 'edit_profile_response.g.dart';

@JsonSerializable()
class EditProfileResponse {
  @JsonKey(name: JsonSerlizationConstants.message)
  final String? message;
  @JsonKey(name: JsonSerlizationConstants.driver)
  final DriverModel? driver;

  EditProfileResponse ({
    this.message,
    this.driver,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$EditProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProfileResponseToJson(this);
  }

  EditProfileEntity toEntity(){
    return EditProfileEntity(
      id: driver!.id!,
      country: driver!.country!,
      firstName: driver!.firstName!,
      lastName: driver!.lastName!,
      vehicleType: driver!.vehicleType!,
      vehicleNumber: driver!.vehicleNumber!,
      vehicleLicense: driver!.vehicleLicense!,
      nid: driver!.nId!,
      nidImg: driver!.nIdImg!,
      email: driver!.email!,
      gender: driver!.gender!,
      phone: driver!.phone!,
      photo:driver!. photo!,
    );
  }

}



