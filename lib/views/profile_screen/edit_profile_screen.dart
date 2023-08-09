// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_app/Contollers/profile_controller.dart';
// import 'package:flutter_app/consts/consts.dart';
// import 'package:flutter_app/widget_common/bd_widget.dart';
// import 'package:flutter_app/widget_common/custom_textfield.dart';
// import 'package:flutter_app/widget_common/our_button.dart';
// import 'package:get/get.dart';

// class EditProfileScreen extends StatelessWidget {
//   final dynamic data;

//   const EditProfileScreen({Key? key, this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<ProfileController>().changeImage(context);

//     return bgWidget(
//         child: Scaffold(
//       appBar: AppBar(),
//       body: Obx(
//         () => Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             //if data image url and controller path is empty
//             data['imageUrl'] == '' && controller.profileImgPath.isEmpty
//                 ? Image.asset(profileimg, width: 50, fit: BoxFit.cover)
//                     .box
//                     .roundedFull
//                     .clip(Clip.antiAlias)
//                     .make()

//                 //if data is not empty but controller path is empty
//                 : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
//                     ? Image.network(
//                         data['imageUrl'],
//                         width: 100,
//                         fit: BoxFit.cover,
//                       ).box.roundedFull.clip(Clip.antiAlias).make()

//                     //else if controller path is not empty but data image url is

//                     : Image.file(
//                         File(controller.profileImgPath.value),
//                         width: 100,
//                         fit: BoxFit.cover,
//                       ).box.roundedFull.clip(Clip.antiAlias).make(),

//             10.heightBox,
//             ourButton(
//                 color: redColor,
//                 onPress: () {
//                   controller.changeImage(context);
//                 },
//                 textColor: whiteColor,
//                 title: "Change"),
//             const Divider(),
//             20.heightBox,
//             customTextField(
//                 controller: controller.nameController,
//                 hint: nameHint,
//                 title: name,
//                 isPass: false),
//             customTextField(
//                 controller: controller.passController,
//                 hint: password,
//                 title: password,
//                 isPass: true),
//             20.heightBox,
// controller.isloading.value
//     ? const CircularProgressIndicator(
//         valueColor: AlwaysStoppedAnimation(redColor),
//       )
//                 : SizedBox(
//                     width: context.screenWidth - 60,
//                     child: ourButton(
//                         color: redColor,
//                         onPress: () async {
//                           controller.isloading(true);

//                           await controller.uploadProfileImage();
//                           await controller.updateProfile(
//                               imgUrl: controller.profileImageLink,
//                               name: controller.nameController.text,
//                               password: controller.passController.text);
//                           VxToast.show(context, msg: "Updated");
//                         },
//                         textColor: whiteColor,
//                         title: "Save"),
//                   ),
//           ],
//         )
//             .box
//             .white
//             .shadowSm
//             .padding(EdgeInsets.all(16))
//             .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
//             .rounded
//             .make(),
//       ),
//     ));
//   }

// }
import 'package:flutter_app/consts/consts.dart';
import 'package:flutter_app/widget_common/bd_widget.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Contollers/profile_controller.dart';
import 'package:flutter_app/widget_common/custom_textfield.dart';
import 'package:flutter_app/widget_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(() => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                      ? Image.asset(profileimg, width: 50, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make()
                      : data['imageUrl'] != '' &&
                              controller.profileImgPath.isEmpty
                          ? Image.network(
                              data['imageUrl'],
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.file(
                              File(controller.profileImgPath.value),
                              width: 100,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.heightBox,
                  ourButton(
                      color: purple,
                      onPress: () {
                        controller.changeImage(context);
                      },
                      textColor: whiteColor,
                      title: "Change"),
                  const Divider(),
                  20.heightBox,
                  customTextField(
                      controller: controller.nameController,
                      hint: nameHint,
                      title: name,
                      isPass: false),
                  customTextField(
                      controller: controller.passController,
                      hint: password,
                      title: password,
                      isPass: true),
                  20.heightBox,
                  controller.isloading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : SizedBox(
                          width: context.screenWidth - 100,
                          child: ourButton(
                              color: golden,
                              onPress: () async {
                                controller.isloading(true);

                                // await controller.uploadProfileImage();
                                await controller.updateProfile(
                                    // imgUrl: controller.profileImageLink,
                                    name: controller.nameController.text,
                                    password: controller.passController.text);

                                VxToast.show(context, msg: "Updated");
                              },
                              textColor: whiteColor,
                              title: "Save"),
                        ),
                ],
              ))
          .box
          .white
          .shadowSm
          .padding(const EdgeInsets.all(16))
          .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
          .rounded
          .make(),
    ));
  }
}
