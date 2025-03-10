import 'package:flutter/material.dart';
import '/customer/userRate.dart';
import '/customer/userChat.dart';
import '/customer/receipt.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Picture
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                    ),
                    const SizedBox(width: 10),

                    // User Info
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
                            children: const [
                              Icon(Icons.phone, color: Colors.green, size: 18),
                              SizedBox(width: 5),
                              Text("0912 678 8919", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.location_on, color: Colors.blue, size: 18),
                              SizedBox(width: 5),
                              Text("Azure Beach", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          TextButton(
                            onPressed: () {}, // Insert task details
                            child: const Text(
                              "View Task Details",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Buttons
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
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Color(0xFF45B28F), width: 2),
                          ),
                        ),// Chat action
                        child: const Text("Chat"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) =>  ReceiptScreen(), // const is good here
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF45B28F),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Task Done"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
