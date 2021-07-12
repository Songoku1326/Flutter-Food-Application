import 'package:flutter/material.dart';

class LoginWithButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final String navigation;

  const LoginWithButton({
    Key key,
    this.size,
    this.text,
    this.imagePath = '',
    this.navigation = '',
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.12,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SizedBox(
            width: size.width / 20,
          ),
          Container(
            height: size.height / 20,
            width: size.width / 15,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            )),
          ),
          SizedBox(
            width: size.width / 7.5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, navigation);
            },
            child: Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monserrat',
                    fontSize: size.height * 0.025)),
          )
        ],
      ),
    );
  }
}
