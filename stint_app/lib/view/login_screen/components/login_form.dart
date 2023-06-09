import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/core/constants/color_constants.dart';
import 'package:stint_app/core/input/email_validator.dart';
import 'package:stint_app/provider/user_provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  String? formError;
  String? email;
  final FocusNode _emailFocusNode = FocusNode();
  String? password;
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context);
    return Form(
      key: _formKey,
      child: Column(children: [
        textFormField(context, onSaved: (String? value) {
          email = value;
        },
            validator: ((value) => validateEmail(value ?? '')),
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            label: "Email"),
        const SizedBox(height: 30),
        passwordField(context),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            _formKey.currentState!.save();
            try {
              await user.login(email!, password!);
            } catch (e) {
              print(e);
              setState(() {
                formError = e.toString();
              });
              return;
            }

            if (user.user == null) return;
            if (!mounted) return;
            // GoRouter.of(context).go("/");
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
      ]),
    );
  }

  TextFormField passwordField(BuildContext context) {
    return TextFormField(
      onSaved: (String? value) {
        password = value;
      },
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        });
      },
      focusNode: _passwordFocusNode,
      obscureText: showPassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          errorText: formError,
          suffixIcon: IconButton(
            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility,
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
    );
  }

  Widget textFormField(BuildContext context,
      {required void Function(String?) onSaved,
      required String? Function(String?) validator,
      required FocusNode focusNode,
      required TextInputType keyboardType,
      required String label}) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(focusNode);
        });
      },
      decoration: InputDecoration(
        errorText: formError,
        labelText: label,
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? ColorConstants.primary : Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.primary,
          ),
        ),
      ),
    );
  }
}
