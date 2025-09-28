import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/domain/entity/store_entity.dart';
part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "latLong")
  String? latLong;

  StoreModel({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);

  static StoreEntity storeModelToEntity(StoreModel? model) {
    if (model == null) {
      return StoreEntity(
        name: 'Fake Store',
        image: '',
        address: '123 Fake Street',
        phoneNumber: '01000000000',
        latLong: '0.0000,0.0000',
      );
    }

    return StoreEntity(
      name: model.name ?? '',
      image: model.image ?? '',
      address: model.address ?? '',
      phoneNumber: model.phoneNumber ?? '',
      latLong: model.latLong ?? '',
    );
  }
}
