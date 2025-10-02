import 'package:flutter/material.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/responsive/size_provider.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';

class TotalAndPaymentContainer extends StatelessWidget {
  final String containerName;
  final String containerValue;
  const TotalAndPaymentContainer({
    required this.containerName,
    required this.containerValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: (8)),
      child: LayoutBuilder(
        builder: (context, size) {
          return SizeProvider(
            baseSize: const Size(311, 60),
            width: size.maxWidth,
            height: double.infinity,
            child: Container(
              padding: EdgeInsets.all(context.setWidth(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.setWidth(10)),
                color: AppColors.white,

                boxShadow: [
                  BoxShadow(
                    color: AppColors.white[60]??AppColors.lightPink,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child:
                  //////  ROW OF TEXT  ///////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        containerName,
                        style: getMediumStyle(
                          color: AppColors.black,
                          fontSize: context.setSp(FontSize.s18),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        containerValue,
                        style: getMediumStyle(
                          color: AppColors.gray,
                          fontSize: context.setSp(FontSize.s14),
                        ),
                      ),
                    ],
                  ),
            ),
          );
        },
      ),
    );
  }
}
