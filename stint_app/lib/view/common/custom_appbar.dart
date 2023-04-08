import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

class CustomAppBar extends AppBar {
  final bool includeBack;
  CustomAppBar(BuildContext context, {super.key, this.includeBack = true})
      : super(
          leading: includeBack
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: (() {
                    GoRouter.of(context).pop();
                  }),
                )
              : null,
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 30,
              ),
              const SizedBox(width: 20),
              const Text("Stint Manager"),
            ],
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        );
}
