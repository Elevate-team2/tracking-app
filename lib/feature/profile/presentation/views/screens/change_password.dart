import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/validator/validator.dart';
import '../../../../../config/di/di.dart';
import '../../../api/models/change_password_request.dart';
import '../../view_model/change_password_view_model/change_password_bloc.dart';
import '../../view_model/change_password_view_model/change_password_event.dart';
import '../../view_model/change_password_view_model/change_password_state.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChangePasswordBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reset password"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
            listener: (context, state) {
              if (state is ChangePasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is ChangePasswordFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: context.loc.password,
                        hintText: "Current password",
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      obscureText: true,
                      validator: (val) => val == null || val.isEmpty
                          ? context.loc.required
                          : null,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _newPasswordController,
                      decoration: InputDecoration(
                        labelText: context.loc.newPassword,
                        hintText: "New password",
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      obscureText: true,
                      validator: (val) => val == null || val.isEmpty
                          ? context.loc.required
                          : null,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: context.loc.confirmPassword,
                        hintText: "Confirm password",
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      obscureText: true,
                      validator:Validator.validatePassword,
                    ),
                    const SizedBox(height: 42),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: state is ChangePasswordLoading
                            ? null
                            : () {
                          if (_formKey.currentState!.validate()) {
                            final request = ChangePasswordRequest(
                              password: _passwordController.text,
                              newPassword: _newPasswordController.text,
                            );
                            context.read<ChangePasswordBloc>().add(
                              SubmitChangePasswordEvent(request),
                            );

                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: state is ChangePasswordLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Text("Update"),
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
