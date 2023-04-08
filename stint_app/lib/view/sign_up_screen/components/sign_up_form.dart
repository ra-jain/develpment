import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/core/constants/color_constants.dart';
import 'package:stint_app/core/input/email_validator.dart';
import 'package:stint_app/core/input/name_valiator.dart';
import 'package:stint_app/provider/user_provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  String? formError;

  String? firstName;
  final FocusNode _firstNameFocusNode = FocusNode();

  String? lastName;
  final FocusNode _lastNameFocusNode = FocusNode();

  String? email;
  final FocusNode _emailFocusNode = FocusNode();

  String? password;
  final FocusNode _passwordFocusNode = FocusNode();

  String? repeatPassword;
  final FocusNode _repeatPasswordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context);
    return Form(
      key: _formKey,
      child: Column(children: [
        // First Name Field
        textFormField(context, onSaved: (String? value) {
          firstName = value;
        },
            validator: ((value) => validateName(value ?? '')),
            focusNode: _firstNameFocusNode,
            keyboardType: TextInputType.name,
            label: "First Name"),
        const SizedBox(height: 30),
        // Last Name Field
        textFormField(context, onSaved: (String? value) {
          lastName = value;
        },
            validator: ((value) => validateName(value ?? '')),
            focusNode: _lastNameFocusNode,
            keyboardType: TextInputType.name,
            label: "Last Name"),
        const SizedBox(height: 30),
        // Email
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
        passwordField(context, isRepeat: true),
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
      ]),
    );
  }

  TextFormField passwordField(BuildContext context, {bool isRepeat = false}) {
    return TextFormField(
      onSaved: (String? value) {
        if (isRepeat) {
          repeatPassword = value;
        } else {
          password = value;
        }
      },
      onTap: () {
        setState(() {
          if (isRepeat) {
            FocusScope.of(context).requestFocus(_repeatPasswordFocusNode);
          } else {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          }
        });
      },
      focusNode: isRepeat ? _repeatPasswordFocusNode : _passwordFocusNode,
      obscureText: showPassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          errorText: formError,
          suffixIcon: isRepeat
              ? null
              : IconButton(
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
          labelText: isRepeat ? "Repeat Password" : "Password",
          labelStyle: TextStyle(
              color: isRepeat
                  ? _repeatPasswordFocusNode.hasFocus
                      ? ColorConstants.primary
                      : Colors.grey
                  : _passwordFocusNode.hasFocus
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
