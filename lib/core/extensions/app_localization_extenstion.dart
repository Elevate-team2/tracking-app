import 'package:flutter/material.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';

extension AppLocalizationExtenstion on BuildContext {
  AppLocalizations get loc =>
      AppLocalizations.of(this)!;  // this mean the object after on(Build Context)
}
