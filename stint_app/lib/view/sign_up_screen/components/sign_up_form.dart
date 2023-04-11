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
        passwordFieldRepeat(context),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            _formKey.currentState!.save();
            try {
              await user.signUp(
                email: email!,
                firstName: firstName!,
                lastName: lastName!,
                password: password!,
              );
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
                "Sign Up",
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
      validator: (value) {
        if (value == null) {
          return "Password cannot be empty";
        }
        if (value.length < 6) {
          return "Password is to short";
        }
        password = value;
        return null;
      },
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

  TextFormField passwordFieldRepeat(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null) {
          return "Password cannot be empty";
        }
        if (password != value) {
          return "The Password is not equal";
        }
        if (value.length < 6) {
          return "Password is to short";
        }
        return null;
      },
      onSaved: (String? value) {
        repeatPassword = value;
      },
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(_repeatPasswordFocusNode);
        });
      },
      focusNode: _repeatPasswordFocusNode,
      obscureText: showPassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          errorText: formError,
          suffixIcon: null,
          labelText: "Repeat Password",
          labelStyle: TextStyle(
              color: _repeatPasswordFocusNode.hasFocus
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
