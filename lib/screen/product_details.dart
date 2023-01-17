import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../database/db_helper.dart';
import '../model/cart_model.dart';
import '../widget/text_widget.dart';
import 'cart_seceen.dart';
class ProductDetails extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  final String price;
  final String description;
  const ProductDetails({Key? key,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller=Get.put(CartController());
    DBHelper dbHelper = DBHelper();
    return Scaffold(
      appBar: AppBar(
        title:  Text(name),
        actions: [
          GestureDetector(
            onTap: () {
             // Get.toNamed(cartScreen);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreen(
                        controller: controller,
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
                child:
                const Icon(Icons.shopping_cart, color: Colors.white54),
              ),
            ),
          ),
          const SizedBox(width: 20,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
            TextWidget(
              value: name,
              color: Colors.black,
              size: 18,
              fontWeight: FontWeight.w700,
            ),

            SizedBox(height: 10,),
            TextWidget(
              value: '${price} tk',
              color: Colors.black,
              size: 16,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 10,),
            TextWidget(
              value: description,
              color: Colors.black,
              size: 14,
              fontWeight: FontWeight.w300,
            ),

            SizedBox(height: 30,),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MaterialButton(
          height: 50,
          minWidth: double.maxFinite,
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(10.0))),
          onPressed: (){
            dbHelper
                .insert(Cart(
                productId: id,
                productImage: image,
                productName: name,
                productPrice: price
            ))
                .then((value) {
              print("value:" + value.toString());
              controller.addTotalPrice(double.parse(price));
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
          child: Text('Add to cart'),
          color: Colors.orangeAccent,


        ),
      ),
    );
  }
}
