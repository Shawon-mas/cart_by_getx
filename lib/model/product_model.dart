class ProductModel{
  String? name;
  String? image;
  String? price;
  String? description;
  String? tag;
  String? id;

  ProductModel({this.name, this.image, this.price, this.description, this.tag,this.id});
}

List<ProductModel> product=[
  ProductModel(
      id: '1',
      name: 'Mens Full Slave Shirt',
      image: 'https://cdni.llbean.net/is/image/wim/513053_43331_41?wid=428&hei=494',
      price: '2000',
      description: 'Our lightest flannel shirt is also one of our most versatile. Its as soft and cozy as flannel should be, but not quite as warm – so you can wear it comfortably year-round. The innovative, easy-care fabric also wicks moisture away and has built-in stretch for enhanced freedom of movement.',
      tag: 'shirt'
  ),
  ProductModel(
      id: '2',
      name: 'Mens Formal Shoe',
      image: 'https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/61iFSPKli9L._AC_UL1200_.jpg',
      price: '5000',
      description: 'Our lightest flannel shirt is also one of our most versatile. Its as soft and cozy as flannel should be, but not quite as warm – so you can wear it comfortably year-round. The innovative, easy-care fabric also wicks moisture away and has built-in stretch for enhanced freedom of movement.',
      tag: 'shoe'
  ),
  ProductModel(
      id: '3',
      name: 'Mens Sneakers Shoe',
      image: 'https://www.havegoods.shop/images/products_002/J7yPLk5fN.jpg',
      price: '3000',
      description: 'Our lightest flannel shirt is also one of our most versatile. Its as soft and cozy as flannel should be, but not quite as warm – so you can wear it comfortably year-round. The innovative, easy-care fabric also wicks moisture away and has built-in stretch for enhanced freedom of movement.',
      tag: 'shoe'
  ),
  ProductModel(
      id: '4',
      name: 'Mens Smart Watch',
      image: 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1619789123-fitbit-sense-advanced-smartwatch-1619789116.jpg',
      price: '7000',
      description: 'Our lightest flannel shirt is also one of our most versatile. Its as soft and cozy as flannel should be, but not quite as warm – so you can wear it comfortably year-round. The innovative, easy-care fabric also wicks moisture away and has built-in stretch for enhanced freedom of movement.',
      tag: 'watch'
  ),

];