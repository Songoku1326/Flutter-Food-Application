import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color primaryColor;
  final Color textColor;
  final double widthSize;
  final double font;
  final Icon iconName;
  const CustomButton({
    Key key,
    this.size,
    this.title,
    this.imagePath,
    this.primaryColor,
    this.textColor,
    this.widthSize,
    this.font,
    this.iconName,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: size.height / 14,
      width: widthSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height / 25,
            width: size.width / 10,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.contain)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: null,
              child: Text(
                title,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: font),
              ),
            ),
          )
        ],
      ),
    );
  }
}
