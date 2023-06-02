import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String name = 'Mirkin';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gray"),
      ),
      body: Center(
        child: Text('Hello $name my love ;)'),
      ),
      drawer: const Drawer(),
    );
  }
}
