import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");

  Future<void> createUserData(
      String name, String mobile, String email, String password) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'mobile': mobile,
      'email': email,
      'password': password,
    });
  }
}
