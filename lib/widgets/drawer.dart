import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUri =
        'https://buffer.com/library/content/images/2022/03/sigmund-MQ2xYBHImKM-unsplash--1--1.jpg';

    return Drawer(
      child: Container(
        color: Colors.orange,
        child: ListView(
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUri),
                ),
                accountName: Text(
                  "Debryna",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text('contact@gmail.com',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_2_rounded),
              title: Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'Email Me',
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
