import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profileedit extends StatefulWidget {
  final String initialName;
  final String initialMobileNumber;
  final String initialEmail;
  final String? initialProfileImage;

  Profileedit({
    required this.initialName,
    required this.initialMobileNumber,
    required this.initialEmail,
    this.initialProfileImage,
  });

  @override
  _ProfileeditState createState() => _ProfileeditState();
}

class _ProfileeditState extends State<Profileedit> {
  late String name;
  late String mobileNumber;
  late String email;
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    name = widget.initialName;
    mobileNumber = widget.initialMobileNumber;
    email = widget.initialEmail;
    if (widget.initialProfileImage != null) {
      _profileImage = File(widget.initialProfileImage!);
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: _pickImage, // Open image picker
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!) as ImageProvider
                      : AssetImage('assets/profile.jpg'),
                  child: _profileImage == null
                      ? Icon(Icons.camera_alt, size: 32, color: Colors.white)
                      : null,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Name Field
            Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            TextFormField(
              initialValue: name,
              onChanged: (value) => name = value,
            ),

            SizedBox(height: 16),

            // Mobile Number Field
            Text('Mobile Number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            TextFormField(
              initialValue: mobileNumber,
              onChanged: (value) => mobileNumber = value,
            ),

            SizedBox(height: 16),

            // Email Field
            Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            TextFormField(
              initialValue: email,
              onChanged: (value) => email = value,
            ),

            SizedBox(height: 24),

            // Save Button
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF45B28F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    Navigator.pop(context, {
                      'name': name,
                      'mobileNumber': mobileNumber,
                      'email': email,
                      'profileImage': _profileImage?.path,
                    });
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
