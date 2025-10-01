import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
import 'package:tracking_app/feature/home/domain/entity/store_entity.dart';

part 'remote_store_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RemoteStoreModel {
 @JsonKey(name: JsonSerlizationConstants.name)
String? name;

@JsonKey(name: JsonSerlizationConstants.image)
String? image;

@JsonKey(name: JsonSerlizationConstants.address)
String? address;

@JsonKey(name: JsonSerlizationConstants.phoneNumber)
String? phoneNumber;

@JsonKey(name: JsonSerlizationConstants.latLong)
String? latLong;

  RemoteStoreModel({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });

  factory RemoteStoreModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteStoreModelToJson(this);

  StoreEntity toEntity() {
    return StoreEntity(
      name: name ?? '',
      image: image ?? '',
      address: address ?? '',
      phoneNumber: phoneNumber ?? '',
      latLong: latLong ?? '',
    );
  }

  factory RemoteStoreModel.fromEntity(StoreEntity entity) {
    return RemoteStoreModel(
      name: entity.name,
      image: entity.image,
      address: entity.address,
      phoneNumber: entity.phoneNumber,
      latLong: entity.latLong,
    );
  }
}
