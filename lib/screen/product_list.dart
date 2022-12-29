import 'package:badges/badges.dart';
import 'package:cart_by_getx/screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/cart_controller.dart';
import '../database/db_helper.dart';
import '../model/cart_model.dart';
import '../model/product_model.dart';
import '../widget/text_widget.dart';
import 'cart_seceen.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> getProduct = [];
    CartController controller = Get.put(CartController());
    DBHelper dbHelper = DBHelper();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Page"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
           //    Get.toNamed(myCart);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreen(
                        controller:  controller,
                      )));
            },
            child: Center(
              child: Badge(
                badgeContent:
                    GetBuilder<CartController>(builder: (tapController) {
                  return Text(
                    tapController.getCounter().toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  );
                }),
                animationDuration: const Duration(milliseconds: 300),
                child: const Icon(Icons.shopping_cart, color: Colors.white54),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                id: product[index].id.toString(),
                                image: product[index].image.toString(),
                                name: product[index].name.toString(),
                                description: product[index].description.toString(),
                                price: product[index].price.toString(),
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.network(
                              product[index].image.toString(),
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product[index].name.toString()),
                              Text('${product[index].price.toString()} tk'),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                dbHelper
                                    .insert(Cart(
                                  productId: product[index].id.toString(),
                                  productImage: product[index].image.toString(),
                                  productName: product[index].name.toString(),
                                  productPrice: product[index].price.toString()
                                    ))
                                    .then((value) {
                                  print("value:" + value.toString());
                                  controller.addTotalPrice(double.parse(product[index].price.toString()));
                                  controller.addCounter();
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.green,
                                    content: TextWidget(
                                      value: 'Product is added to cart',
                                      color: Colors.white,
                                      size: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    duration: Duration(seconds: 2),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }).onError((error, stackTrace) {
                                  print("Error:" + error.toString());
                                  print("stackTrace: " + stackTrace.toString());
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content: TextWidget(
                                      value: 'Product is already added to cart',
                                      color: Colors.white,
                                      size: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    duration: Duration(seconds: 2),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                });
                              },
                              icon: const Icon(Icons.add_shopping_cart))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
