import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final String rating;

  CustomAppBar(this.rating);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.chevron_left_rounded,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Spacer(),
            SizedBox(
              width: size.width / 6,
              height: size.height / 20,
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                height: size.height / 20,
                width: size.width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange[900],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      rating,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
