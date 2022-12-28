import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screen/product_list.dart';

const product = "/";
const productDetails = "/productDetails";
const discover = "/discover";
const signin = "/signin";
const signup = "/signup";
const cartScreen= "/cartScreen";
const allcourse= "/AllCourseScreen";
const home= "/homeScreen";

final pages = [
  page(product,  ProductList(),),



];
GetPage page(String name, Widget page) {
  return GetPage(name: name, page: () => page);
}