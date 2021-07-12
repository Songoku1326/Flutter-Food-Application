import 'package:flutter/cupertino.dart';
import 'package:food_order/Shared/product.dart';

class Cart {
  final Product product;
  final int numOfItems;

  Cart({
    @required this.product,
    @required this.numOfItems,
  });
}

List<Cart> carts = [
  // Cart(numOfItems: 2, product: product[0]),
];
