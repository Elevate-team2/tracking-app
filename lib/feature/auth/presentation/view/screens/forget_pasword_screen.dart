import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forget Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(create:(context) =>getIt<ForgetPasswordBloc>() ,
        child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
          listener: (context, state) {
            if (state.requestState == RequestState.success &&
                state.info!.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.info!)),
              );
            } else if (state.requestState == RequestState.error &&
                state.error!.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error!)),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                state.requestState == RequestState.loading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                  onPressed: () {
                    final email = _emailController.text.trim();
                    if (email.isNotEmpty) {
                      context
                          .read<ForgetPasswordBloc>()
                          .add(SupmitEmailEvent(email));
                    }
                  },
                  child: const Text("Send OTP"),
                ),
                const SizedBox(height: 20),
                if (state.requestState == RequestState.success &&
                    state.info!.isNotEmpty)
                  Text(
                    state.info!,
                    style: const TextStyle(color: Colors.green),
                  ),
                if (state.requestState == RequestState.error &&
                    state.error!.isNotEmpty)
                  Text(
                    state.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            );
          },
        ),)
      ),
    );
  }
}
