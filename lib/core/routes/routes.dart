import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/feature/application/presentation/view/approve_screen.dart';

import '../../config/di/di.dart';
import '../../feature/auth/presentation/bloc/apply_bloc.dart';
import '../../feature/auth/presentation/view/screens/apply_screen.dart';

abstract class Routes {
  static Route onGenerate(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<ApplyDriverBloc>(),
            child: const ApplyScreen(),
          ),
          settings: settings,
        );
      case AppRoute.approveScreen:
        return MaterialPageRoute(
          builder: (context) => const ApproveScreen(),
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
