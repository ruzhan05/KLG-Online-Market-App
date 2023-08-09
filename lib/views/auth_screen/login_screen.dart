import 'package:flutter_app/Contollers/auth_controller.dart';
import 'package:flutter_app/views/Home_screen/Home.dart';
import 'package:flutter_app/views/auth_screen/signup_screen.dart';
import 'package:flutter_app/widget_common/applogo_widget.dart';
import 'package:flutter_app/widget_common/bd_widget.dart';
// import 'package:flutter_app/widget_common/applogo_widget.dart';
// import 'package:flutter_app/widget_common/bd_widget.dart';
import 'package:flutter_app/consts/consts.dart';
import 'package:flutter_app/widget_common/custom_textfield.dart';
// import 'package:flutter_app';
import 'package:flutter_app/widget_common/our_button.dart';
import 'package:get/get.dart';
// import 'package:flutter_app//views/home_screen/Home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    // TextEditingController emailController =
    //     TextEditingController(); // Create a TextEditingController for email
    // TextEditingController passwordController =
    //     TextEditingController(); // Create a TextEditingController for password
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
          10.heightBox,
          Obx(() => Column(
                    children: [
                      customTextField(
                          hint: emailHint,
                          title: email,
                          isPass: false,
                          controller: controller.emailController),
                      customTextField(
                          hint: passwordHint,
                          title: password,
                          isPass: true,
                          controller: controller.passwordController),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {}, child: forgetPass.text.make())),
                      5.heightBox,
                      // ourButton().box.width(context.screenWidth - 50).make(),
                      controller.isloading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : ourButton(
                              color: purple,
                              title: login,
                              textColor: whiteColor,
                              onPress: () async {
                                controller.isloading(true);
                                await controller
                                    .loginMethod(context: context)
                                    .then((value) {
                                  if (value != null) {
                                    VxToast.show(context, msg: loggedin);
                                    Get.offAll(() => const Home());
                                  } else {
                                    controller.isloading(false);
                                  }
                                });
                              }).box.width(context.screenWidth - 50).make(),
                      5.heightBox,
                      createNewAccount.text.color(redColor).make(),
                      5.heightBox,

                      ourButton(
                          color: yellow,
                          title: signup,
                          textColor: redColor,
                          onPress: () {
                            Get.to(() => const Signup());
                          }).box.width(context.screenWidth - 50).make(),
                    ],
                  ))
              .box
              .white
              .rounded
              .padding(const EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .shadowSm
              .make(),
        ]),
      ),
    ));
  }
}
