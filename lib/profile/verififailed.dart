import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationFailed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Center the content vertically
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Vertically center
                children: [
                  SvgPicture.asset(
                    'assets/images/failed.svg',
                    height: 200,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Verification Failed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Please review your uploaded documents and ensure the following:',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 16.0),
                    child: Text(
                      '• The ID is clear and readable.\n'
                          '• Use the original ID, not a photocopy.\n'
                          '• The information you submit must match the details on your documents.\n'
                          '• Upload an appropriate selfie without facial accessories, such as masks or eyeglasses.',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            // The button at the bottom of the screen
           Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationFailed(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(69, 178, 143, 1),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Finish',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
