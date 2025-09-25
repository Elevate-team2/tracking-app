// "_id": "676b64279f3884b3405c14c5",
//             "type": "SUV",
//             "image": "https://flower.elevateegy.com/uploads/209b736d-8570-4f18-9ba5-2708859dda07-SUV.png",
//             "createdAt": "2024-12-25T01:47:19.749Z",
//             "updatedAt": "2024-12-25T01:47:19.749Z",
//             "__v": 0
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
  // TODO: implement props
  List<Object?> get props => [
    id,type,image,createdAt,updatedAt,speed
  ];

}