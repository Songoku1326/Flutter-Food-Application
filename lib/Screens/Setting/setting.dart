import 'package:flutter/material.dart';
import 'package:food_order/Screens/Services/auth.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          CustomButton(
            size: size,
            title: 'Privacy',
            icon: Icons.security_outlined,
          ),
          CustomButton(
            size: size,
            title: 'Purchase History',
            icon: Icons.history_toggle_off_outlined,
          ),
          CustomButton(
            size: size,
            title: 'Help & Support',
            icon: Icons.help_outline_outlined,
          ),
          CustomButton(
            size: size,
            title: 'Invite a Friend',
            icon: Icons.person_add_alt_1_outlined,
          ),
          CustomButton(
            size: size,
            title: 'Log Out',
            icon: Icons.logout_outlined,
            onTap: () async {
              await _authService.signOut();
              Navigator.pushReplacementNamed(context, '/WelcomeScreen');
              print('sign out');
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.size,
    this.title,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          alignment: Alignment.center,
          height: size.height / 14,
          width: size.width / 1.12,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                width: size.width / 10,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height * 0.026,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
