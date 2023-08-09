import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/consts/consts.dart';
import 'package:flutter_app/widget_common/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(112, 112, 112, 1),
          ),
        ),
        title:
            "Add product".text.fontFamily(bold).color(fontGrey).size(16).make(),
        actions: [
          TextButton(
            onPressed: () {},
            child: "save".text.fontFamily(semibold).color(purpleColor).make(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextField(hint: "eg. BMW", ),
          ],
        ),
      ),
    );
  }
}
