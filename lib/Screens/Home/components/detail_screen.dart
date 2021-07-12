import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_order/Screens/Home/home_screen.dart';
import 'package:food_order/Shared/cart.dart';
import 'package:food_order/Shared/constants.dart';
import 'package:food_order/Shared/product.dart';
import 'package:food_order/components/custom_app_bar.dart';

class DetailScreen extends StatefulWidget {
  final int index;
  const DetailScreen({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
  double amount = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(ratingList[widget.index].toString()),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, top: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                Text(
                  nameList[widget.index],
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: size.height / 15),
                ),
                SizedBox(
                  height: size.height / 80,
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'size',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500,
                                fontSize: size.height / 40),
                          ),
                          SizedBox(
                            height: size.height / 80,
                          ),
                          Text(
                            'Medium',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: size.height / 35),
                          ),
                          SizedBox(
                            height: size.height / 30,
                          ),
                          Text(
                            'Delivery in',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500,
                                fontSize: size.height / 40),
                          ),
                          SizedBox(
                            height: size.height / 80,
                          ),
                          Text(
                            '20 min',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: size.height / 35),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          itemList[widget.index],
                          width: size.width / 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height / 30),
          Container(
            child: Text(''), // discription
          ),
          SizedBox(
            height: size.height / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Price: ',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: size.height / 20),
              ),
              Text(
                '\$ ',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.green[800],
                    fontSize: size.height / 20),
              ),
              Text(
                priceList[widget.index],
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.red[800],
                    fontSize: size.height / 20),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quantity: ',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity -= 1;
                      });
                    }
                  },
                  icon: Icon(Icons.remove)),
              Text(
                quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      quantity += 1;
                    });
                  },
                  icon: Icon(Icons.add)),
            ],
          ),
          SizedBox(height: size.height / 30),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                carts.add(
                    Cart(product: product[widget.index], numOfItems: quantity));
                Fluttertoast.showToast(
                    msg: "Added to cart",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: size.height / 14,
                width: size.width / 1.12,
                decoration: BoxDecoration(
                    color: Colors.yellow[800],
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.026,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsAruguments {
  final Product product;

  ProductDetailsAruguments({@required this.product});
}
