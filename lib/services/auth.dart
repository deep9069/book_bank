import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  //function for create account
  Future<String> signUp(String email, String password) async {
    print("Email : " + email);
    print("password : " + password);
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } catch (e) {
      String error = e.code.toString();
      error = error.replaceAll("-", " ");
      return error;
    }
  }

  //function to sign in
  Future signIn(String email, String password) async {
    print("Email : " + email);
    print("password : " + password);
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      userUid = result.user.uid;
      print("User uid is " + userUid);
      return null;
    } catch (e) {
      return e;
    }
  }

  //function to sign-out
  Future signOut() async {
    await _auth.signOut();
    print("successfully signed-out");
  }

  dynamic loadUser() {
    var _tempUser = _auth.currentUser;
    if (_tempUser != null) userUid = _tempUser.uid;
    return _tempUser;
  }

  dynamic sendOtp(email) async {
    print("email : " + email);
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } catch (e) {
      return e;
    }
  }
}
