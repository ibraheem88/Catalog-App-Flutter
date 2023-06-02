import "package:flutter/material.dart";
import "package:flutter_application_1/utilis/routes.dart";

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text("Welcome",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Username", hintText: "Enter Username"),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: "Password", hintText: "Enter Password"),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.home);
                          },
                          style: TextButton.styleFrom(
                              minimumSize: const Size(150, 40)),
                          child: const Text('Login'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
