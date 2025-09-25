import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_event.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_states.dart';
import '../../../../../core/utils/request_state/request_state.dart';
import '../../../domain/entity/country_entity.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final vehicleNumberCtrl = TextEditingController();
  final nidCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  // Dropdowns & Radio values
  String country = "Egypt";
  String vehicleType = "Car";
  String gender = "male";

  // Images
  File? vehicleLicenseImg;
  File? nidImg;

  final picker = ImagePicker();

  Future<void> _pickImage(Function(File) onSelected) async {
    final picked = await picker.pickImage
      (source: ImageSource.gallery);
    if (picked != null) {
      onSelected(File(picked.path));
    }
  }

  @override
  void dispose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    vehicleNumberCtrl.dispose();
    nidCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  Widget _buildUploadBox({
    required String label,
    File? file,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: file == null
                  ? Text(label, style: const TextStyle(color: Colors.grey))
                  : Image.file(file, height: 60, fit: BoxFit.cover),
            ),
            const Icon(Icons.upload, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  String? _fileToBase64(File? file) {
    if (file == null) return null;
    return base64Encode(file.readAsBytesSync());
  }

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    return BlocProvider(create:
        (context)=>getIt<ApplyBloc>()..add(GetAllVehiclesEvent())..add
      (GetAllCountriesEvent()),
    child:   BlocConsumer<ApplyBloc, ApplyStates>(
      listener: (context, state) {
if(state.countriesState==RequestState.success){
  print(state.countries);
}
if(state.countriesState==RequestState.error){
  print(state.countryErrorMessage);
}
if(state.vehiclesState==RequestState.success){
  print(state.vehicle);
}
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: const Text(
              'Apply',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 26),
            ),
            centerTitle: false,
            elevation: 0,
            leading: const BackButton(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: sw * 0.05,
                vertical: sh * 0.02,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Welcome!!",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500)),
                    SizedBox(height: sh * 0.01),
                    const Text(
                      "You want to be a delivery man?\nJoin our team ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(height: sh * 0.02),

                    // Country
                    DropdownButtonFormField(

                      decoration: const InputDecoration(
                        labelText: "Country",
                        border: OutlineInputBorder(),
                      ),
                      value: country,
                      items: state.countries.map((e){
                        return DropdownMenuItem(
                            value: e.isoCode,
                            child:
                        Text(e.name));
                      }).toList(),


                      onChanged: (value) {
                    setState(() {
                      final country = state.countries.firstWhere(
                            (c) => c.isoCode == value,
                        orElse: () => CountryEntity(
                          isoCode: "",
                          name: "",
                          phoneCode: "",
                          flag: "",
                          currency: "",
                          latitude: "",
                          longitude: "",
                          timezones: [],
                        ),
                      );
                    });
                      }
                    ),
                    SizedBox(height: sh * 0.02),

                    // First name
                    TextFormField(
                      controller: firstNameCtrl,
                      decoration: const InputDecoration(
                        labelText: "First legal name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                      val == null || val.isEmpty ? "Required" : null,
                    ),
                    SizedBox(height: sh * 0.02),

                    // Last name
                    TextFormField(
                      controller: lastNameCtrl,
                      decoration: const InputDecoration(
                        labelText: "Second legal name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                      val == null || val.isEmpty ? "Required" : null,
                    ),
                    SizedBox(height: sh * 0.02),

                    // Vehicle type
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: "Vehicle type",
                        border: OutlineInputBorder(),
                      ),
                      value: vehicleType,
                      items:state.vehicle.map((e){
                        return
                          DropdownMenuItem(
                              value: e.id,
                              child: Text(e.type));
                      }).toList(),
                      onChanged: (val) {
                        setState(() => vehicleType = val!);
                      },
                    ),
                    SizedBox(height: sh * 0.02),

                    // Vehicle number
                    TextFormField(
                      controller: vehicleNumberCtrl,
                      decoration: const InputDecoration(
                        labelText: "Vehicle number",
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                      val == null || val.isEmpty ? "Required" : null,
                    ),
                    SizedBox(height: sh * 0.02),

                    // Vehicle license upload
                    _buildUploadBox(
                      label: "Upload license photo",
                      file: vehicleLicenseImg,
                      onTap: () => _pickImage((file) {
                        setState(() => vehicleLicenseImg = file);
                      }),
                    ),
                    SizedBox(height: sh * 0.02),

                    // Email
                    TextFormField(
                      controller: emailCtrl,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                      val == null || val.isEmpty ? "Required" : null,
                    ),
                    SizedBox(height: sh * 0.02),

                    // Phone
                    TextFormField(
                      controller: phoneCtrl,
                      decoration: const InputDecoration(
                        labelText: "Phone number",
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                      val == null || val.isEmpty ? "Required" : null,
                    ),
                    SizedBox(height: sh * 0.02),

                    // NID
                    TextFormField(
                      controller: nidCtrl,
                      decoration: const InputDecoration(
                        labelText: "ID number",
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) =>
                      val == null || val.isEmpty ? "Required" : null,
                    ),
                    SizedBox(height: sh * 0.02),

                    // ID image upload
                    _buildUploadBox(
                      label: "Upload ID image",
                      file: nidImg,
                      onTap: () => _pickImage((file) {
                        setState(() => nidImg = file);
                      }),
                    ),
                    SizedBox(height: sh * 0.02),

                    // Passwords
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: passwordCtrl,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                            ),
                            validator: (val) => val != null && val.length < 6
                                ? "Min 6 chars"
                                : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: confirmPasswordCtrl,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Confirm password",
                              border: OutlineInputBorder(),
                            ),
                            validator: (val) => val != passwordCtrl.text
                                ? "Not match"
                                : (val != null && val.length < 6
                                ? "Min 6 chars"
                                : null),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: sh * 0.02),

                    // Gender
                    Row(
                      children: [
                        const Text(
                          "Gender",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            Radio<String>(
                              value: "female",
                              groupValue: gender,
                              onChanged: (val) {
                                setState(() => gender = val!);
                              },
                            ),
                            const Text("Female"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: "male",
                              groupValue: gender,
                              onChanged: (val) {
                                setState(() => gender = val!);
                              },
                            ),
                            const Text("Male"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: sh * 0.02),

                    // Submit button

                  ],
                ),
              ),
            ),
          ),
        );
      },
    )
    );

  }
}