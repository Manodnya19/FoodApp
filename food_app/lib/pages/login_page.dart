// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_app/palatte.dart';
import '../widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import './nav_bar.dart';
import 'package:image_picker/image_picker.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: Center(
                    child: Text(
                      'NutriChkr',
                      style: kHeading,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          TextInput(
                            controller: _emailController,
                            icon: FontAwesomeIcons.solidEnvelope,
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            validator: _validateEmail,
                          ),
                          PasswordInput(
                            controller: _passwordController,
                            icon: FontAwesomeIcons.lock,
                            hint: 'Password',
                            inputAction: TextInputAction.done,
                            validator: _validatePassword,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green, // background
                              onPrimary: Colors.white, // foreground
                              elevation: 2,
                              shape: StadiumBorder(),
                            ),
                            child: const Text('Submit'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _login();
                              }
                            },
                            // onPressed: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => MyApp()),
                            //   );
                            // },
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // You can add additional password requirements here, e.g.
    // if (value.length < 6) {
    //   return 'Password must be at least 6 characters long';
    // }
    return null;
  }
  Future<void> _login() async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('User logged in: ${userCredential.user!.uid}');
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
    } catch (e) {
      print(e);
    }
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.controller,
    required this.validator,
  });

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextFormField(
          
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            hintStyle: kBodyText,
          ),
          style: kBodyText,
          keyboardType: inputType,
          textInputAction: inputAction,
          controller: controller,
          validator: validator,
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    required this.icon,
    required this.hint,
    //required this.inputType,
    required this.inputAction,
    required this.controller,
    required this.validator,
  });

  final IconData icon;
  final String hint;
  //final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final String? Function(String?) validator;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextFormField( 
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            hintStyle: kBodyText,
          ),
          obscureText: true,
          style: kBodyText,
          // keyboardType: inputType,
          textInputAction: inputAction,
          controller: controller,
          validator: validator,
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey[300],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Do something with the picked image
      final image = File(pickedFile.path);
    }
  }
  
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final image = File(pickedFile.path);
    }
  }


  Widget build(BuildContext context) {
    final user = auth.currentUser;
    return MaterialApp(
      routes: {
        '/login': (context) => LoginPage(),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
      },
      home: Scaffold(
        
        backgroundColor: Colors.transparent,
        drawer: NavBar(auth: auth,displayName: user?.displayName ?? 'Guest',
  email: user?.email ?? '',),
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          title: Text('My Food App'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 2, 92, 5),
          actions: [
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                // Call the function to pick an image from the camera
                _pickImageFromCamera();
              },
            ),
            IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                // Call the function to pick an image from the gallery
                _pickImageFromGallery();
              },
            ),
          ],
        ),
        
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Closing bracket for Stack widget
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/green.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
                ),
              ),
            ), // Closing bracket for Container widget
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: _pickImageFromCamera,
                    child: Text('Take a picture'),
                  ),
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: _pickImageFromGallery,
                    child: Text('Choose from gallery'),
                  ),
                ],
              ),
            ), // Closing bracket for Center widget
          ],
        ),
      ),
    );
        
      
    
  }
  
}
