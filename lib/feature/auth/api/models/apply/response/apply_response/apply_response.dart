import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';


part 'apply_response.g.dart';

@JsonSerializable()
class ApplyResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "driver")
  final Driver? driver;
  @JsonKey(name: "token")
  final String? token;

  ApplyResponse ({
    this.message,
    this.driver,
    this.token,
  });

  factory ApplyResponse.fromJson(Map<String, dynamic> json) {
    return _$ApplyResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApplyResponseToJson(this);
  }
}

@JsonSerializable()
class Driver {
  @JsonKey(name: "country")
  final String? country;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "vehicleType")
  final String? vehicleType;
  @JsonKey(name: "vehicleNumber")
  final String? vehicleNumber;
  @JsonKey(name: "vehicleLicense")
  final String? vehicleLicense;
  @JsonKey(name: "NID")
  final String? NID;
  @JsonKey(name: "NIDImg")
  final String? NIDImg;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Driver ({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.NID,
    this.NIDImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.Id,
    this.createdAt,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return _$DriverFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DriverToJson(this);
  }
  DriverEntity toEntity(){
    return DriverEntity(id: Id!,
        country: country!,
        firstName: firstName!,
        lastName: lastName!,
        vehicleType: vehicleType!,
        vehicleNumber: vehicleNumber!,
        vehicleLicense: vehicleLicense!,
        nid: NID!,
        nidImg: NIDImg!, email: email!, gender: gender!,
        phone: phone!,
        photo: photo!,
        role: role!,
        createdAt: createdAt!);
  }
}

