import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/profile/api/models/driver_contact_info.dart';
import 'package:tracking_app/feature/profile/api/models/driver_info.dart';
import 'package:tracking_app/feature/profile/api/models/location_info.dart';
import 'package:tracking_app/feature/profile/api/models/nid_info.dart';
import 'package:tracking_app/feature/profile/api/models/vehicle_info.dart';
import 'package:tracking_app/feature/profile/domain/entity/driver_all_info_entity.dart';
part 'driver_model.g.dart';

@JsonSerializable()
class DriverModel {
  final DriverInfo? info;
  final DriverContactInfo? contact;
  final VehicleInfo? vehicle;
  final LocationInfo? location;
  final NationalIdInfo? nid;

  DriverModel({
    this.info,
    this.contact,
    this.vehicle,
    this.location,
    this.nid,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      info: DriverInfo.fromJson(json),
      contact: DriverContactInfo.fromJson(json),
      vehicle: VehicleInfo.fromJson(json),
      location: LocationInfo.fromJson(json),
      nid: NationalIdInfo.fromJson(json),
    );
  }

  DriverAllInfoEntity toEntity() {
    return DriverAllInfoEntity(
      info: info?.toEntity(),
      contact: contact?.toEntity(),
      vehicle: vehicle?.toEntity(),
      location: location?.toEntity(),
      nid: nid?.toEntity(),
    );
  }
}
