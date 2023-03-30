import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stint_app/model/user_model.dart';
import 'package:stint_app/services/auth_service/login.dart';
import 'package:stint_app/services/auth_service/sign_up.dart';
import 'package:stint_app/services/firestore_service/get_user_data.dart';

class UserProvider extends ChangeNotifier {
  String? uid;
  CustomUser? user;
  bool userExistsinDb = false;

  void init() {
    FirebaseAuth.instance.userChanges().listen((User? user) async {
      if (user == null) {
        this.user = null;
        uid = null;
        return;
      }
      uid = user.uid;
      try {
        this.user = await getUserData(user.uid);
        userExistsinDb = true;
      } catch (e) {
        userExistsinDb = false;
      }
    });
  }

  Future<void> login(String email, String password) async {
    try {
      await loginService(email, password);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await signUpService(email, password);
    } catch (e) {
      return Future.error(e);
    }
  }
}
