import 'package:flutter/material.dart';

class Profileedit extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Profileedit> {
  String name = 'Juan Dela Cruz'; // Initialize with the displayed name
  String mobileNumber = '09123456789'; // Initialize with the displayed number
  String email = ''; // Initialize as empty

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // This will only work if this screen is navigated to using Navigator.push
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
              Center( // Center the avatar
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your image path
                ),
              ),
              SizedBox(height: 16), // Add some space below the avatar
              Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              TextFormField(
                initialValue: name,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Text('Mobile Number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              TextFormField(
                initialValue: mobileNumber,
                onChanged: (value) {
                  setState(() {
                    mobileNumber = value;
                  });
                },
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24),
              Center( // Center the button
                child: SizedBox(
                  width: double.infinity, // Make button take full width
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Green background
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16), // Padding
                    ),
                    onPressed: () {
                      print('Name: $name');
                      print('Mobile Number: $mobileNumber');
                      print('Email: $email');
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 16, color: Colors.white), // White text
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}