import 'package:flutter/material.dart';
import 'package:food_order/Shared/cart.dart';
import 'package:food_order/components/card_item_card.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: carts.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key(carts[index].product.title.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.red[200], borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Spacer(),
              Icon(Icons.delete_outline_outlined),
            ],
          ),
        ),
        onDismissed: (direction) {
          setState(() {
            carts.removeAt(index);
          });
        },
        child: CartItemCard(
          size: size,
          cart: carts[index],
        ),
      ),
    );
  }
}
