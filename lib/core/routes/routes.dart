import 'package:flutter/material.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';

import '../../feature/application/presentation/view/apply_screen.dart';

abstract class Routes {
  static Route onGenerate(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const ApplyScreen(),
          settings: settings,
        );


      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text(context.loc.noRouteFound),
              ),
            );
          },
          settings: settings,
        );
    }
  }
}
