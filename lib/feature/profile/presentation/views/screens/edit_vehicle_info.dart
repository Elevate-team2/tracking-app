import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/custom_btn.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/custom_txt_field.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_event.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_states.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/load_image.dart';

class EditVehicleInfo extends StatefulWidget {
  const EditVehicleInfo({super.key});

  @override
  State<EditVehicleInfo> createState() => _EditVehicleInfoState();
}

class _EditVehicleInfoState extends State<EditVehicleInfo> {

  String? vehicleType;
  late TextEditingController vehicleNumber;
  File? vehicleLicense;
  Future<File>_saveTemporyFile(XFile pickedFiled)async{
    final directory=await getApplicationDocumentsDirectory();
    final fileName= "${DateTime.now().millisecondsSinceEpoch}.jpg";
    final savedFile=await File("${directory.path}/$fileName")
        .writeAsBytes(await pickedFiled.readAsBytes());
    return savedFile;
  }
  Future<File?>_pickImage() async {
    final picker=ImagePicker();
    final pickedFile=await
    picker.pickImage(source: ImageSource.camera,
        imageQuality: 85
    );
    if (pickedFile != null) {
      return await _saveTemporyFile(pickedFile);
    }
    return null;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vehicleNumber=TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    vehicleNumber.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.editProfile),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: context.setSp(24),
              color: AppColors.black,
            ),
          ),
          actions: [
            Stack(
              alignment: AlignmentGeometry.topRight,
              children: [
                Icon(
                  CupertinoIcons.bell,
                  color: AppColors.black,
                  size: context.setSp(32),
                ),
                CircleAvatar(
                  backgroundColor: AppColors.red,
                  radius: 10,
                  child: Text(
                    "3",
                    style: getMediumStyle(
                      color: AppColors.white,
                      fontSize: context.setSp(11),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: context.setWidth(12)),
          ],
        ),
        body: Padding(padding:const EdgeInsets.symmetric(
            horizontal: 20.0,vertical: 24
        ),
          child:     Column(
            children: [
              BlocProvider(
                create: (context) => getIt<ApplyBloc>()..add(GetAllVehiclesEvent()),
                child: BlocBuilder<ApplyBloc, ApplyStates>(
                  builder: (context, state) {
                    return DropdownButtonFormField(
                      validator: (value)=>value==null?
                      context.loc.vehicleTypeFieldError:
                      null,
                      decoration:  InputDecoration(
                          labelText: context.loc.vehicleType
                      ),
                      items: state.vehicle.map((
                          e,
                          ) {
                        return DropdownMenuItem(

                            value: e.id,
                            child: Row(
                              children: [
                                Image.network(e.image,width: context.setWidth(40),
                                  fit: BoxFit.scaleDown,
                                  height: context.setHight(40),),
                                SizedBox(width: context.setWidth(7),),

                                Text(e.type)
                              ],
                            ));
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          vehicleType=value;
                          setState(() {

                          });
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: context.setHight(20),),
              CustomTxtField(hintTxt: context.loc.vehicleNumber,
                  lbl:  context.loc.vehicleNumber,
                  controller: vehicleNumber,
                  validator: (value)=>value==null?context.loc.vehicleNumber:null),
              SizedBox(height: context.setHight(20),),
              // TextFormField(
              //   controller:vehicleLicense ,
              //   decoration: InputDecoration(
              //     suffixIcon: IconButton(onPressed: (){},
              //         icon:const Icon(Icons.file_upload_outlined,
              //           color: AppColors.black,)),
              //     labelText: context.loc.vehicleLicense,
              //     hintText: context.loc.vehicleLicense,
              //
              //   ),
              //
              // ),
              LoadImage(
                  file: vehicleLicense,
                  onTap: ()async{
                    final file = await _pickImage();
                    if (file != null) setState(() => vehicleLicense = file);
                  }, lbl: context.loc.vehicleLicense),
              SizedBox(height: sh*0.4,),
              CustomBtn(
                  bg: AppColors.midGray,

                  onPressed: (){}, txt: context.loc.update)

            ],
          ),
        )

    );
  }
}