import 'package:flutter/material.dart';
import 'profilesetup4.dart';

class RequirementsScreen extends StatefulWidget {
  @override
  _RequirementsScreenState createState() => _RequirementsScreenState();
}

class _RequirementsScreenState extends State<RequirementsScreen> {
  void _onSubmitPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VerificationScreen()),
    );
  }

  Widget _buildUploadButton(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        OutlinedButton(
          onPressed: () {
            print("Upload button pressed for $label");
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromRGBO(69, 178, 143, 1)), // Green border
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(double.infinity, 50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image_outlined, color: Color.fromRGBO(69, 178, 143, 1)),
              SizedBox(width: 8),
              Text(
                'Upload an image',
                style: TextStyle(color: Color.fromRGBO(69, 178, 143, 1)),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3 out of 4',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Requirements',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Please upload all the required documents to complete verification. We need some information to help us confirm your identity.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Keep the ID readable\n'
                        '• Use original ID not a photocopy\n'
                        '• Information submitted must match your documents\n'
                        '• Upload appropriate selfie, remove facial accessories such as mask and eyeglasses',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildUploadButton('Front of Valid ID'),
                    _buildUploadButton('Back of Valid ID'),
                    _buildUploadButton('Barangay Clearance'),
                    _buildUploadButton('Police/Barangay Clearance'),
                    _buildUploadButton('Recent Selfie'),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Submit Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: Colors.white,
              child: ElevatedButton(
                onPressed: _onSubmitPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(69, 178, 143, 1),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Submit',
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
