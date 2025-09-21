import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/constants/constants.dart';


@singleton
class AppLanguageConfig extends ChangeNotifier {
  SharedPreferences sharedPreferences;
  AppLanguageConfig({required this.sharedPreferences});
  String selectedLocal = Constants.enLocal;

  bool isEn() => selectedLocal == Constants.enLocal;
  @preResolve
  Future<void> setSelectedLocal()async {
    var currentLocal = sharedPreferences.getString(
      Constants.sharedPrefrenceKeyLanguage,
    );
    selectedLocal = currentLocal??Constants.enLocal;
  }

  @preResolve

  Future<void> changeLocal(String currentLocal) async {
    if (selectedLocal == currentLocal) return;

    selectedLocal = currentLocal;
    sharedPreferences.setString(
      Constants.sharedPrefrenceKeyLanguage,
      selectedLocal,
    );
    notifyListeners();
  }
}
