import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/custom_logout_row.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/custom_row.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/details_widget.dart';

import '../../../../../core/constants/constants.dart';
import '../widgets/Vehicle_Details_Widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:
      AppBar(
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color:Theme.of(context).appBarTheme.iconTheme?.color),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Profile', style: Theme.of(context).appBarTheme.titleTextStyle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [
          IconButton(
            icon:  Icon(Icons.notifications_none_outlined, color:Theme.of(context).appBarTheme.iconTheme?.color),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          DriverDetailsWidget(title: "ahmed", detail:"ahmed@gmail.com", number: "01023456789", imagePath: "assets/images/profile.png"),
         VehicleDetailsWidget(title: "Vehicle", detail:"Truck", number: "12345"),
          CustomLanguageRow(svgPath:Constants.languageicon , title: "Language", detail: "English"),
          CustomLogoutRow(title: "Logout"),
        ],
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