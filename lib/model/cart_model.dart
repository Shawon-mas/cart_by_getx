class Cart{
   final String? productId;
  final String?  productName;
  final String?  productPrice;
  final String? productImage;

   Cart({this.productId,
      this. productName,
      this. productPrice,
      this.productImage});

   Cart.fromMap(Map<dynamic,dynamic> res)
        :productId=res['productId'],
         productName=res[' productName'],
         productPrice=res[' productPrice'],
         productImage=res['productImage'];

   Map<String,Object?> toMap(){
     return{
       'productId':productId,
       ' productName': productName,
       ' productPrice': productPrice,
       'productImage':productImage,
     };
   }


}