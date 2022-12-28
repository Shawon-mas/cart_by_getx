import 'package:cart_by_getx/screen/product_details.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> getProduct = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Page"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            id:product[index].id.toString() ,
                            image:product[index].image.toString(),
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
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.network(
                            product[index].image.toString(),
                           fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product[index].name.toString()),
                          Text('${product[index].price.toString()} tk'),
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
