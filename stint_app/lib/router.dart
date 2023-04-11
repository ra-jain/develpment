import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/provider/user_provider.dart';
import 'package:stint_app/view/sign_up_screen/index.dart';
import 'package:stint_app/view/user_wrapper.dart';

GoRouter router() => GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        return userProvider.user == null ? "/" : null;
      },
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
