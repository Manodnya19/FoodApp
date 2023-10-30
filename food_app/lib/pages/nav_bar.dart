import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class NavBar extends StatelessWidget {
  final FirebaseAuth auth;

  NavBar({required this.auth});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
             decoration: BoxDecoration(
               color: Color.fromARGB(255, 2, 92, 5),
             ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Sign Out'),
            onTap: () async {
              // Sign out the user
              await auth.signOut();

              // Navigate to the login page
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
