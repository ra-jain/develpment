import 'package:go_router/go_router.dart';
import 'package:stint_app/view/welcome_screen/index.dart';

// Listen to user to route data
final router = GoRouter(
  initialLocation: '/',
  routes: [
    // GoRoute(
    //   path: '/',
    //   redirect: (context, state) {
    //     UserProvider userProvider =
    //         Provider.of<UserProvider>(context, listen: false);
    //     return userProvider.user == null ? '/login' : '/home';
    //   },
    // ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const WelcomeScreen(),
    ),
    // GoRoute(
    //   path: '/home',
    //   builder: (context, state) => const HomeScreen(),
    //   redirect: (context, state) {
    //     UserProvider userProvider = Provider.of<UserProvider>(
    //       context,
    //       listen: false,
    //     );
    //     return userProvider.user == null ? '/login' : null;
    //   },
    // ),
    // GoRoute(
    //   path: '/about-us',
    //   builder: (context, state) => const AboutUsScreen(),
    // ),
    // GoRoute(
    //   path: '/contact-us',
    //   builder: (context, state) => const ContactUsScreen(),
    // ),
    // GoRoute(
    //   path: '/profile',
    //   builder: (context, state) => const ProfileScreen(),
    //   redirect: (context, state) {
    //     UserProvider userProvider = Provider.of<UserProvider>(
    //       context,
    //       listen: false,
    //     );
    //     return userProvider.user == null ? '/login' : null;
    //   },
    // ),
    // GoRoute(
    //   path: '/new-device',
    //   builder: (context, state) => const NewDeviceScreen(),
    //   redirect: (context, state) {
    //     UserProvider userProvider = Provider.of<UserProvider>(
    //       context,
    //       listen: false,
    //     );
    //     return userProvider.user == null ? '/login' : null;
    //   },
    // ),
    // GoRoute(
    //   path: '/get-excel/:id1',
    //   builder: (context, state) =>
    //       GetExcelScreen(id: state.params["id1"] ?? '0'),
    //   redirect: (context, state) {
    //     UserProvider userProvider = Provider.of<UserProvider>(
    //       context,
    //       listen: false,
    //     );
    //     return userProvider.user == null ? '/login' : null;
    //   },
    // ),
    // GoRoute(
    //   path: '/device-details/:id1',
    //   builder: (context, state) =>
    //       DeviceDetailsScreen(id: state.params["id1"] ?? '0'),
    //   redirect: (context, state) {
    //     UserProvider userProvider = Provider.of<UserProvider>(
    //       context,
    //       listen: false,
    //     );
    //     return userProvider.user == null ? '/login' : null;
    //   },
    // ),
    // GoRoute(
    //   path: '/device-edit/:id1',
    //   builder: (context, state) =>
    //       EditDeviceScreen(id: state.params["id1"] ?? '0'),
    //   redirect: (context, state) {
    //     UserProvider userProvider = Provider.of<UserProvider>(
    //       context,
    //       listen: false,
    //     );
    //     return userProvider.user == null ? '/login' : null;
    //   },
    // ),
  ],
);
