import 'package:go_router/go_router.dart';
import 'package:stint_app/view/sign_up_screen/index.dart';
import 'package:stint_app/view/user_wrapper.dart';

GoRouter router() => GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const UserWrapper(),
        ),
        GoRoute(
          path: '/sign-up',
          builder: (context, state) => const SignUpScreen(),
        ),
      ],
    );
