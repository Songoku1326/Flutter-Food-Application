import 'package:flutter/material.dart';
import 'package:food_order/Screens/Services/auth.dart';
import 'package:food_order/Screens/SignUp/components/background.dart';
import 'package:food_order/components/custom_button.dart';
import 'package:food_order/components/loading.dart';
import 'package:email_validator/email_validator.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isHiddenPassword = true;
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailAddress = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  bool loading = false;

  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

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
                          child: TextFormField(
                            validator: (value) =>
                                value == null || value.length < 5
                                    ? 'NAME SHOULD BE ATLEAST 5 CHARACTERS'
                                    : null,
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'NAME',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(Icons.account_circle),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onChanged: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: size.height / 60),
                        SizedBox(
                          child: TextFormField(
                            validator: (value) =>
                                value == null || !EmailValidator.validate(email)
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
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                        ),
                        SizedBox(height: size.height / 60),
                        SizedBox(
                          child: TextFormField(
                            validator: (value) => value == null ||
                                    value.length < 10 ||
                                    value.length > 10
                                ? 'NUMBER SHOULD BE 10 DIGITS'
                                : null,
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: 'PHONE',
                              labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onChanged: (value) {
                              setState(() {
                                phone = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: size.height / 60),
                        SizedBox(
                          child: TextFormField(
                            validator: (value) =>
                                value == null || value.length < 6
                                    ? 'Please Fill'
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
                                    color: Theme.of(context).primaryColorDark,
                                  )),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: size.height / 60),
                        SizedBox(
                          child: TextFormField(
                            validator: (value) =>
                                confirmPasswordController.text !=
                                        passwordController.text
                                    ? "Password didn't match"
                                    : null,
                            controller: confirmPasswordController,
                            obscureText: isHiddenPassword,
                            decoration: InputDecoration(
                              labelText: 'CONFIRM PASSOWRD',
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
                                    color: Theme.of(context).primaryColorDark,
                                  )),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onChanged: (value) {
                              setState(() {
                                confirmPassword = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height / 10000),
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
                  height: size.height / 80,
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
                                  await _auth.registerWithEmailAndPassword(
                                      nameController.text,
                                      emailAddress.text,
                                      phoneController.text,
                                      passwordController.text);
                              if (result == null) {
                                error = "Can't sign up using these credential";
                                loading = false;
                              }

                              Navigator.pushReplacementNamed(
                                  context, "/EmailSignIn");
                            }
                          },
                          child: Text('REGISTER',
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
                  height: size.height / 80,
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
                  height: size.height / 80,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do you have an account?  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                            fontSize: size.height / 50),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/EmailSignIn');
                        },
                        child: Text(
                          "Sign In.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: size.height / 50),
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
                  title: 'SIGNUP WITH FACEBOOK',
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
                  title: 'SIGNUP WITH GOOGLE',
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
      )),
    );
  }

  void _togglePassword() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }
}
