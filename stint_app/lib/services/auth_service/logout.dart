import 'package:firebase_auth/firebase_auth.dart';

Future<void> logoutService() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    return Future.error("Logout : $e");
  }
}
