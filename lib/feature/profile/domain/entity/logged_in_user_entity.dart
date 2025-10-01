import 'package:equatable/equatable.dart';

class LoggedInUserEntity extends Equatable {
  final String id;
  final String country;
  final String firstName;
  final String lastName;
  final String ?vehicleType;
  final String ?vehicleNumber;
  final String ?vehicleLicense;
  final String ?nid;
  final String ?nidImg;
  final String email;
  final String gender;
  final String phone;
  final String ?photo;
  final String ?role;
  final String ?createdAt;

  const LoggedInUserEntity({
    required this.id,
    required this.country,
    required this.firstName,
    required this.lastName,
     this.vehicleType,
     this.vehicleNumber,
     this.vehicleLicense,
     this.nid,
     this.nidImg,
    required this.email,
    required this.gender,
    required this.phone,
     this.photo,
     this.role,
     this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    country,
    firstName,
    lastName,
    vehicleType,
    vehicleNumber,
    vehicleLicense,
    nid,
    nidImg,
    email,
    gender,
    phone,
    photo,
    role,
    createdAt,
  ];
}
