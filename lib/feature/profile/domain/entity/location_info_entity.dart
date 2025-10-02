import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class LocationInfoEntity extends Equatable {
  @JsonKey(name: "country")
  final String? country;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  const LocationInfoEntity ({
    this.country,
    this.createdAt,
  });

  /// The properties used to determine if two [LocationInfo] instances are equal.
  @override
  List<Object?> get props => [country, createdAt];
}