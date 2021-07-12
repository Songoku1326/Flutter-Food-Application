import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_order/components/textfield.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final houseController = TextEditingController();
  final localityController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: size.width * 0.125,
                    child: Icon(
                      Icons.location_on_sharp,
                      size: size.width * 0.2,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  CustomTextField(
                    controller: nameController,
                    labelText: 'Full Name',
                  ),
                  CustomTextField(
                    controller: houseController,
                    labelText: 'House no. / Building name',
                  ),
                  CustomTextField(
                    controller: localityController,
                    labelText: 'Locality',
                  ),
                  CustomTextField(
                    controller: cityController,
                    labelText: 'City',
                  ),
                  CustomTextField(
                    controller: pincodeController,
                    labelText: 'Pin code',
                  ),
                  SizedBox(height: size.height * 0.02),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: size.width / 2.5,
                      height: size.height / 15,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: size.height / 14,
                        width: size.width / 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange[900],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                addAddress();
                                Navigator.pushReplacementNamed(
                                    context, '/HomeScreen');
                              },
                              child: Text(
                                'Add Addres',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addAddress() async {
    final form = formKey.currentState;
    if (form.validate()) {
      TextInput.finishAutofillContext();
      final name = nameController.text;
      final house = houseController.text;
      final locality = localityController.text;
      final city = cityController.text;
      final pincode = pincodeController.text;

      String address =
          name + ', ' + house + ', ' + locality + ', ' + city + ', ' + pincode;

      setState(() => loading = true);
      // await userCollection.doc(uid).update({'address': address});
      // await userCollection
      //     .doc(userCollection.id)
      //     .update({'address': 'address'});
    }
  }
}

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
}
