import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/pages/profile.dart';
class NavBar extends StatelessWidget {
  final FirebaseAuth auth;
  final String displayName;
  final String email;

  NavBar({required this.auth,required this.displayName,
    required this.email,});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          displayName: displayName,
                          email: email,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Text(
                      displayName[0],
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(displayName, style: TextStyle(fontSize: 18, color: Colors.white)),
                Text(email, style: TextStyle(fontSize: 14, color: Colors.white)),
              ],
            ),
          ),
            // child: Text('Drawer Header'),
            //  decoration: BoxDecoration(
            //    color: Color.fromARGB(255, 2, 92, 5),
            //  ),
          
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
