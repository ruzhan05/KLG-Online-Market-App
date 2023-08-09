import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Contollers/product_controller.dart';
import 'package:flutter_app/services/firestore_services.dart';
import 'package:flutter_app/widget_common/bd_widget.dart';
import 'package:flutter_app/consts/consts.dart';
import 'package:flutter_app/widget_common/loading_indicator.dart';
import 'package:get/get.dart';

import 'item_details.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //eta notun
    var controller = Get.find<ProductController>();
    //eta notun
    return bgWidget(
        child: Scaffold(
            appBar: AppBar(
              title: title!.text.fontFamily(bold).white.make(),
            ),
            body: StreamBuilder(
              stream: FirestoreServices.getProducts(title),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: loadingIndicator(),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: "No products found!".text.color(darkFontGrey).make(),
                  );
                } else {
                  var data = snapshot.data!.docs;

                  return Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
//eta notun
                            children: List.generate(
                                controller.subcat.length,
                                (index) => "${controller.subcat[index]}"
                                    .text
                                    //notun ettuk

                                    .size(12)
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .makeCentered()
                                    .box
                                    .white
                                    .rounded
                                    .size(120, 60)
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .make()),
                          ),
                        ),

                        //items container

                        20.heightBox,

                        Expanded(
                          child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 250,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      data[index]['p_imgs'][0],
                                      height: 150,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ).box.roundedSM.clip(Clip.antiAlias).make(),
                                    5.heightBox,
                                    "${data[index]['p_name']}"
                                        .text
                                        .fontFamily(semibold)
                                        .color(lightGrey)
                                        .make(),
                                    10.heightBox,
                                    "${data[index]['p_price']}"
                                        .numCurrency
                                        .text
                                        .color(redColor)
                                        .fontFamily(bold)
                                        .size(16)
                                        .make(),
                                    10.heightBox,
                                  ],
                                )
                                    .box
                                    .white
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .roundedSM
                                    .outerShadowSm
                                    .padding(const EdgeInsets.all(12))
                                    .make()
                                    .onTap(() {
                                  Get.to(() => ItemDetails(
                                      title: "${data[index]['p_name']}",
                                      data: data[index]));
                                });
                              }),
                        )
                      ],
                    ),
                  );
                }
              },
            )));
  }
}
