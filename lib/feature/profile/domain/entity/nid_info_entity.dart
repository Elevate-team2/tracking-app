import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class NationalIdInfoEntity extends Equatable {
  @JsonKey(name: "NID")
  final String? NID;
  @JsonKey(name: "NIDImg")
  final String? NIDImg;

  const NationalIdInfoEntity ({
    this.NID,
    this.NIDImg,
  });

  /// The properties used to determine if two [NationalIdInfo] instances are equal.
  @override
  List<Object?> get props => [NID, NIDImg];
}