import 'package:flutter/material.dart';
import 'package:food_order/Screens/Welcome/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Container(
                      height: size.height * 0.6,
                      width: size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/welcome.png"),
                              fit: BoxFit.contain))),
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  "Ready to see top restaurants to order?",
                  style: TextStyle(
                      color: Colors.black, fontSize: size.height * 0.0155),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: size.height / 14,
                  width: size.width * 0.7,
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/SignInScreen");
                        },
                        child: Center(
                          child: Text(
                            'GET STARTED',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: size.height * 0.022,
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
