import 'package:flutter_app/Contollers/product_controller.dart';
import 'package:flutter_app/add_product.dart';
import 'package:flutter_app/consts/consts.dart';
import 'package:flutter_app/consts/lists.dart';
import 'package:flutter_app/views/category_screen/category_details.dart';
import 'package:get/get.dart';

import '../../widget_common/bd_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    //ettuk porjonto
    return bgWidget(
        child: Scaffold(
      //eta notun
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(46, 41, 78, 1),
        onPressed: () {
          Get.to(() => const AddProduct());
        },
        child: const Icon(Icons.add),
      ),

      //eta notun

      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoryImages[index],
                    height: 120,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  categoriesList[index]
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .make()
                  .onTap(() {
                controller.getSubCategories(categoriesList[index]);
                //ettuk porjonto
                Get.to(() => CategoryDetails(title: categoriesList[index]));
              });
            }),
      ),
    ));
  }
}
