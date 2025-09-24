import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

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
        appBar: AppBar(title: Text(context.loc.verifyCode)),
        body: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
          listener: (context, state) {
            if (!state.showSnackBar) {
              if (state.requestState == RequestState.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.info)),
                );
              } else if (state.requestState == RequestState.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            }
          },

            builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(context.setWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.loc.emailVerification,
                    style: getBoldStyle(
                      color: AppColors.black,
                      fontSize: context.setSp(FontSize.s20),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.setHight(16)),
                  Text(
                    context.loc.enterCodeEmail,
                    style: getRegularStyle(
                      color: AppColors.gray,
                      fontSize: context.setSp(FontSize.s16),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: context.setHight(24)),

                  PinCodeTextField(
                    appContext: context,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: context.setHight(60),
                      fieldWidth: context.setWidth(50),
                      activeFillColor: AppColors.white,
                      inactiveFillColor: AppColors.white,
                      disabledColor: AppColors.gray,
                      errorBorderColor: AppColors.red,
                      activeColor: AppColors.pink,
                      inactiveColor: AppColors.black[20],
                      selectedColor: AppColors.pink[30],
                      selectedBorderWidth: 4,
                    ),
                    length: 6,
                    onChanged: (value) => currentText = value,
                    onCompleted: (value) {
                      currentText = value;
                      context.read<ForgetPasswordBloc>().add(
                        SubmitCodeEvent(currentText),
                      );
                    },
                  ),
                  SizedBox(height: context.setHight(20)),
                  SizedBox(
                    height: context.setHight(50),
                    child: ElevatedButton(
                      key: const Key('verifyButton'),
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

                  TextButton(
                    key: const Key('resendButton'),
                    onPressed: state.isResendEnabled
                        ? () {
                      context.read<ForgetPasswordBloc>().add(
                        ResendCodeEvent(widget.email),
                      );
                    }
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
                            color: state.isResendEnabled
                                ? AppColors.pink
                                : AppColors.gray,
                            fontSize: context.setSp(FontSize.s18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
