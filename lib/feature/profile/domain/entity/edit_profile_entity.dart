import 'package:equatable/equatable.dart';
import 'package:tracking_app/feature/profile/domain/entity/driver_contact_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/driver_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/location_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/national_id_info_entity.dart';
import 'package:tracking_app/feature/profile/domain/entity/vehicle_info_entity.dart';


class EditProfileEntity extends Equatable {
  final DriverInfoEntity? info;
  final DriverContactInfoEntity? contact;
  final VehicleInfoEntity? vehicle;
  final LocationInfoEntity? location;
  final NationalIdInfoEntity? nid;

  const EditProfileEntity({
     this.info,
     this.contact,
     this.vehicle,
     this.location,
     this.nid,
  });

  @override
  List<Object?> get props => [info, contact, vehicle, location, nid];
}
