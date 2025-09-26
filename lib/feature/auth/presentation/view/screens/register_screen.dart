import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/feature/auth/api/models/request/apply_request.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/custom_btn.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_event.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_states.dart';
import '../../../../../core/utils/request_state/request_state.dart';
import '../../../domain/entity/country_entity.dart';

// class ApplyScreen extends StatefulWidget {
//   const ApplyScreen({super.key});
//
//   @override
//   State<ApplyScreen> createState() => _ApplyScreenState();
// }
//
// class _ApplyScreenState extends State<ApplyScreen> {
//   final _formKey = GlobalKey<FormState>();
//   // Controllers
//   final firstNameCtrl = TextEditingController();
//   final lastNameCtrl = TextEditingController();
//   final phoneCtrl = TextEditingController();
//   final emailCtrl = TextEditingController();
//   final vehicleNumberCtrl = TextEditingController();
//   final nidCtrl = TextEditingController();
//   final passwordCtrl = TextEditingController();
//   final confirmPasswordCtrl = TextEditingController();
//
//   // Dropdowns & Radio values
//   String? country ;
//   String? vehicleType;
//   String gender = "male";
//
//   // Images
//   File? vehicleLicenseImg;
//   File? nidImg;
//
//
//   Future<File> _saveTemporaryFile(XFile pickedFile) async {
// final directory=await getApplicationDocumentsDirectory();
// final fileName=DateTime.now().millisecondsSinceEpoch.toString()+".jpeg";
// final savedFile=await File("${directory.path}${fileName}").writeAsBytes(
//     await pickedFile.readAsBytes());
// return savedFile;
//   }
//
//   Future<void> _pickImage(Function(File) onImagePicked) async {
//     final picker = ImagePicker();
//     final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
//
//     if (pickedFile != null) {
//       final File savedFile = await _saveTemporaryFile(pickedFile);
//       onImagePicked(savedFile);
//     }
//   }
//   // Future<void> _pickImage(Function(File) onSelected) async {
//   //   final picked = await picker.pickImage
//   //     (source: ImageSource.camera);
//   //   if (picked != null) {
//   //     onSelected(File(picked.path));
//   //   }
//   // }
//
//
//   @override
//   void dispose() {
//     firstNameCtrl.dispose();
//     lastNameCtrl.dispose();
//     phoneCtrl.dispose();
//     emailCtrl.dispose();
//     vehicleNumberCtrl.dispose();
//     nidCtrl.dispose();
//     passwordCtrl.dispose();
//     confirmPasswordCtrl.dispose();
//     super.dispose();
//   }
//
//   Widget _buildUploadBox({
//     required String label,
//     File? file,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: file == null
//                   ? Text(label, style: const TextStyle(color: Colors.grey))
//                   : Image.
//               file(file, height: 60, fit: BoxFit.cover),
//             ),
//             const Icon(Icons.upload, color: Colors.black54),
//           ],
//         ),
//       ),
//     );
//   }
//   //
//   // String? _fileToBase64(File? file) {
//   //   if (file == null) return null;
//   //   return base64Encode(file.readAsBytesSync());
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     final sh = MediaQuery.of(context).size.height;
//     final sw = MediaQuery.of(context).size.width;
//
//     return BlocProvider(create:
//         (context)=>getIt<ApplyBloc>()..add(GetAllVehiclesEvent())..add
//       (GetAllCountriesEvent()),
//     child:   BlocConsumer<ApplyBloc, ApplyStates>(
//       listener: (context, state) {
// if(state.countriesState==RequestState.success){
//   print(state.countries);
// }
// if(state.countriesState==RequestState.error){
//   print(state.countryErrorMessage);
// }
// if(state.vehiclesState==RequestState.success){
//   print("vehicles===================${state.vehicle}");
// }
// if(state.applyState==RequestState.success){
//   ScaffoldMessenger.of(context).
//   showSnackBar(SnackBar(content:  Text("Register Success")));
// }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: AppColors.white,
//
//             title: const Text(
//               'Apply',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold, fontSize: 26),
//             ),
//             centerTitle: false,
//             elevation: 0,
//             leading: Icon(Icons.arrow_back_ios_new_outlined,
//               color: AppColors.black[0],
//             size: context.setSp(16),
//             ),
//           ),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: sw * 0.05,
//                 vertical: sh * 0.02,
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Welcome!!",
//                         style: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.w500)),
//                     SizedBox(height: sh * 0.01),
//                     const Text(
//                       "You want to be a delivery man?\nJoin our team ",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.grey),
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // Country
//                     DropdownButtonFormField(
// isExpanded: true,
//                       decoration: const InputDecoration(
//                         labelText: "Country",
//                         border: OutlineInputBorder(),
//                       ),
//                       value: country,
//                       items: state.countries.map((e){
//                         return DropdownMenuItem(
//                             value: e.name,
//                             child:
//                             Row(
//                               children: [
//                                 Text(e.flag),
//                             SizedBox(width: context.setWidth(10),),
//
//                             Text(
//                                     e.name,
//                               overflow: TextOverflow.ellipsis,
//
//                                 ),
//                               ],
//                             ),
//
//                       );
//                       }).toList(),
//
//
//                       onChanged: (value) {
//                     setState(() {
//                       final selectedcountry = state.countries.firstWhere(
//                             (c) => c.isoCode == value,
//                         orElse: () => const CountryEntity(
//                           isoCode: "",
//                           name: "",
//                           phoneCode: "",
//                           flag: "",
//                           currency: "",
//                           latitude: "",
//                           longitude: "",
//                           timezones: [],
//                         ),
//                       );
//                       country=value;
//                     });
//                       }
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // First name
//                     TextFormField(
//                       controller: firstNameCtrl,
//                       decoration: const InputDecoration(
//                         labelText: "First legal name",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (val) =>
//                       val == null || val.isEmpty ? "Required" : null,
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // Last name
//                     TextFormField(
//                       controller: lastNameCtrl,
//                       decoration: const InputDecoration(
//                         labelText: "Second legal name",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (val) =>
//                       val == null || val.isEmpty ? "Required" : null,
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // Vehicle type
//
//
//               DropdownButtonFormField(
//                 decoration: const InputDecoration(
//                   labelText: "Vehicle Type"
//                 ),
//                 value: vehicleType,
// validator: (value){
//                   if(value!.isEmpty ||value==null){
//                     return "please Select Vehicle Type";
//                   }else{
//                     return null;
//                   }
// },
//                   items: state.vehicle.map((e){
//                     return DropdownMenuItem(
//                         value: e.type,
//                         child: Row(
//                           children: [
//                             Image.network(e.image,
//                               width:context.setWidth(50),
//                               height:context.setHight(60),
//                               fit: BoxFit.scaleDown,),
//                             SizedBox(width: context.setWidth(10),),
//
//                             Text(e.type)
//                           ],
//                         ));
//                   }).toList(),
//                   onChanged: (value){
//                   final selectedVehicle=state.vehicle.firstWhere((e)=>
//                   e.type==value,
//                       orElse: ()=>const VehicleEntity(id: "",
//                       type: "",
//                       image: "",
//                       createdAt: "",
//                       updatedAt: "",
//                       speed: 0));
// vehicleType=value;
//
//                   }),
//
//               SizedBox(height: sh * 0.02),
//
//                     // Vehicle number
//                     TextFormField(
//                       controller: vehicleNumberCtrl,
//                       decoration: const InputDecoration(
//                         labelText: "Vehicle number",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (val) =>
//                       val == null || val.isEmpty ? "Required" : null,
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // Vehicle license upload
//                     _buildUploadBox(
//                       label: "Upload license photo",
//                       file: vehicleLicenseImg,
//                       onTap: () => _pickImage((file) {
//                         setState(() => vehicleLicenseImg = file);
//                       }),
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // Email
//                     TextFormField(
//                       controller: emailCtrl,
//                       decoration: const InputDecoration(
//                         labelText: "Email",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (val) =>
//                       val == null || val.isEmpty ? "Required" : null,
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // Phone
//                     TextFormField(
//                       controller: phoneCtrl,
//                       decoration: const InputDecoration(
//                         labelText: "Phone number",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (val) =>
//                       val == null || val.isEmpty ? "Required" : null,
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // NID
//                     TextFormField(
//                       controller: nidCtrl,
//                       decoration: const InputDecoration(
//                         labelText: "ID number",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (val) =>
//                       val == null || val.isEmpty ? "Required" : null,
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // ID image upload
//                     _buildUploadBox(
//                       label: "Upload ID image",
//                       file: nidImg,
//                       onTap: () => _pickImage((file) {
//                         setState(() => nidImg = file);
//                       }),
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // Passwords
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             controller: passwordCtrl,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               labelText: "Password",
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (val) => val != null && val.length < 6
//                                 ? "Min 6 chars"
//                                 : null,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: TextFormField(
//                             controller: confirmPasswordCtrl,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               labelText: "Confirm password",
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (val) => val != passwordCtrl.text
//                                 ? "Not match"
//                                 : (val != null && val.length < 6
//                                 ? "Min 6 chars"
//                                 : null),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: sh * 0.02),
//
//                     // Gender
//                     Row(
//                       children: [
//                         const Text(
//                           "Gender",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                         const SizedBox(width: 20),
//                         Row(
//                           children: [
//                             Radio<String>(
//                               value: "female",
//                               groupValue: gender,
//                               onChanged: (val) {
//                                 setState(() => gender = val!);
//                               },
//                             ),
//                             const Text("Female"),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Radio<String>(
//                               value: "male",
//                               groupValue: gender,
//                               onChanged: (val) {
//                                 setState(() => gender = val!);
//                               },
//                             ),
//                             const Text("Male"),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: sh * 0.02),
// CustomBtn(onPressed: (){
//   if (_formKey.currentState!.validate()) {
//
//     context.read<ApplyBloc>().add
//       (
//         GetApplyEvent(ApplyRequest(
//             country: country,
//
//             firstName: firstNameCtrl.text,
//             lastName: lastNameCtrl.text,
//             vehicleType: vehicleType,
//             //errror is  here
//             vehicleLicense: _pickImage(vehicleLicenseImg),
//             vehicleNumber: vehicleNumberCtrl.text,
//             password: passwordCtrl.text,
//             email: emailCtrl.text,
//             gender: gender,
//             phone: phoneCtrl.text,
//             //error is here
//             NIDImg: _pickImage(nidImg),
//             NID: nidCtrl.text,
//             rePassword: confirmPasswordCtrl.text
//         ))
//     );
//
//   }
// }, txt: "Continue"),
//
//
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     )
//     );
//
//   }
// }

