// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_order/Screens/Account/account_scrren.dart';
import 'package:food_order/Screens/Address/address_scree.dart';
import 'package:food_order/Screens/Home/home_screen.dart';
import 'package:food_order/Screens/Models/user.dart';
import 'package:food_order/Screens/Services/auth.dart';
import 'package:food_order/Screens/Setting/setting.dart';
import 'package:food_order/Screens/SignIn/components/email_signin.dart';
import 'package:food_order/Screens/SignIn/signin_screen.dart';
import 'package:food_order/Screens/SignUp/signup_screen.dart';
import 'package:food_order/Screens/Welcome/welcome_screen.dart';
import 'package:food_order/Screens/wapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/Wrapper",
        routes: {
          "/Wrapper": (context) => Wrapper(),
          "/WelcomeScreen": (context) => WelcomeScreen(),
          "/SignInScreen": (context) => SignInScreen(),
          "/SignUpScreen": (context) => SignUpScreen(),
          "/EmailSignIn": (context) => EmailSignIn(),
          "/HomeScreen": (context) => HomeScreen(),
          "/AccountScreen": (context) => AccountScreen(),
          "/Setting": (context) => Setting(),
          "/AddressScreen": (context) => AddressScreen(),
        },
      ),
    );
  }
}
