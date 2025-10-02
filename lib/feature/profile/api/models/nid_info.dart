import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/core/constants/json_serlization_constants.dart';
import '../../domain/entity/national_id_info_entity.dart';

part 'nid_info.g.dart';

@JsonSerializable()
class NationalIdInfo {
  @JsonKey(name: JsonSerlizationConstants.nid)
  final String? nId;
  @JsonKey(name: JsonSerlizationConstants.nidImg)
  final String? nIdImg;

  NationalIdInfo({this.nId, this.nIdImg});

  factory NationalIdInfo.fromJson(Map<String, dynamic> json) => _$NationalIdInfoFromJson(json);
  Map<String, dynamic> toJson() => _$NationalIdInfoToJson(this);

  NationalIdInfoEntity toEntity() {
    return NationalIdInfoEntity(
      nid: nId ?? "",
      nidImg: nIdImg ?? "",
    );
  }
}
