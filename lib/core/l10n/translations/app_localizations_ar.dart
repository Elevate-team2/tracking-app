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
  String get email => 'البريد الالكترونى';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgetPassword => 'هل نسيت كلمة السر';

  @override
  String get pleaseEnterEmail =>
      'من فضلك أدخل البريد الإلكتروني المرتبط بحسابك';

  @override
  String get enterEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get confirm => 'تأكيد';

  @override
  String get verifyCode => 'تحقق من الرمز';

  @override
  String get emailVerification => 'التحقق من البريد الإلكتروني';

  @override
  String get enterCodeEmail => 'من فضلك أدخل الرمز المرسل إلى بريدك';

  @override
  String get verify => 'تحقق';

  @override
  String get didNotReceiveCode => 'لم يصلك الرمز؟';

  @override
  String get resend => 'إعادة إرسال';

  @override
  String get success => 'تم بنجاح ✅';

  @override
  String get error => 'خطأ ❌';

  @override
  String get resetPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get resetPasswordSubtitle =>
      'يجب ألا تكون كلمة المرور فارغة ويجب أن تحتوي على 6 أحرف على الأقل مع حرف كبير ورقم واحد على الأقل.';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get enterNewPassword => 'أدخل كلمة المرور الجديدة';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get successReset => 'تم إعادة تعيين كلمة المرور بنجاح';

  @override
  String get errorReset => 'حدث خطأ ما';

  @override
  String get enterYourEmail => 'ادخل بريدك الالكترونى';

  @override
  String get enterYourPassword => 'ادخل كلمة المرور';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get continue1 => 'المتابعة';

  @override
  String get rememberMe => 'ذكرنى';

  @override
  String get successLogin => '✅ تم تسجيل الدخول بنجاح';

  @override
  String get submitted => 'تم إرسال طلبك بنجاح!';

  @override
  String get thankYou =>
      'شكرًا لتقديم طلبك، سنقوم بمراجعته وسنعود إليك قريبًا.';

  @override
  String get welcome => 'مرحباً بك في';

  @override
  String get flowery => 'تطبيق فلاورى للركاب';

  @override
  String get apply => 'تقديم طلب';

  @override
  String get home => 'الرئيسية';

  @override
  String get orders => 'الطلبات';

  @override
  String get profile => 'الملف الشخصي';
}
