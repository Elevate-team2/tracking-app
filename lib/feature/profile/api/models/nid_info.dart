import 'package:json_annotation/json_annotation.dart';

part 'nid_info.g.dart';

@JsonSerializable()
class NationalIdInfo {
  @JsonKey(name: "NID")
  final String? NID;
  @JsonKey(name: "NIDImg")
  final String? NIDImg;

  NationalIdInfo ({
    this.NID,
    this.NIDImg,
  });

  factory NationalIdInfo.fromJson(Map<String, dynamic> json) {
    return _$NationalIdInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NationalIdInfoToJson(this);
  }
}


