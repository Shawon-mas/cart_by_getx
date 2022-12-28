import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
class ProductDetails extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  final String price;
  final String description;
  const ProductDetails({Key? key, required this.id, required this.name, required this.image, required this.price, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller=Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title:  Text(name),
        actions: [
          GestureDetector(
            onTap: () {
             // Get.toNamed(cartScreen);
            },
            child: Center(
              child: Badge(
                badgeContent:
                GetBuilder<CartController>(builder: (tapController) {
                  return Text(
                    tapController.getCounter().toString(),
                    style: TextStyle(
                         fontSize: 12),
                  );
                }),
                animationDuration: Duration(milliseconds: 300),
                child:
                Icon(Icons.shopping_cart, color: Colors.black54),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: double.maxFinite,
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
            Text(name),
            SizedBox(height: 10,),
            Text('${price} tk'),
            SizedBox(height: 10,),
            Text(description),
            SizedBox(height: 30,),
            Align(
              alignment: Alignment.center,
              child: MaterialButton(
                  onPressed: (){
                    controller.addCounter();
                  },
                child: Text('Add to cart'),
                color: Colors.orangeAccent,
                minWidth: 300.0,

              ),
            )
          ],
        ),
      ),
    );
  }
}
