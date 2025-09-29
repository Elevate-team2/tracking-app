import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/core/validator/validator.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/custom_txt_field.dart';
import 'package:tracking_app/feature/profile/domain/entity/logged_in_user_entity.dart';
import 'package:tracking_app/feature/profile/api/models/edit_profile/request/edit_profile_request.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/edit_profile_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  final LoggedInUserEntity user;

  const EditProfileScreen({required this.user, super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _selectedPhoto;
  String? _selectedGender;
  final ImagePicker _picker = ImagePicker();

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.user.firstName);
    _lastNameController = TextEditingController(text: widget.user.lastName);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
    _selectedGender = widget.user.gender;
  }

  @override
  void dispose(){
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }


  Future<void> _pickImage(BuildContext context) async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        _selectedPhoto = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditProfileBloc>(),
      child: BlocConsumer<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          if (state.editProfileRequestState == RequestState.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile updated successfully")),
            );
          } else if (state.editProfileRequestState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.editProfileErrorMessage ?? "Error")),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Edit profile"),
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Padding(
                  padding: EdgeInsets.only(right: context.setWidth(2)),
                  child: Icon(Icons.arrow_back_ios, size: context.setSp(20)),
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ==== Profile Photo ====
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: _selectedPhoto != null
                            ? FileImage(_selectedPhoto!)
                            : (widget.user.photo.isNotEmpty)
                            ? NetworkImage(widget.user.photo)
                            : const AssetImage("assets/images/profile.png"),
                        backgroundColor: Colors.transparent,
                      ),
                      IconButton(
                        onPressed: () {
                          _pickImage(context);
                          context.read<EditProfileBloc>().add(
                            UploadDriverPhotoEvent(_selectedPhoto!),
                          );
                        },
                        icon: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: AppColors.lightPink,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.camera_alt_outlined),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // ==== Name Fields ====
                  Row(
                    children: [
                      Expanded(
                        child: CustomTxtField(
                          hintTxt: "First name",
                          lbl: "First name",
                          controller: _firstNameController,
                          validator: Validator.validateUsername,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTxtField(
                          hintTxt: "Last name",
                          lbl: "Last name",
                          controller: _lastNameController,
                          validator: Validator.validateUsername,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // ==== Email ====
                  CustomTxtField(
                    hintTxt: "Email",
                    lbl: "Email",
                    controller: _emailController,
                    validator: Validator.validateEmail,
                  ),
                  const SizedBox(height: 15),

                  // ==== Phone ====
                  CustomTxtField(
                    hintTxt: "Phone",
                    lbl: "Phone",
                    controller: _phoneController,
                    validator: Validator.validatePhoneNumber,
                  ),
                  const SizedBox(height: 15),

                  // ==== Password Placeholder ====
                  TextFormField(
                    initialValue: "★★★★★★",
                    readOnly: true,
                    decoration: InputDecoration(
                      label: const Text("Password"),
                      suffix: InkWell(
                        onTap: () {},
                        child: Text(
                          "change password",
                          style: getRegularStyle(
                            color: AppColors.pink,
                            fontSize: FontSize.s14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // ==== Gender ====
                  Row(
                    children: [
                      Text(
                        "Gender",
                        style: getMediumStyle(
                          color: AppColors.black,
                          fontSize: FontSize.s16,
                        ),
                      ),
                      const SizedBox(width: 15.0),

                      Radio<String>(
                        value: 'female',

                        groupValue: widget.user.gender,
                        activeColor: AppColors.pink,
                        fillColor: widget.user.gender == "female"
                            ? WidgetStateProperty.all(AppColors.pink)
                            : WidgetStateProperty.all(AppColors.black),
                      ),
                      const Text("Female"),
                      Radio<String>(
                        value: 'male',
                        groupValue: _selectedGender,
                        activeColor: AppColors.pink,
                        fillColor: widget.user.gender == "male"
                            ? WidgetStateProperty.all(AppColors.pink)
                            : WidgetStateProperty.all(AppColors.black),
                      ),
                      const Text("Male"),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ==== Submit Button ====
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final request = EditProfileRequest(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                        );

                        context.read<EditProfileBloc>().add(
                          EditBtnSubmitEvent(request),
                        );
                      },
                      child:
                          state.editProfileRequestState == RequestState.loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Update"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
