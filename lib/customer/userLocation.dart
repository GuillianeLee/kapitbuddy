import 'package:flutter/material.dart';
import '/customer/userAccepted.dart';
import '/customer/userChat.dart';

class UserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              children: [
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Sydney O.",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          SizedBox(width: 4),
                          Text(
                            "4.8",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.green, size: 18),
                            SizedBox(width: 5),
                            Text("0912 678 8919", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.green, size: 18),
                            SizedBox(width: 5),
                            Text("Azure Beach", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserInfoCard(), // Assuming UserInfoCard is a StatefulWidget or StatelessWidget
                            ),
                          );
                        },
                        child: const Text("Accept"), // Added const for better performance
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14), // Added const
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => ChatScreen(), // const is good here
                          );
                        },
                        child: Text("Start a chat"),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: Text("Back", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
