import 'package:flutter/material.dart';
import 'package:food_order/Screens/Authentication/authenticate.dart';
import 'package:food_order/Screens/Home/home_screen.dart';
import 'package:food_order/Screens/Models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
