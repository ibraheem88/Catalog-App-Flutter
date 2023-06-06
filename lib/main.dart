import "package:flutter/material.dart";
import 'package:flutter_application_1/utilis/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'screens/home.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      routes: {
        Routes.login: (context) => const Login(),
        Routes.home: (context) => const Home()
      },
      initialRoute: Routes.home,
    );
  }
}
