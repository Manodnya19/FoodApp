import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_app/widgets/background-image.dart';

class ImageConfirmationPage extends StatelessWidget {
  final File capturedImage;

  ImageConfirmationPage({required this.capturedImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [
      const BackgroundImage(),
      Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.5),
      appBar: AppBar(
        title: Text('Image Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.file(capturedImage),
            ),
            SizedBox(height: 16),
            Text(
              'Do you want to proceed with this image?',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                              primary: Colors.green, // background
                              onPrimary: Colors.white, // foreground
                              elevation: 2,
                             // shape: StadiumBorder(),
                             shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                            ),
                  onPressed: () {
                    // Handle 'Yes' option
                  },
                  child: Text('Yes'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                              primary: Colors.red, // background
                              onPrimary: Colors.white, // foreground
                              elevation: 2,
                            //  shape: StadiumBorder(),
                              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                            ),
                  onPressed: () {
                    // Handle 'No' option
                  },
                  child: Text('No'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    ]
    );
    
  }
}
