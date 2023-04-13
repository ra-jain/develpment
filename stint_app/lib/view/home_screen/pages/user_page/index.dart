import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/provider/user_provider.dart';
import 'package:stint_app/view/common/page_heading.dart';
import 'package:stint_app/view/common/profile_picture.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeading("User"),
            const SizedBox(height: 15),
            const ProfilePicture(
              radius: 85,
              includeEdit: false,
              imgURL: 'assets/icon/user.png',
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "${userProvider.user!.firstName} ${userProvider.user!.lastName}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                userProvider.user!.email,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Container(
              color: Colors.grey[200],
            )
          ],
        ),
      ),
    );
  }
}
