import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/core/utils/request_state/request_state.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/custom_btn.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/custom_txt_field.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/login_view_model/login_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/login_view_model/login_states.dart';

import '../../../../../core/extensions/app_localization_extenstion.dart';
import '../../../../../core/routes/app_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginStates>(
        listener: (context, state) {
          if (state.requestState == RequestState.success) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(context.loc.successLogin)));
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoute.testRoute, (route) => false,
              );
            });
          }
          if (state.requestState == RequestState.error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessageLogin!)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: context.setSp(16),
                  color: AppColors.black[0],
                ),
              ),
              title: Text(
                context.loc.login,
                style: getMediumStyle(
                  color: AppColors.black[0]!,
                  fontSize: 20.0,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:const EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTxtField(
                        hintTxt: context.loc.enterYourEmail,
                        lbl: context.loc.email,
                        controller: emailController,
                        validator: Validator.validateEmail,
                      ),
                      SizedBox(height: context.setHight(20)),
                      CustomTxtField(
                        hintTxt: context.loc.enterYourPassword,
                        lbl: context.loc.password,
                        controller: passwordController,
                        isPassword: true,
                        validator: Validator.validatePassword,
                      ),
                      SizedBox(height: context.setHight(20)),
                      Row(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,

                            child: Checkbox(
                              value: state.rememberMe,
                              onChanged: (value) {

                                context.read<LoginBloc>().add(
                                    RememberMeEvent(value??false),
                                  );

                              },
                            ),
                          ),

                          Text(
                            context.loc.rememberMe,
                            style: getMediumStyle(
                              color: AppColors.black[0]!,
                              fontSize: context.setSp(14),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            context.loc.forgetPassword,
                            style: getRegularStyle(color: AppColors.gray)
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.gray,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.setHight(20)),
                      CustomBtn(
                        bg: AppColors.pink,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                              GetLoginEvent(
                                LoginRequest(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              ),
                            );
                          }
                        },
                        txt: context.loc.continue1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
