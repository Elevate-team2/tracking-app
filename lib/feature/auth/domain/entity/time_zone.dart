import 'package:equatable/equatable.dart';

class Timezone extends Equatable{
  final String zoneName;
  final int gmtOffset;
  final String gmtOffsetName;
  final String abbreviation;
  final String tzName;
  Timezone({
    required this.zoneName,
    required this.gmtOffset,
    required this.gmtOffsetName,
    required this.abbreviation,
    required this.tzName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    zoneName,gmtOffset,gmtOffsetName,abbreviation,
    tzName
  ];
}