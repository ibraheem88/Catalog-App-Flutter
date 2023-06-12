import "package:flutter/material.dart";
import 'package:flutter_application_1/screens/cart.dart';
import 'package:flutter_application_1/store.dart';
import 'package:flutter_application_1/utilis/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'screens/home.dart';
import 'screens/login.dart';

void main() {
  runApp(VxState(store: Store(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      routes: {
        Routes.login: (context) => const Login(),
        Routes.home: (context) => const Home(),
        Routes.cart: (context) => const Cart()
      },
      initialRoute: Routes.home,
    );
  }
}
