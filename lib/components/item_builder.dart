import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final int image;
  final String title;
  final String rating;
  final String ratingText;
  final String price;

  const Item({
    Key key,
    this.image,
    this.title,
    this.rating,
    this.ratingText,
    this.price,
    @required this.bannerList,
  }) : super(key: key);
  final List<String> bannerList;
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Image.network(
              'https://images.pexels.com/photos/1893555/pexels-photo-1893555.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
          Text('Fries'),
          Row(
            children: [
              Text("rateing"),
              Text('4.5'),
            ],
          )
        ],
      ),
    );
  }
}
