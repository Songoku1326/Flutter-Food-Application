import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_order/Screens/Services/auth.dart';
import 'package:food_order/components/custom_button.dart';
import 'package:food_order/components/loading.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({
    Key key,
  }) : super(key: key);

  @override
  _EmailSignInState createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  bool isHiddenPassword = true;
  TextEditingController emailAddress = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                'Sign In',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            body: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 1, left: 20, right: 20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Welcome',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.height / 20)),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Enter your Email address and password',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.height / 50)),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Enjoy your food :)',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.height / 50)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height / 40,
                              ),
                              SizedBox(
                                child: TextFormField(
                                  validator: (value) => value == null ||
                                          !EmailValidator.validate(email)
                                      ? 'Enter a valid email'
                                      : null,
                                  controller: emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    prefixIcon: Icon(Icons.mail),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: size.height / 60),
                              SizedBox(
                                child: TextFormField(
                                  validator: (value) =>
                                      value == null || value.length < 6
                                          ? 'Invalid Password'
                                          : null,
                                  controller: passwordController,
                                  obscureText: isHiddenPassword,
                                  decoration: InputDecoration(
                                    labelText: 'PASSWORD',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                        onPressed: _togglePassword,
                                        icon: Icon(
                                          isHiddenPassword
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        )),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height / 100),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: InkWell(
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: size.height / 45,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Container(
                        height: size.height / 14,
                        width: size.width / 1.12,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: GestureDetector(
                                onTap: () async {
                                  if (formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            emailAddress.text,
                                            passwordController.text);
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            "Counldn't sign in with those credentials";
                                        loading = false;
                                      });
                                    }
                                    Navigator.pushNamed(context, "/HomeScreen");
                                  }
                                },
                                child: Text('LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height / 40)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'or',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                              fontSize: size.height / 50),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 45,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                  fontSize: size.height / 60),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/SignUpScreen');
                              },
                              child: Text(
                                "Creat a new Account.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: size.height / 60),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      CustomButton(
                        size: size,
                        title: 'CONTINUE WITH FACEBOOK',
                        imagePath: 'assets/icons/facebook_icon.png',
                        primaryColor: Colors.blue.shade900,
                        textColor: Colors.white,
                        widthSize: size.width / 1.12,
                        font: size.height / 65,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      CustomButton(
                        size: size,
                        title: 'CONTINUE WITH GOOGLE',
                        imagePath: 'assets/icons/google.png',
                        primaryColor: Colors.blue.shade300,
                        textColor: Colors.white,
                        widthSize: size.width / 1.12,
                        font: size.height / 65,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  void _togglePassword() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }
}
