// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get noRouteFound => 'لا يوجد صفحه بهذا الاسم';

  @override
  String get enterYourEmail => 'ادخل بريدك الالكترونى';

  @override
  String get enterYourPassword => 'ادخل كلمة المرور';

  @override
  String get email => 'البريد الالكترونى';

  @override
  String get password => 'كلمة المرور';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get continue1 => 'المتابعة';

  @override
  String get forgetPassword => 'هل نسيت كلمة السر';

  @override
  String get rememberMe => 'ذكرنى';

  @override
  String get successLogin => '✅ تم تسجيل الدخول بنجاح';
}
