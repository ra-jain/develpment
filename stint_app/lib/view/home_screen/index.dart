import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/view/common/custom_appbar.dart';
import 'package:stint_app/view/home_screen/components/bottom_nav.dart';
import 'package:stint_app/view/home_screen/pages/chat_page/index.dart';
import 'package:stint_app/view/home_screen/pages/notifications_page/index.dart';
import 'package:stint_app/view/home_screen/pages/project_page/index.dart';
import 'package:stint_app/view/home_screen/pages/user_page/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenPageProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(context, includeBack: false),
        body: const CustomHomePage(),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}

class CustomHomePage extends StatelessWidget {
  const CustomHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenPageProvider homeScreen = Provider.of(context);
    return IndexedStack(
      index: homeScreen.index,
      children: const [
        ProjectPage(),
        ChatPage(),
        NotificationPage(),
        UserPage()
      ],
    );
  }
}

class HomeScreenPageProvider extends ChangeNotifier {
  int index = 0;
  void updateIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
