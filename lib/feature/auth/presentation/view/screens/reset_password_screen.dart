import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/constants/app_widgets_keys.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/core/validator/validator.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String? email;
  const ResetPasswordScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => getIt<ForgetPasswordBloc>(),
      child: Scaffold(
        appBar: AppBar(
          key: const Key(AppWidgetsKeys.resetPasswordAppBar),
          title: Text(context.loc.password),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Padding(
              padding: EdgeInsets.only(right: context.setWidth(2)),
              child: Icon(Icons.arrow_back_ios, size: context.setSp(20)),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.setWidth(24)),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: context.setHight(26)),
                Text(
                  context.loc.resetPasswordTitle,
                  key: const Key(AppWidgetsKeys.resetPasswordTitle),
                  style: getBoldStyle(
                    color: AppColors.black,
                    fontSize: context.setSp(FontSize.s20),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.setHight(16)),
                Text(
                  context.loc.resetPasswordSubtitle,
                  key: const Key(AppWidgetsKeys.resetPasswordSubtitle),
                  style: getRegularStyle(
                    color: AppColors.gray,
                    fontSize: context.setSp(FontSize.s16),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.setHight(26)),
                TextFormField(
                  key: const Key(AppWidgetsKeys.newPasswordTextField),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: context.loc.newPassword,
                    hintText: context.loc.enterNewPassword,
                    border: const OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: context.setWidth(12),
                      vertical: context.setHight(12),
                    ),
                  ),
                  validator: Validator.validatePassword,
                ),
                SizedBox(height: context.setHight(16)),
                TextFormField(
                  key: const Key(AppWidgetsKeys.confirmPasswordTextField),
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: context.loc.confirmPassword,
                    hintText: context.loc.confirmPassword,
                    border: const OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: context.setWidth(12),
                      vertical: context.setHight(12),
                    ),
                  ),
                  validator: (value) => Validator.validateConfirmPassword(
                    value,
                    passwordController.text,
                  ),
                ),
                SizedBox(height: context.setHight(36)),
                BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
                  listener: (context, state) {
                    if (state.requestState == RequestState.success) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.info)));
                    } else if (state.requestState == RequestState.error) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    if (state.requestState == RequestState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return SizedBox(
                      height: context.setHight(50),
                      child: ElevatedButton(
                        key: const Key(
                          AppWidgetsKeys.resetPasswordConfirmButton,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<ForgetPasswordBloc>().add(
                              ResetPasswordEvent(
                                email!,
                                passwordController.text,
                              ),
                            );
                          }
                        },
                        child: Text(
                          context.loc.confirm,
                          style: getMediumStyle(
                            color: AppColors.white,
                            fontSize: context.setSp(FontSize.s20),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