import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/feature/auth/api/models/request/apply_request.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/custom_btn.dart';
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
  String? country;
  String? vehicleType;
  String gender = "male";

  // Images
  File? vehicleLicenseImg;
  File? nidImg;
  Future<File> _saveTemporaryFile(XFile pickedFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
    final savedFile = await File('${directory.path}/$fileName')
        .writeAsBytes(await pickedFile.readAsBytes());
    return savedFile;
  }

  Future<File?> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85, // اختياري عشان تصغر حجم الصورة
    );

    if (pickedFile != null) {
      return await _saveTemporaryFile(pickedFile);
    }
    return null;
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

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => getIt<ApplyBloc>()
        ..add(GetAllVehiclesEvent())
        ..add(GetAllCountriesEvent()),
      child: BlocConsumer<ApplyBloc, ApplyStates>(
        listener: (context, state) {
          if (state.countriesState == RequestState.success) {
            print(state.countries);
          }
          if (state.countriesState == RequestState.error) {
            print(state.countryErrorMessage);
          }
          if (state.vehiclesState == RequestState.success) {
            print("vehicles===================${state.vehicle}");
          }
          if (state.applyState == RequestState.success) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Register Success")));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: const Text(
                'Apply',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              centerTitle: false,
              elevation: 0,
              leading: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppColors.black[0],
                size: context.setSp(16),
              ),
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
                      const Text(
                        "Welcome!!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: sh * 0.01),
                      const Text(
                        "You want to be a delivery man?\nJoin our team ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: sh * 0.02),
                      // Country
                      DropdownButtonFormField(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          labelText: "Country",
                          border: OutlineInputBorder(),
                        ),
                        value: country,
                        items: state.countries.map((e) {
                          return DropdownMenuItem(
                            value: e.name,
                            child: Row(
                              children: [
                                Text(e.flag),
                                SizedBox(width: context.setWidth(10)),
                                Text(e.name, overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            final selectedCountry = state.countries.firstWhere(
                              (c) => c.name == value,
                              orElse: () => const CountryEntity(
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
                            country = value;
                          });
                        },
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
                          labelText: "Vehicle Type",
                          border: OutlineInputBorder(),
                        ),
                        value: vehicleType,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select vehicle type";
                          }
                          return null;
                        },
                        items: state.vehicle.map((e) {
                          return DropdownMenuItem(
                            value: e.type,
                            child: Row(
                              children: [
                                Image.network(
                                  e.image,
                                  width: context.setWidth(50),
                                  height: context.setHight(60), // Fixed typo
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(width: context.setWidth(10)),
                                Text(e.type),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          final selectedVehicle = state.vehicle.firstWhere(
                            (e) => e.type == value,
                            orElse: () => const VehicleEntity(
                              id: "",
                              type: "",
                              image: "",
                              createdAt: "",
                              updatedAt: "",
                              speed: 0,
                            ),
                          );
                          setState(() {
                            vehicleType = value;
                          });
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
                        onTap: () async {
                          final file = await _pickImage();
                          if (file != null) {
                            setState(() => vehicleLicenseImg = file);
                          }
                        },
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
                        onTap: () async {
                          final file = await _pickImage();
                          if (file != null) {
                            setState(() => nidImg = file);
                          }
                        },
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
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
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
                      CustomBtn(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Validate images
                            if (vehicleLicenseImg == null || nidImg == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Please upload both images"),
                                ),
                              );
                              return;
                            }

                            context.read<ApplyBloc>().add(
                              GetApplyEvent(
                                ApplyRequest(
                                  country: country,
                                  firstName: firstNameCtrl.text,
                                  lastName: lastNameCtrl.text,
                                  vehicleType: vehicleType,
                                  vehicleNumber: vehicleNumberCtrl.text,
                                  password: passwordCtrl.text,
                                  email: emailCtrl.text,
                                  gender: gender,
                                  phone: phoneCtrl.text,
                                  NID: nidCtrl.text,
                                  rePassword: confirmPasswordCtrl.text,
                                ),
                                nidImg!,
vehicleLicenseImg!
                                //ظبظلى هنا ياخد file
                              ),
                            );
                          }
                        },
                        txt: "Continue",
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

//    vehicleLicense": vehicleLicenseBase64,
//    "NIDImg": nidImgBase64,
