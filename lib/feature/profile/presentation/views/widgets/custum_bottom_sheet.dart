
import 'package:flutter/material.dart';
import 'package:tracking_app/config/app_language_config/app_language_config.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/profile_container.dart';

class CustumBottomSheet extends StatelessWidget {
  final AppLanguageConfig _appLanguageConfig;
  const CustumBottomSheet({
    super.key,
    required AppLanguageConfig appLanguageConfig,
  }) : _appLanguageConfig = appLanguageConfig;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.setWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.setWidth(32)),
          topRight: Radius.circular(context.setWidth(32)),
        ),
        border: Border(
          top: BorderSide(color: AppColors.pink, width: context.setWidth(2)),
          left: BorderSide(color: AppColors.pink, width: context.setWidth(2)),
          right: BorderSide(color: AppColors.pink, width: context.setWidth(2)),
          bottom: BorderSide.none,
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileContainer(
            onClick: () {
              _appLanguageConfig.changeLocal(Constants.arLocal);
            },
            containerChild: Text(context.loc.arabic),
          ),
          ProfileContainer(onClick: () {
               _appLanguageConfig.changeLocal(Constants.enLocal);
          }, containerChild: Text(context.loc.english)),
        ],
      ),
    );
  }
}
