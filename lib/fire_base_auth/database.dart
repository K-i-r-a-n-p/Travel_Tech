import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");

  final CollectionReference bookingCollection =
      FirebaseFirestore.instance.collection("Bookings");

  Future<void> createUserData(
      String name, String mobile, String email, String password) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'mobile': mobile,
      'email': email,
      'password': password,
    });
  }

  Future<DocumentReference<Map<String, dynamic>>> createBookingData(
      String from, String to, String date, String transportMode) async {
    return await bookingCollection.doc(uid).collection("UserBookings").add({
      'from': from,
      'to': to,
      'date': date,
      'transportMode': transportMode,
    });
  }

  Future<List<Map<String, dynamic>>> getUserBookings() async {
    QuerySnapshot querySnapshot =
        await bookingCollection.doc(uid).collection("UserBookings").get();

    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  Future<void> clearUserBookings() async {
    QuerySnapshot<Map<String, dynamic>> userBookingsSnapshot =
        await bookingCollection.doc(uid).collection("UserBookings").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
        in userBookingsSnapshot.docs) {
      await documentSnapshot.reference.delete();
    }
  }
}
