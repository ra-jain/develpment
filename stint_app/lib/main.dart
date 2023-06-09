import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:stint_app/core/shared_preferences/preferences_util.dart';
import 'package:stint_app/firebase_options.dart';
import 'package:stint_app/provider/user_provider.dart';
import 'package:stint_app/router.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Init code here
  await Preferences.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var userProvider = UserProvider();
  FlutterNativeSplash.remove();
  // init code end
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => userProvider)],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Stint Manager",
      // Hides debug banner when using flutter run -- debug
      debugShowCheckedModeBanner: false,
      routerConfig: router(),
    );
  }
}
