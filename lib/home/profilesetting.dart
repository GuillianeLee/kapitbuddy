import 'package:flutter/material.dart';
import 'profileedit.dart';
import 'payment.dart';
import 'dart:io';

class ProfileSetting extends StatefulWidget {
  final String name;

  ProfileSetting({required this.name, String? profileImage});

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  String name = 'Juan Dela Cruz';
  String mobileNumber = '09123456789';
  String email = 'juan@example.com';
  String? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, {'name': name, 'profileImage': profileImage});
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: profileImage != null
                      ? FileImage(File(profileImage!)) as ImageProvider
                      : AssetImage('assets/profile.jpg'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final updatedData = await Navigator.push<Map<String, String>>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profileedit(
                          initialName: name,
                          initialMobileNumber: mobileNumber,
                          initialEmail: email,
                          initialProfileImage: profileImage,
                        ),
                      ),
                    );

                    if (updatedData != null) {
                      setState(() {
                        name = updatedData['name'] ?? name;
                        mobileNumber = updatedData['mobileNumber'] ?? mobileNumber;
                        email = updatedData['email'] ?? email;
                        profileImage = updatedData['profileImage'] ?? profileImage;
                      });
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            // Account Settings
            Text(
              'My account',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(),
            _buildListTile('Payment Method', context),
            _buildListTile('Saved Places', context),
            SizedBox(height: 16),
            // General Settings
            Text(
              'General',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(),
            _buildListTile('Help Center', context),
            _buildListTile('Settings', context),
            Spacer(),
            // Logout Button
            SizedBox(
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
                  // Handle logout
                },
                child: Text(
                  'Log out',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle navigation
        if (title == 'Payment Method') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentMethodsPage(),
            ),
          );
        } else if (title == 'Saved Places') {
          // Navigate to Saved Places screen
        } else if (title == 'Help Center') {
          // Navigate to Help Center screen
        } else if (title == 'Settings') {
          // Navigate to Settings screen
        }
      },
    );
  }
}
