import 'package:flutter/material.dart';
import 'package:food_order/Shared/cart.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key,
    @required this.size,
    @required this.cart,
  }) : super(key: key);

  final Size size;
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          SizedBox(
            width: size.width / 4,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(cart.product.item),
              ),
            ),
          ),
          SizedBox(
            width: size.width / 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.title,
                style: TextStyle(fontSize: size.height / 40),
              ),
              SizedBox(
                height: size.height / 80,
              ),
              Text.rich(
                TextSpan(
                    text: "\$ ${cart.product.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    children: [
                      TextSpan(text: "  x ${cart.numOfItems}"),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
