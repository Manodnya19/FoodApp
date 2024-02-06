import 'dart:io';

import 'package:flutter/material.dart';

class ImageConfirmationPage extends StatelessWidget {
  final File capturedImage;

  ImageConfirmationPage({required this.capturedImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.file(capturedImage),
            ),
            SizedBox(height: 16),
            Text(
              'Do you want to proceed with this image?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle 'Yes' option
                  },
                  child: Text('Yes'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
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
    );
  }
}
