import 'package:equatable/equatable.dart';

class VehicleEntity extends Equatable{
  final String id;
  final String type;
  final String image;
  final String createdAt;
  final String updatedAt;
final int speed;
  const
  VehicleEntity({ required this.id,
    required this.type,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.speed,
  }
      );
  @override
  List<Object?> get props => [
    id,type,image,createdAt,updatedAt,speed
  ];

}