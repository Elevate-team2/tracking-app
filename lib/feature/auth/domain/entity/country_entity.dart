import 'package:tracking_app/feature/auth/domain/entity/timezone.dart';
import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable{
  final String isoCode;
  final String name;
  final String phoneCode;
  final String flag;
  final String currency;
  final String latitude;
  final String longitude;
  final List<Timezone> timezones;
  CountryEntity({
    required this.isoCode,
    required this.name,
    required this.phoneCode,
    required this.flag,
    required this.currency,
    required this.latitude,
    required this.longitude,
    required this.timezones,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [isoCode,name,phoneCode
    ,flag,currency,latitude,longitude,timezones
  ];
}