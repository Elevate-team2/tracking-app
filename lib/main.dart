import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tracking_app/config/app_language_config/app_language_config.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/responsive/size_provider.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/core/theme/app_theme.dart';

import 'feature/auth/presentation/bloc/apply_bloc.dart';
import 'feature/auth/presentation/bloc/apply_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt.get<AppLanguageConfig>().setSelectedLocal();
  runApp(
    DevicePreview(
      builder: (context) => ChangeNotifierProvider.value(
        value: getIt.get<AppLanguageConfig>(),
        child: MyApp(),
      ),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  late AppLanguageConfig appLanguageConfig;

  @override
  Widget build(BuildContext context) {
    appLanguageConfig = Provider.of<AppLanguageConfig>(context, listen: false);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplyDriverBloc>(
          create: (context) => getIt.get<ApplyDriverBloc>(),
        ),
      ],
      child: SizeProvider(
        baseSize: const Size(375, 812),
        width: context.screenWidth,
        height: context.screenHight,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(appLanguageConfig.selectedLocal),
          theme: AppTheme.lightTheme,
          onGenerateRoute: Routes.onGenerate,
          initialRoute: "/",
        ),
      ),
    );
  }
}
