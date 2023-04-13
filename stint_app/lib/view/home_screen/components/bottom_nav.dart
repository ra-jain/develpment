import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/core/constants/color_constants.dart';
import 'package:stint_app/view/home_screen/index.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenPageProvider homeScreen = Provider.of(context);

    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: ColorConstants.primary,
      currentIndex: homeScreen.index,
      onTap: (value) {
        homeScreen.updateIndex(value);
      },
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
