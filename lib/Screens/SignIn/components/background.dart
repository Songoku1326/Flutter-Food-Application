import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(253, 237, 188, 1),
          Color.fromRGBO(253, 237, 188, 1)
        ]),
      ),
      child: Stack(
        children: [
          child,
        ],
      ),
    );
  }
}
