import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/profile/domain/entity/nid_info_entity.dart';

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
  NationalIdInfoEntity toEntity(){
    return NationalIdInfoEntity(
      NID: NID ?? '',
      NIDImg: NIDImg ?? '',
    );
  }
}


