import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/cart_controller.dart';
import '../database/db_helper.dart';
import '../model/cart_model.dart';
import '../widget/text_widget.dart';
class CartScreen extends StatelessWidget {
 final CartController controller;
  const CartScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller=Get.put(CartController());
    DBHelper? dbHelper = DBHelper();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*TextWidget(
            value: '${controller.getCounter()} Product in cart',
            color: Colors.black54,
            size: 18,
            fontWeight: FontWeight.w700,
          ),*/
         GetBuilder<CartController>(builder: (_){
           return  FutureBuilder(
               future: controller.getData(),
               builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                 if (snapshot.hasData) {

                   if(snapshot.data!.isEmpty)
                   {
                     return Center(

                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Your cart is empty'),
                           //  Lottie.network('https://assets6.lottiefiles.com/packages/lf20_iezsnh5g.json')
                         ],
                       ),
                     );
                   }else{
                     return Expanded(
                       child: ListView.builder(
                           shrinkWrap: true,
                           itemCount: snapshot.data!.length,
                           itemBuilder: (context, index) {
                             //   price='https://vcourse.net/${snapshot.data![index].courseImage.toString()}';
                             return Card(
                               child: SizedBox(
                                   width: double.infinity,
                                   height: 120,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisSize: MainAxisSize.max
                                     ,
                                     children: [
                                       Expanded(
                                         child:   SizedBox(
                                           height: 150,
                                           width: 150,
                                           child: Image.network(
                                             snapshot.data![index].productImage.toString(),
                                             fit: BoxFit.contain,
                                           ),
                                         ),
                                       ),
                                       SizedBox(
                                         width: 10,
                                       ),
                                       Expanded(
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           mainAxisAlignment: MainAxisAlignment.center,

                                           children: [
                                             TextWidget(
                                                 value: snapshot.data![index].productName.toString(),
                                                 color: Colors.black54,
                                                 size: 14,
                                                 fontWeight: FontWeight.w700
                                             ),

                                             TextWidget(
                                               value:
                                               'Price: ৳${snapshot.data![index].productPrice}',
                                               color: Colors.black54,
                                               size: 14,
                                               fontWeight: FontWeight.w700,
                                             ),
                                             /*  CustomButton(
                                              value: 'Remove',
                                              buttonColor: BrandColors.yellow,
                                              onPressed: () {
                                                dbHelper!.delete(snapshot.data![index].courseId!);
                                                cart.removerCounter();
                                                cart.removeTotalPrice(double.parse(snapshot.data![index].coursePrice.toString()));
                                              },
                                            )*/
                                             MaterialButton(

                                               onPressed: (){
                                                 dbHelper.delete(snapshot.data![index].productId!);
                                                 controller.removerCounter();
                                                 controller.removeTotalPrice(double.parse(snapshot.data![index].productPrice.toString()));
                                               },
                                               child: Text('Remove'),
                                               color: Colors.orangeAccent,
                                               // minWidth: 300.0,

                                             ),
                                           ],
                                         ),
                                       )
                                     ],
                                   )),
                             );
                           }),
                     );
                   }

                 }
                 return Text('');
               });
         })
        ],
      ),
    );
  }
}
