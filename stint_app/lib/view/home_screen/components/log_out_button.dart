import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/core/constants/color_constants.dart';
import 'package:stint_app/provider/user_provider.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of(context);
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: ColorConstants.primary),
      onPressed: () {
        provider.logOut();
        GoRouter.of(context).refresh();
        // GoRouter.of(context).go("/");
      },
      child: const Text("Log Out"),
    );
  }
}
