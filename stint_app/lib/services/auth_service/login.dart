import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> loginService(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return Future.error('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      return Future.error('Wrong Email or Password');
    }
  } catch (e) {
    return Future.error("Internal Error");
  }
  return Future.error("Internal Error");
}
