import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class NationalIdInfoEntity extends Equatable {
  @JsonKey(name: "NID")
  final String? nId;
  @JsonKey(name: "NIDImg")
  final String? nIdImg;

  const NationalIdInfoEntity ({
    this.nId,
    this.nIdImg,
  });

  /// The properties used to determine if two [NationalIdInfo] instances are equal.
  @override
  List<Object?> get props => [nId, nIdImg];
}