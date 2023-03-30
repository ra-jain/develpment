import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/core/constants/color_constants.dart';
import 'package:stint_app/core/input/email_validator.dart';
import 'package:stint_app/core/input/password_validator.dart';
import 'package:stint_app/provider/user_provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  String? formError;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    UserProvider user = Provider.of<UserProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (String? value) {
              email = value ?? '';
            },
            validator: ((value) => validateEmail(value ?? '')),
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            onTap: () {
              setState(() {
                FocusScope.of(context).requestFocus(_emailFocusNode);
              });
            },
            decoration: InputDecoration(
              errorText: formError,
              labelText: "Email",
              labelStyle: TextStyle(
                color: _emailFocusNode.hasFocus
                    ? ColorConstants.primary
                    : Colors.grey,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConstants.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(
            onSaved: (String? value) {
              password = value ?? '';
            },
            onTap: () {
              setState(() {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              });
            },
            validator: ((value) => validatePassword(value ?? '')),
            focusNode: _passwordFocusNode,
            obscureText: showPassword,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                errorText: formError,
                suffixIcon: IconButton(
                  icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                      color: _passwordFocusNode.hasFocus
                          ? ColorConstants.primary
                          : Colors.grey),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                    color: _passwordFocusNode.hasFocus
                        ? ColorConstants.primary
                        : Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.primary))),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              if (!_formKey.currentState!.validate()) return;
              _formKey.currentState!.save();
              try {
                await user.login(email, password);
              } catch (e) {
                print(e);
                setState(() {
                  formError = e.toString();
                });
                return;
              }

              if (user.user == null) return;
              if (!mounted) return;
              GoRouter.of(context).go("/");
            },
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: ColorConstants.primary),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
