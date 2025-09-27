import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';

part 'all_vehicles_response.g.dart';

@JsonSerializable()
class AllVehiclesResponse {
  @JsonKey(name: JsonSerlizationConstants.message)
  final String? message;
  @JsonKey(name: JsonSerlizationConstants.metadata)
  final Metadata? metadata;
  @JsonKey(name: JsonSerlizationConstants.vehicles)
  final List<Vehicles>? vehicles;

  AllVehiclesResponse({this.message, this.metadata, this.vehicles});

  factory AllVehiclesResponse.fromJson(Map<String, dynamic> json) =>
      _$AllVehiclesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllVehiclesResponseToJson(this);
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: JsonSerlizationConstants.currentPage)
  final int? currentPage;
  @JsonKey(name: JsonSerlizationConstants.totalPages)
  final int? totalPages;
  @JsonKey(name: JsonSerlizationConstants.limit)
  final int? limit;
  @JsonKey(name: JsonSerlizationConstants.totalItems)
  final int? totalItems;

  Metadata({this.currentPage, this.totalPages, this.limit, this.totalItems});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Vehicles {
  @JsonKey(name: JsonSerlizationConstants.id)
  final String? Id;
  @JsonKey(name: JsonSerlizationConstants.type)
  final String? type;
  @JsonKey(name: JsonSerlizationConstants.image)
  final String? image;
  @JsonKey(name: JsonSerlizationConstants.createdAt)
  final String? createdAt;
  @JsonKey(name: JsonSerlizationConstants.updatedAt)
  final String? updatedAt;
  @JsonKey(name: JsonSerlizationConstants.v)
  final int? speed;

  Vehicles({
    this.Id,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.speed,
  });

  factory Vehicles.fromJson(Map<String, dynamic> json) =>
      _$VehiclesFromJson(json);

  Map<String, dynamic> toJson() => _$VehiclesToJson(this);

  VehicleEntity toEntity() {
    return VehicleEntity(
      id: Id!,
      type: type!,
      image: image!,
      createdAt: createdAt!,
      updatedAt: updatedAt!,
      speed: speed!,
    );
  }
}
