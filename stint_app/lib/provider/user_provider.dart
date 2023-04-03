import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stint_app/model/user_model.dart';
import 'package:stint_app/services/auth_service/login.dart';
import 'package:stint_app/services/auth_service/sign_up.dart';
import 'package:stint_app/services/firestore_service/get_user.dart';

class UserProvider extends ChangeNotifier {
  String? uid;
  CustomUser? user;
  bool userExistsinDb = true;
  String? email;

  UserProvider() {
    init();
  }
  void init() {
    FirebaseAuth.instance.userChanges().listen((User? user) async {
      if (user == null) {
        this.user = null;
        email = null;
        uid = null;
        return;
      }
      uid = user.uid;
      email = user.email;
      try {
        this.user = await getUser(user.uid);
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

  Future<void> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      await signUpService(email, password);
      addUserinDB(firstName: firstName, lastName: lastName, email: email);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> addUserinDB(
      {required String firstName,
      required String lastName,
      required String email}) async {
    user = CustomUser(
        id: uid!, firstName: firstName, lastName: lastName, email: email);
    userExistsinDb = true;
  }
}
