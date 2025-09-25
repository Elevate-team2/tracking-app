import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/pin_button.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/resend_button.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';
import 'package:tracking_app/core/constants/app_widgets_keys.dart';

class VerifyResetCodeScreen extends StatefulWidget {
  final String email;
  const VerifyResetCodeScreen({required this.email, super.key});

  @override
  State<VerifyResetCodeScreen> createState() => _VerifyResetCodeScreenState();
}

class _VerifyResetCodeScreenState extends State<VerifyResetCodeScreen> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordBloc>(),
      child: Scaffold(
        appBar: AppBar(
          key: const Key(AppWidgetsKeys.verifyCodeAppBar),
          title: Text(context.loc.password),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Padding(
              padding: EdgeInsets.only(right: context.setWidth(2)),
              child: Icon(Icons.arrow_back_ios, size: context.setSp(20)),
            ),
          ),
        ),
        body: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
          listener: (context, state) {
            if (state.requestState == RequestState.success && state.isVerifySuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.info)),
              );
              Navigator.pushNamed(
                context,
                AppRoute.resetPasswordScreen,
                arguments: widget.email,
              );
            } else if (state.requestState == RequestState.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) => Padding(
            padding: EdgeInsets.all(context.setWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  context.loc.emailVerification,
                  key: const Key(AppWidgetsKeys.emailVerificationText),
                  style: getBoldStyle(
                    color: AppColors.black,
                    fontSize: context.setSp(FontSize.s20),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.setHight(16)),
                Text(
                  context.loc.enterCodeEmail,
                  key: const Key(AppWidgetsKeys.enterCodeEmailText),
                  style: getRegularStyle(
                    color: AppColors.gray,
                    fontSize: context.setSp(FontSize.s16),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.setHight(24)),

                buildPinCodeField(context,currentText),
                SizedBox(height: context.setHight(20)),

                SizedBox(
                  height: context.setHight(50),
                  child: ElevatedButton(
                    key: const Key(AppWidgetsKeys.verifyButton),
                    onPressed: () {
                      context.read<ForgetPasswordBloc>().add(
                            SubmitCodeEvent(currentText),
                          );
                    },
                    child: Text(
                      context.loc.verify,
                      style: getMediumStyle(
                        color: AppColors.white,
                        fontSize: context.setSp(FontSize.s20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.setHight(12)),

                buildResendButton(context, state, widget.email),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
