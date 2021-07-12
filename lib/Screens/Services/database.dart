import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> creatUserData(
      String name, String mail, String phone, String address) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'mail': mail,
      'phone': phone,
      'address': address,
    });
  }

  //

  Future getUsersList() async {
    List itemsList = [];
    try {
      await userCollection.get().then((querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              itemsList.add(element.data());
            }),
          });
      return itemsList;
    } catch (e) {
      return null;
    }
  }
}
