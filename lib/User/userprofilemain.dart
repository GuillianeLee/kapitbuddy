import 'package:flutter/material.dart';

class ProfileMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'), // Or no title if desired
        centerTitle: true, // Center the title if you have one
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                CircleAvatar(
                  radius: 50, // Adjust as needed
                  // Replace with actual image
                  backgroundImage: NetworkImage('placeholder_profile_image_url'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Juan Dela Cruz',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),  // Adjust spacing
                    Row(
                      children: [
                        // Replace with your badge widget or image
                        Text('Verified'), // Example
                        SizedBox(width: 8),
                        Text('Founding Member'), // Example
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16), // Spacing

            Text(
              'Performance & Quality Badges',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),

            Row( // Badges Row
              children: [
                // Replace with your badge widgets/images
                Text('A'), // Example
                SizedBox(width: 8),
                Text('Top Rated'), // Example
              ],
            ),

            SizedBox(height: 16), // Spacing

            Text(
              'Reviews',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),

            Text('5.00'), // Rating

            SizedBox(height: 16),

            // Review Section
            Text(
              'Guillermo Raby',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Juan is very accommodating and easy to talk to. Very smooth transaction.',
            ),
          ],
        ),
      ),
    );
  }
}