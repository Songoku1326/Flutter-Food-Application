import 'package:flutter/material.dart';
import 'package:food_order/Screens/SignIn/components/background.dart';
import 'package:food_order/components/custom_button.dart';
import 'package:food_order/components/login_with_button.dart';
import 'package:food_order/components/phone_field.dart';

class Body extends StatelessWidget {
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
                  Padding(
                    padding: EdgeInsets.symmetric(),
                    child: Container(
                        height: size.height / 2.7,
                        width: size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/login.png"),
                                fit: BoxFit.cover))),
                  ),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Field(size: size),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: size.height / 14,
                    width: size.width / 1.12,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Send OTP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height * 0.026,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        buildDivider(),
                        Text(
                          "OR",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        buildDivider(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  LoginWithButton(
                    navigation: '/EmailSignIn',
                    size: size,
                    imagePath: 'assets/icons/mail.png',
                    text: 'Continue with Email',
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
                    height: size.height / 15,
                    width: size.width / 1.12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          size: size,
                          imagePath: 'assets/icons/facebook_icon.png',
                          title: 'Facebook',
                          primaryColor: Colors.blue.shade900,
                          textColor: Colors.white,
                          widthSize: size.width / 2.3,
                          font: size.height / 40,
                        ),
                        CustomButton(
                            size: size,
                            imagePath: 'assets/icons/google.png',
                            title: 'Google',
                            primaryColor: Colors.white,
                            textColor: Colors.black,
                            widthSize: size.width / 2.3,
                            font: size.height / 40),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "By continuing you agree to our",
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                      SizedBox(height: size.height / 600),
                      Container(
                        child: Text(
                          "Terms of Service Privacy Policy  Content Policy",
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Expanded buildDivider() {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        thickness: 1.5,
        color: Colors.blueGrey[900],
        height: 1.5,
      ),
    ),
  );
}
