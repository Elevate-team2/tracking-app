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
  String get submitted => 'Your application has been submitted!';

  @override
  String get thankYou =>
      'Thank you for providing your application, we will review your application and will get back to you soon.';

  @override
  String get login => 'Login';
}
