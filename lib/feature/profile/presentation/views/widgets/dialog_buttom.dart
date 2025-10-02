import 'package:flutter/material.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/profile_bloc.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/profile_event.dart';


class DialogButtom extends StatelessWidget {
  const DialogButtom({
    super.key,
    required this.profileBloc,
  });

  final ProfileBloc profileBloc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        profileBloc.add(LogoutDriverEvent());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.setWidth(30)),
        ),
        padding:  EdgeInsets.symmetric(
          vertical: context.setHight(12),
          horizontal: context.setWidth(24),
        ),
      ),
      child: Text(
        context.loc.logout,
        style: getMediumStyle(color: AppColors.white),
      ),
    );
  }
}
