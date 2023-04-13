import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/provider/user_provider.dart';
import 'package:stint_app/view/home_screen/index.dart';
import 'package:stint_app/view/login_screen/index.dart';

class UserWrapper extends StatelessWidget {
  const UserWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);
    if (userProvider.user == null) {
      return const LoginScreen();
    }
    return const HomeScreen();
  }
}
