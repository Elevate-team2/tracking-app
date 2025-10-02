import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/profile_bloc.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/profile_event.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/profile_state.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/custom_logout_row.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/custom_row.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/profile_container.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/personal_info_card.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/vechical_info_card.dart';

import '../../../../../core/constants/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileBloc _profileBloc = getIt.get<ProfileBloc>();

  @override
  void initState() {
    _profileBloc.add(GetLoggedDriverEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Theme.of(context).appBarTheme.iconTheme?.color,
            ),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),

      body: BlocProvider.value(
        value: _profileBloc,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.driver != null) {
              final DriverEntity driver = state.driver!;
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    ProfileContainer(
                      containerChild: PersonalInfoCard(driverEntity: driver),
                    ),
                    ProfileContainer(
                      containerChild: VechicalInfoCard(driverEntity: driver),
                    ),
                    CustomLanguageRow(
                      svgPath: Constants.languageicon,
                      title: "Language",
                      detail: "English",
                    ),
                    CustomLogoutRow(title: "Logout"),
                  ],
                ),
              );
            }
            if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            }
            return const SizedBox(child: Text("oops"));
          },
        ),
      ),
    );
  }
}
/*void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "LOGOUT",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Confirm logout!!",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cancel button
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                  // Logout button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      UserLocalStorage.clearUser();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                            (route) => false,
                      );                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                    ),
                    child: const Text("Logout"),
                  ),
                ],
              ),
            ],
          ),
        ),*/