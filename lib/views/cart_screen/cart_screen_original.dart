// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_app/consts/consts.dart';
// import 'package:flutter_app/consts/firebase_consts.dart';
// import 'package:flutter_app/services/firestore_services.dart';
// import 'package:flutter_app/widget_common/loading_indicator.dart';
// import 'package:flutter_app/widget_common/our_button.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: "Shopping Cart"
//             .text
//             .color(darkFontGrey)
//             .fontFamily(semibold)
//             .make(),
//       ),
//       body: StreamBuilder(
//         stream: FirestoreServices.getCart(currentUser!.uid),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: loadingIndicator(),
//             );
//           } else if (snapshot.data!.docs.isEmpty) {
//             return Center(
//               child: "Cart is empty".text.color(darkFontGrey).make(),
//             );
//           } else {
//             var data = snapshot.data!.docs;
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       child: ListView.builder(
//                         itemCount: data.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return ListTile(
//                             leading: Image.network("${data[index]['img']}"),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       "Total price"
//                           .text
//                           .fontFamily(semibold)
//                           .color(darkFontGrey)
//                           .make(),
//                       "40"
//                           .numCurrency
//                           .text
//                           .fontFamily(semibold)
//                           .color(redColor)
//                           .make(),
//                     ],
//                   )
//                       .box
//                       .padding(EdgeInsets.all(12))
//                       .color(Colors.yellowAccent)
//                       .width(context.screenWidth - 60)
//                       .roundedSM
//                       .make(),
//                   10.heightBox,
//                   SizedBox(
//                     width: context.screenWidth - 60,
//                     child: ourButton(
//                       color: redColor,
//                       onPress: () {},
//                       textColor: whiteColor,
//                       title: "Proceed to shipping",
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
