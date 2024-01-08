import 'package:firebase_auth/firebase_auth.dart';
import 'package:software_project/fire_base_auth/database.dart';
import 'package:software_project/global/Common/toast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(
      String name, String mobile, String email, String password) async {
    if (mobile.length != 10) {
      showToast(message: "Enter a valid mobile number");
    }

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.sendEmailVerification();

      await DatabaseService(uid: userCredential.user!.uid)
          .createUserData(name, mobile, email, password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToaste(message: "Email Already in Use");
      } else {
        showToaste(message: "SignUp Failed");
      }
    }
    return null;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToaste(message: "Invalid Email or Password");
      } else {
        showToaste(message: "Login Failed");
      }
    }
    return null;
  }
}
