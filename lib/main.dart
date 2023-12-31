import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_flutter_app/auth/auth.dart';
import 'package:social_flutter_app/auth/login_or_register.dart';
import 'package:social_flutter_app/firebase_options.dart';
import 'package:social_flutter_app/pages/home_page.dart';
import 'package:social_flutter_app/pages/profile_page.dart';
import 'package:social_flutter_app/pages/users_page.dart';
import 'package:social_flutter_app/theme/dark_mode.dart';
import 'package:social_flutter_app/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/user_page': (context) => const UserPage()
      },
    );
  }
}
