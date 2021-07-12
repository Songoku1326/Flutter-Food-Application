import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  const Field({
    Key key,
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: size.width / 20,
          ),
          Container(
            height: size.height / 30,
            width: size.width / 17,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/flag.png'),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '+91',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Icon(Icons.arrow_drop_down),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: size.height / 14,
              width: size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: '  PHONE NUMBER'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
