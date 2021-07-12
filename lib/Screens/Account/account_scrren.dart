import 'package:flutter/material.dart';
import 'package:food_order/Screens/Services/database.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List userProfileList = [];

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic result = await DatabaseService().getUsersList();

    if (result == null) {
      print('Unable to retrive');
    } else {
      setState(() {
        userProfileList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            fontSize: size.height / 30,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          itemCount: userProfileList.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height / 60,
                        ),
                        Text(
                          userProfileList[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: size.height / 80,
                        ),
                        Text(
                          userProfileList[index]['mail'],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: size.height / 160,
                        ),
                        Text(
                          userProfileList[index]['phone'],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: size.height / 35,
                        ),
                        InkWell(
                          child: Text('Edit',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 18)),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          Container(
                            height: size.height / 8.5,
                            width: size.width / 4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/user.png'))),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              height: size.height / 25,
                              width: size.width / 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.bookmark_border_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        Text('Bookmarks')
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        Text('Notification')
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        Text('Account Balance')
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.payment_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        Text('Payments')
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.receipt_long_outlined,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: size.width / 40,
                    ),
                    Text(
                      'Your Orders',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 60,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.home_outlined,
                          color: Colors.black,
                        )),
                    SizedBox(
                      width: size.width / 40,
                    ),
                    Text(
                      'Manage Adress',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 60,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
