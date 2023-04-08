import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/view/home_screen/index.dart';
import 'package:stint_app/view/login_screen/index.dart';
import 'package:stint_app/view/sign_up_screen/index.dart';

import 'provider/user_provider.dart';

// Listen to user to route data
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) {
        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        print(userProvider.user);
        return userProvider.user == null ? '/login' : '/home';
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
      redirect: (context, state) {
        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        return userProvider.user == null ? '/login' : null;
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);
