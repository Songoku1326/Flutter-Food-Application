import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_order/Screens/Cart/cart_screen.dart';
import 'package:food_order/Screens/Home/components/body.dart';
import 'package:food_order/Screens/Setting/setting.dart';

class HomeScreen extends StatelessWidget {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            title: Text("Order History"),
            leading: Icon(Icons.list),
            onTap: () {},
          ),
          ListTile(
            title: Text("Help & Support"),
            leading: Icon(Icons.phone),
            onTap: () {},
          ),
          ListTile(
            title: Text("Updates"),
            leading: Icon(Icons.update),
            onTap: () {},
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.power),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/Setting");
            },
          ),
        ],
      )),
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 5, left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivering to',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: size.height / 55),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/AddressScreen');
                    },
                    child: Row(children: [
                      Text(
                        'Current Location',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.green,
                        size: 30,
                      ),
                    ]),
                  ),
                ],
              ),
              Spacer(),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/AccountScreen");
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: size.width / 9,
                  height: size.height / 18,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/man.png'),
                          fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height / 30),
          child: SizedBox(
            height: size.height / 30,
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        items: <Widget>[
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.black,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen())),
              icon: Icon(
                Icons.shopping_bag,
                size: 30,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Setting())),
              icon: Icon(
                Icons.settings,
                size: 30,
                color: Colors.black,
              )),
        ],
        onTap: (index) {},
      ),
    );
  }
}
