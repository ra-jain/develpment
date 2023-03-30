import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signUpService(String email, String password) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return Future.error('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      return Future.error('The account already exists for that email.');
    }
  } catch (e) {
    return Future.error(e.toString());
  }
  return Future.error("Internal Error");
}
