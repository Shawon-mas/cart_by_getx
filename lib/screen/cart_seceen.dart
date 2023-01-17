import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../controller/cart_controller.dart';
import '../database/db_helper.dart';
import '../model/cart_model.dart';
import '../widget/text_widget.dart';

class CartScreen extends StatelessWidget {
  final CartController controller;
  const CartScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    DBHelper? dbHelper = DBHelper();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<CartController>(builder: (_) {
            return FutureBuilder(
                future: controller.getData(),
                builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            Lottie.network(
                                'https://assets6.lottiefiles.com/packages/lf20_iezsnh5g.json')
                          ],
                        ),
                      );
                    } else {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            height: 150,
                                            width: 150,
                                            child: Image.network(
                                              snapshot.data![index].productImage
                                                  .toString(),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextWidget(
                                                  value: snapshot
                                                      .data![index].productName
                                                      .toString(),
                                                  color: Colors.black54,
                                                  size: 14,
                                                  fontWeight: FontWeight.w700),
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
                                                onPressed: () {
                                                  dbHelper.delete(snapshot
                                                      .data![index].productId!);
                                                  controller.removerCounter();
                                                  controller.removeTotalPrice(
                                                      double.parse(snapshot
                                                          .data![index]
                                                          .productPrice
                                                          .toString()));
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
          }),
          GetBuilder<CartController>(builder: (context) {
            return Visibility(
              visible: controller.getTotalPrice().toStringAsFixed(2) == "0.00"
                  ? false
                  : true,
              child: Card(
                child: Container(
                  width: double.infinity,
                  height: 180,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          value: 'Summery',
                          color: Colors.blueAccent,
                          size: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              value: 'Subtotal',
                              color: Colors.blueAccent,
                              size: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            TextWidget(
                              value:
                                  '৳${controller.getTotalPrice().toStringAsFixed(2)}',
                              color: Colors.blueAccent,
                              size: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              value: 'Total',
                              color: Colors.blueAccent,
                              size: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            TextWidget(
                              value:
                                  '৳${controller.getTotalPrice().toStringAsFixed(2)}',
                              color: Colors.blueAccent,
                              size: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 50,
                            minWidth: double.maxFinite,
                            color: Colors.white70,
                            child: Text(
                              "Checkout",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutScreen()));
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
