import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/domain/entity/shipping_address_entity.dart';
part 'shipping_address_model.g.dart';

@JsonSerializable()
class ShippingAddressModel {
  @JsonKey(name: "street")
  String? street;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "lat")
  String? lat;
  @JsonKey(name: "long")
  String? long;

  ShippingAddressModel({
    this.street,
    this.city,
    this.phone,
    this.lat,
    this.long,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressModelToJson(this);

  static ShippingAddressEntity shippingAddressModelToEntity(
    ShippingAddressModel? model,
  ) {
    if (model == null) {
      return ShippingAddressEntity(
        street: "Zagazig",
        city: "Sharkia",
        phone: "01010518802",
        lat: "31.7195459",
        long: "31.7195459",
      );
    }

    return ShippingAddressEntity(
      street: model.street ?? "",
      city: model.city ?? "",
      phone: model.phone ?? "",
      lat: model.lat ?? "",
      long: model.long ?? "",
    );
  }
}
