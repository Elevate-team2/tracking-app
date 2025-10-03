import 'package:flutter/material.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/profile_view_model/profile_bloc.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/dialog_buttom.dart';

class CustumDialog extends StatelessWidget {
  final ProfileBloc profileBloc;
  @override
  const CustumDialog({super.key, required this.profileBloc});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.setWidth(16))),
      child: Padding(
        padding:  EdgeInsets.all(context.setWidth(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.loc.logout),
             SizedBox(height: context.setHight(10)),
            Text(
              context.loc.confirmLogout, //
              style: getRegularStyle(
                color: AppColors.black,
                fontSize: context.setSp(FontSize.s16),
              ),
            ),
             SizedBox(height: context.setHight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cancel button
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.setWidth(30)),
                    ),
                    padding:  EdgeInsets.symmetric(
                      vertical: context.setHight(12),
                      horizontal: context.setWidth(24),
                    ),
                  ),
                  child: Text(
                    context.loc.cancel,
                    style: getMediumStyle(color: AppColors.black),
                  ),
                ),

                // Logout button
                DialogButtom(profileBloc: profileBloc),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

