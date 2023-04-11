import 'package:flutter/material.dart';
import 'package:stint_app/core/constants/color_constants.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: ColorConstants.secondary,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy_outlined), label: "Projects"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: "Notifications"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined), label: "User")
      ],
    );
  }
}
