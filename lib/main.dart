import "package:flutter/material.dart";
import 'package:flutter_application_1/utilis/routes.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        Routes.login: (context) => const Login(),
        Routes.home: (context) => const Home()
      },
      initialRoute: Routes.login,
    );
  }
}
