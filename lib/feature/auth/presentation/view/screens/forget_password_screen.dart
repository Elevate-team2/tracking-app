import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/constants/app_widgets_keys.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/core/validator/validator.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key(AppWidgetsKeys.forgetAppBar),
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
        padding: EdgeInsets.all(context.setWidth(24)),
        child: BlocProvider(
          create: (context) => getIt<ForgetPasswordBloc>(),
          child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
            listener: (context, state) {
              if (state.requestState == RequestState.success &&
                  state.info.isNotEmpty == true) {
                Navigator.pushNamed(context, AppRoute.verifyCodeScreen,
                arguments: _emailController.text.trim());
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.info)));
              } else if (state.requestState == RequestState.error &&
                  state.error.isNotEmpty == true) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state.requestState == RequestState.loading) {
                return Center(
                  key: const Key(AppWidgetsKeys.forgetLoading),
                  child: LoadingAnimationWidget.inkDrop(
                    color: AppColors.pink,
                    size: context.setWidth(50),
                  ),
                );
              }

              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.loc.forgetPassword,
                      key: const Key(AppWidgetsKeys.forgetTitle),
                      style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: context.setSp(FontSize.s20),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.setHight(12)),
                    Text(
                      context.loc.pleaseEnterEmail,
                      key: const Key(AppWidgetsKeys.forgetSubtitle),
                      style: getRegularStyle(
                        color: AppColors.gray,
                        fontSize: context.setSp(FontSize.s18),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.setHight(28)),
                    TextFormField(
                      key: const Key(AppWidgetsKeys.emailTextField),
                      controller: _emailController,
                      validator: Validator.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: context.loc.email,
                        hintText: context.loc.enterEmail,
                        border: const OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: context.setWidth(12),
                          vertical: context.setHight(12),
                        ), // responsive text field padding
                      ),
                    ),
                    SizedBox(height: context.setHight(20)),
                    SizedBox(
                      height: context.setHight(50),
                      child: ElevatedButton(
                        key: const Key(AppWidgetsKeys.confirmButton),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final email = _emailController.text.trim();
                            context.read<ForgetPasswordBloc>().add(
                              SubmitEmailEvent(email),
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
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
