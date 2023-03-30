import 'package:firebase_auth/firebase_auth.dart';

Future<void> logoutService() async {
  await FirebaseAuth.instance.signOut();

  return Future.error("Internal Error");
}
