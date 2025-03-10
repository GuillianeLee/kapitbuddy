import 'dart:io';
import 'package:flutter/material.dart';
import 'profilesetting.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Juan Dela Cruz';
  String? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final updatedData = await Navigator.push<Map<String, String>>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileSetting(
                                name: name,
                                profileImage: profileImage,
                              ),
                            ),
                          );

                          if (updatedData != null) {
                            setState(() {
                              name = updatedData['name'] ?? name;
                              profileImage = updatedData['profileImage'] ?? profileImage;
                            });
                          }
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: profileImage != null
                              ? FileImage(File(profileImage!)) as ImageProvider
                              : AssetImage('assets/profile.jpg'),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.verified, color: Colors.green, size: 20),
                        ],
                      ),

                      // Verification Badges
                      sectionTitle('Verification Badges'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          badgeImage('assets/badges/Verified.png'),
                        ],
                      ),

                      // Performance & Quality Badges
                      sectionTitle('Performance & Quality Badges'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          badgeImage('assets/badges/Founding.png'),
                        ],
                      ),

                      // Reviews
                      sectionTitle('Reviews'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '5.00',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: List.generate(
                              5, // Generate 5 stars
                                  (index) => Icon(Icons.star, color: Colors.amber, size: 16),
                            ),
                          ),
                          SizedBox(height: 12),
                          reviewCard(
                            'assets/reviewer.jpg',
                            'Guillermo Raby',
                            'Juan is very accommodating and easy to talk to. Very smooth transaction.',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Divider(thickness: 1),
        SizedBox(height: 10),
      ],
    );
  }

  Widget badgeImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Image.asset(
        imagePath,
        width: 80,
        height: 80,
      ),
    );
  }

  Widget reviewCard(String profilePath, String name, String review) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(radius: 20, backgroundImage: AssetImage(profilePath)),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Row(children: List.generate(5, (index) => Icon(Icons.star, size: 16, color: Colors.amber))),
              SizedBox(height: 4),
              Text(review, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}
