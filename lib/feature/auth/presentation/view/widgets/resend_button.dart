
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/constants/app_widgets_keys.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

Widget buildResendButton(
      BuildContext context, ForgetPasswordState state,String email) {
    return TextButton(
      key: const Key(AppWidgetsKeys.resendButton),
      onPressed: state.isResendEnabled
          ? () => context
              .read<ForgetPasswordBloc>()
              .add(ResendCodeEvent(email))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.loc.didNotReceiveCode,
            style: getMediumStyle(
              color: AppColors.black,
              fontSize: context.setSp(FontSize.s18),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            state.isResendEnabled
                ? context.loc.resend
                : "(${state.secondsRemaining}s)",
            style: getMediumStyle(
              color: state.isResendEnabled ? AppColors.pink : AppColors.gray,
              fontSize: context.setSp(FontSize.s18),
            ).copyWith(
              decoration: state.isResendEnabled
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationColor:
                  state.isResendEnabled ? AppColors.pink : AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }
