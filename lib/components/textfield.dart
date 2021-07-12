import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  const CustomTextField({Key key, this.controller, this.labelText})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Colors.indigo[900],
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
        validator: (value) => value == null ? 'Please Fill' : null,
      ),
    );
  }
}
