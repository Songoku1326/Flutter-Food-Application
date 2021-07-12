import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_order/Shared/cart.dart';
import 'package:food_order/components/card_item_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalamount = 0;
  int items = carts.length;
  bool isEmpty = (carts.length == 0);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(context),
      body: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) => Dismissible(
          key: Key(carts[index].product.title.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(15)),
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
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [BoxShadow(offset: Offset(0, -5), blurRadius: 20)],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: size.height / 16,
                      width: size.width / 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300]),
                      child: Icon(
                        Icons.receipt_long_outlined,
                        color: Colors.orange,
                      ),
                    ),
                    Spacer(),
                    Text("Add voucher code"),
                    Icon(Icons.arrow_right_rounded)
                  ],
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                          text: 'Total:  ',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: size.height / 40,
                          ),
                          children: [
                            TextSpan(
                              text: "\$${getTotal(carts)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.green,
                                  fontSize: size.height / 40),
                            )
                          ]),
                    ),
                    Spacer(),
                    SizedBox(
                      width: size.width / 2.5,
                      height: size.height / 15,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: size.height / 14,
                        width: size.width / 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange[900],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: null,
                              child: Text(
                                'Check Out',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Column(
        children: [
          Text(
            'Your Cart',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '${carts.length} items',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ],
      ),
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
    );
  }

  double getTotal(List<Cart> products) {
    int l = products.length;
    double sum = 0.0;
    for (int i = 0; i < l; i++) {
      sum += (products[i].product.price * products[i].numOfItems);
    }
    int decimals = 2;
    int fac = pow(10, decimals);
    double d = sum;
    d = (d * fac).round() / fac;
    return d;
  }
}
