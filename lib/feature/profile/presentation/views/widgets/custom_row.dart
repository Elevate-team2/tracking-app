import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/config/app_language_config/app_language_config.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/custum_bottom_sheet.dart';

class CustomLanguageRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appLanConfig = getIt.get<AppLanguageConfig>();

    String getLanguageName(String selectedLocal) {
      switch (selectedLocal) {
        case Constants.enLocal:
          return context.loc.english;
        case Constants.arLocal:
          return context.loc.arabic;
        default:
          return context.loc.english;
      }
    }

    final language = getLanguageName(appLanConfig.selectedLocal);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(Constants.languageicon, width: context.setWidth(15), height: context.setHight(15)),
          const SizedBox(width: 5),
          Text(context.loc.language,  style: getMediumStyle(color: AppColors.black,fontSize:context.setSp(FontSize.s14))),
          const Spacer(),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CustumBottomSheet(appLanguageConfig: appLanConfig);
                },
              );
            },
            child: Text(
              language,
            ),
          ),
        ],
      ),
    );
  }
}
