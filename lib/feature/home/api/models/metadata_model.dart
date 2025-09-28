import 'package:json_annotation/json_annotation.dart';
part 'metadata_model.g.dart';
@JsonSerializable()
class MetadataModel {
    @JsonKey(name: "currentPage")
    int? currentPage;
    @JsonKey(name: "totalPages")
    int? totalPages;
    @JsonKey(name: "totalItems")
    int? totalItems;
    @JsonKey(name: "limit")
    int? limit;

    MetadataModel({
        this.currentPage,
        this.totalPages,
        this.totalItems,
        this.limit,
    });

    factory MetadataModel.fromJson(Map<String, dynamic> json) => _$MetadataModelFromJson(json);

    Map<String, dynamic> toJson() => _$MetadataModelToJson(this);
}

