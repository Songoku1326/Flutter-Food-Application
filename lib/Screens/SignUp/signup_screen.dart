import 'package:flutter/material.dart';
import 'package:food_order/Screens/SignUp/components/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Sign Up',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
