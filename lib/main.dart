//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_app/config/app_language_config/app_language_config.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/responsive/size_provider.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/core/theme/app_theme.dart';

import 'feature/auth/api/data_source/local/user_local_storage_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt.get<AppLanguageConfig>().setSelectedLocal();
  runApp(
    //DevicePreview(
      //builder: (context) =>
          ChangeNotifierProvider.value(
        value: getIt.get<AppLanguageConfig>(),
        child: const MyApp(),
      ),
   // ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appLanguageConfig = Provider.of<AppLanguageConfig>(context);

    return SizeProvider(
      baseSize: const Size(375, 812),
      height: context.screenHight,
      width: context.screenWidth,
      child:
      FutureBuilder(
        future: UserLocalStorageImpl().isLoggedIn(),
        builder: (context, snapshot) {
          final isLoggedIn = snapshot.data!=null?true:false;
          final initialRoute = isLoggedIn ? AppRoute.testRoute : AppRoute.loginRoute;
        return
          MaterialApp(
            initialRoute: initialRoute,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(appLanguageConfig.selectedLocal),
            theme: AppTheme.lightTheme,
            onGenerateRoute: Routes.onGenerate,
          );
        },
      ),
    );
  }
}
