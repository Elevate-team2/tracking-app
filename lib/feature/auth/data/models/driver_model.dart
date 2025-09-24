import '../../domain/entity/driver_entity.dart';

class DriverModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String gender;
  final String country;
  final String vehicleType;
  final String vehicleNumber;
  final String vehicleLicense;
  final String nid;
  final String nidImg;
  final String role;
  final String photo;
  final String createdAt;
  final String email;

  const DriverModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.gender,
    required this.country,
    required this.vehicleType,
    required this.vehicleNumber,
    required this.vehicleLicense,
    required this.nid,
    required this.nidImg,
    required this.role,
    required this.photo,
    required this.createdAt,
    required this.email,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['_id']?.toString() ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phone: json['phone']?.toString() ?? '',
      gender: json['gender'] ?? '',
      country: json['country'] ?? '',
      vehicleType: json['vehicleType'] ?? '',
      vehicleNumber: json['vehicleNumber']?.toString() ?? '',
      vehicleLicense: json['vehicleLicense'] ?? '',
      nid: json['NID']?.toString() ?? '',
      nidImg: json['NIDImg'] ?? '',
      role: json['role'] ?? '',
      photo: json['photo'] ?? '',
      createdAt: json['createdAt'] ?? '',
      email: json['email'] ?? '',
    );
  }


  Driver toEntity() {
    return Driver(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      gender: gender,
      country: country,
      vehicleType: vehicleType,
      vehicleNumber: vehicleNumber,
      vehicleLicense: vehicleLicense,
      nid: nid,
      nidImg: nidImg,
      role: role,
      photo: photo,
      createdAt: createdAt,
      email: email,
    );
  }
}
