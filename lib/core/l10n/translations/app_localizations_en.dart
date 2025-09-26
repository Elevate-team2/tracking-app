// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get noRouteFound => 'No Route Found';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Password';

  @override
  String get forgetPassword => 'Forget Password';

  @override
  String get pleaseEnterEmail =>
      'Please enter your email associated with your account';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get confirm => 'Confirm';

  @override
  String get verifyCode => 'Verify Code';

  @override
  String get emailVerification => 'Email Verification';

  @override
  String get enterCodeEmail => 'Please enter the code sent to your email';

  @override
  String get verify => 'Verify';

  @override
  String get didNotReceiveCode => 'Didn\'t receive code?';

  @override
  String get resend => 'Resend';

  @override
  String get success => 'Success ✅';

  @override
  String get error => 'Error ❌';

  @override
  String get resetPasswordTitle => 'Reset password';

  @override
  String get resetPasswordSubtitle =>
      'Password must not be empty and must contain 6 characters with upper case letter and one number at least.';

  @override
  String get newPassword => 'New password';

  @override
  String get enterNewPassword => 'Enter new password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get successReset => 'Password reset successfully';

  @override
  String get errorReset => 'Something went wrong';

  @override
  String get enterYourEmail => 'Enter your E-mail';

  @override
  String get enterYourPassword => 'Enter your Password';

  @override
  String get login => 'Login';

  @override
  String get continue1 => 'Continue';

  @override
  String get rememberMe => 'Remember Me';

  @override
  String get successLogin => '✅ Success Login';

  @override
  String get submitted => 'Your application has been submitted!';

  @override
  String get thankYou =>
      'Thank you for providing your application, we will review your application and will get back to you soon.';

  @override
  String get welcome => 'Welcome to';

  @override
  String get flowery => 'Flowery rider app';

  @override
  String get apply => 'Apply';

  @override
  String get home => 'Home';

  @override
  String get orders => 'Orders';

  @override
  String get profile => 'Profile';
}
