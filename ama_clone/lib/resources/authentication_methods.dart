import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// This method is used to register a new user
  /// requires a [email],[name],[address] and [password]
  Future<String> signUp({
    required String name,
    required String email,
    required String address,
    required String password,
  }) async {
    /// Trimmimg operation to remove extra spaces
    name.trim();
    email.trim();
    address.trim();
    password.trim();
    String output = 'Something went wrong';
    if (name != "" && email != "" && address != "" && password != "") {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = 'Please fill all the fields';
    }
    return output;
  }

  /// This method is used to sign in with [email] and [password]
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    /// Trimmimg operation to remove extra spaces
    email.trim();
    password.trim();
    String output = 'Something went wrong';
    if (email != "" && password != "") {
      try {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = 'Please fill both the fields';
    }
    return output;
  }
}
