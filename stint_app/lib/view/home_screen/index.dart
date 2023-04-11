import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/provider/user_provider.dart';
import 'package:stint_app/view/common/custom_appbar.dart';
import 'package:stint_app/view/home_screen/components/bottom_nav.dart';
import 'package:stint_app/view/home_screen/components/log_out_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context, includeBack: false),
      body: Column(
        children: [
          Text('${user.userExistsinDb}'),
          Text('${user.email}'),
          Text('${user.uid}'),
          Text(user.user!.firstName),
          Text(user.user!.lastName),
          Text(user.user!.email),
          const LogOutButton()
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
