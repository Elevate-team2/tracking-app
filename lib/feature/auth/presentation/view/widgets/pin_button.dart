import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tracking_app/core/constants/app_widgets_keys.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_event.dart';

Widget buildPinCodeField(BuildContext context,String currentText) {
    return PinCodeTextField(
      key: const Key(AppWidgetsKeys.pinCodeField),
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
        context.read<ForgetPasswordBloc>().add(SubmitCodeEvent(currentText));
      },
    );
  }
