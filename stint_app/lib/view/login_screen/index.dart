import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/core/constants/color_constants.dart';
import 'package:stint_app/provider/user_provider.dart';
import 'package:stint_app/view/login_screen/components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: LayoutBuilder(
              builder: (co, constraints) {
                if (constraints.maxWidth < 480) {
                  return body(context: co);
                }
                return Column(children: [
                  const SizedBox(height: 16),
                  SizedBox(
                    child: body(context: co),
                    width: 400,
                  ),
                ]);
              },
            ),
          ),
        ),
      ),
    );
  }

  body({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            "assets/images/logo.png",
            width: 60,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.primary),
          ),
        ),
        const LoginForm(),
        const SizedBox(height: 16),
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push('/sign-up');
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: ColorConstants.primary, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
