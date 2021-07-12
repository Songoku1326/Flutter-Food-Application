import 'package:flutter/material.dart';
import 'package:food_order/Screens/Home/components/background.dart';
import 'package:food_order/Screens/Home/components/detail_screen.dart';
import 'package:food_order/Shared/Product.dart';
import 'package:food_order/Shared/constants.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.only(left: 10),
                          height: size.height / 20,
                          width: size.width / 1.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink[100],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Search Food and Restaurant',
                                labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.redAccent,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: IconButton(
                              icon: Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.green,
                                size: size.height / 30,
                              ),
                              onPressed: () {},
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          height: size.height / 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(250, 250, 200, 1),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: size.width / 20),
                                height: size.height / 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "10-minutes\ndelivery",
                                      style: TextStyle(
                                          fontSize: size.height / 30,
                                          color: Colors.orange),
                                    ),
                                    SizedBox(
                                      height: size.height / 80,
                                    ),
                                    Text(
                                      "Enjoy your food in just 10\nminutes.",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width / 60,
                              ),
                              Container(
                                height: size.height / 5,
                                width: size.width / 2.5,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/deliverygirl.png'))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Category',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: size.height / 40,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 80,
                      ),
                      Container(
                        height: size.height / 5,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            categortModel('Burger', size.width / 3,
                                size.height / 5, 'assets/images/hamburger.png'),
                            categortModel('Pizza', size.width / 3,
                                size.height / 5, 'assets/images/pizza.png'),
                            categortModel('Drinks', size.width / 3,
                                size.height / 5, 'assets/images/drink.png'),
                            categortModel('Fries', size.width / 3,
                                size.height / 5, 'assets/images/fries.png'),
                            categortModel('Chinese', size.width / 3,
                                size.height / 5, 'assets/images/chinese.png'),
                            categortModel('American', size.width / 3,
                                size.height / 5, 'assets/images/american.png'),
                            categortModel('Mexican', size.width / 3,
                                size.height / 5, 'assets/images/mexican.png'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Popular',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: size.height / 40,
                              ),
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Text(
                                    'See all',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize: size.height / 60,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      for (int i = 0; i < bannerList.length; i++) ...{
                        itemModel(
                          product[i],
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new DetailScreen(
                                        index: i,
                                      )),
                            );
                          },
                        )
                      },
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categortModel(
      String title, double width, double height, String imagePath) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(200, 248, 248, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height / 7,
            ),
            Container(
                height: height / 2, child: Image(image: AssetImage(imagePath))),
          ],
        ),
      ),
    );
  }

  Widget itemModel(Product product, Function onTap) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            Text(
              product.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height / 30),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                SizedBox(width: size.width / 30),
                Text(
                  "Rating",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: size.height / 50),
                ),
                SizedBox(width: size.width / 30),
                Text(
                  product.rating.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: size.height / 50),
                ),
                Spacer(),
                Text(
                  "Price: \$ ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height / 30,
                      color: Colors.red),
                ),
                Text(
                  product.price.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height / 30,
                      color: Colors.green),
                ),
              ],
            ),
            SizedBox(
              height: size.height / 20,
            ),
          ],
        ),
      ),
    );
  }

  // Widget itemModel(String title, String rating, String price, String imagePath,
  //     Function onTap) {
  //   Size size = MediaQuery.of(context).size;
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
  //       padding: EdgeInsets.only(left: 15, right: 15),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             height: size.height / 3,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(40),
  //             ),
  //             child: Image.network(
  //               imagePath,
  //               fit: BoxFit.contain,
  //             ),
  //           ),
  //           SizedBox(
  //             height: size.height / 40,
  //           ),
  //           Text(
  //             title,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.bold, fontSize: size.height / 30),
  //           ),
  //           Row(
  //             children: [
  //               Icon(
  //                 Icons.star,
  //                 color: Colors.green,
  //               ),
  //               SizedBox(width: size.width / 30),
  //               Text(
  //                 "Rating",
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold, fontSize: size.height / 50),
  //               ),
  //               SizedBox(width: size.width / 30),
  //               Text(
  //                 rating,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold, fontSize: size.height / 50),
  //               ),
  //               Spacer(),
  //               Text(
  //                 "Price: \$ ",
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: size.height / 40,
  //                     color: Colors.red),
  //               ),
  //               Text(
  //                 price,
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: size.height / 40,
  //                     color: Colors.green),
  //               ),
  //             ],
  //           ),
  //           SizedBox(
  //             height: size.height / 20,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
