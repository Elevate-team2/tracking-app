import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';

part 'all_vehicles_response.g.dart';

@JsonSerializable()
class AllVehiclesResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "vehicles")
  final List<Vehicles>? vehicles;

  AllVehiclesResponse ({
    this.message,
    this.metadata,
    this.vehicles,
  });

  factory AllVehiclesResponse.fromJson(Map<String, dynamic> json) {
    return _$AllVehiclesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllVehiclesResponseToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalItems")
  final int? totalItems;

  Metadata ({
    this.currentPage,
    this.totalPages,
    this.limit,
    this.totalItems,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class Vehicles {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? speed;

  Vehicles ({
    this.Id,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.speed,
  });

  factory Vehicles.fromJson(Map<String, dynamic> json) {
    return _$VehiclesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VehiclesToJson(this);
  }
VehicleEntity toEntity(){
    return VehicleEntity(id: Id!,
        type: type!,
        image: image!,
        createdAt: createdAt!,
        updatedAt: updatedAt!,
        speed: speed!);
}
}


