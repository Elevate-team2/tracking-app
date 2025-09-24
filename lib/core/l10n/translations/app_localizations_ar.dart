// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get noRouteFound => 'لا يوجد صفحة بهذا الاسم';

  @override
  String get submitted => 'تم إرسال طلبك بنجاح!';

  @override
  String get thankYou =>
      'شكرًا لتقديم طلبك، سنقوم بمراجعته وسنعود إليك قريبًا.';

  @override
  String get login => 'تسجيل';
}
