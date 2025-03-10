import 'package:flutter/material.dart';
import '/customer/userLocation.dart';


class TaskRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Help me find and purchase this book in any Fullybooked branches",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "PHP1000.00",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFF45B28F),
                  borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Negotiable",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "(incl. of additional purchases: PHP300.00)",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              "Task request by",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sydney O.",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        SizedBox(width: 2),
                        Text(
                          "4.8",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "view profile",
                          style: TextStyle(fontSize: 16, color: Colors.green, decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "17 Jan, 1:15PM",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  "Location",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            Text(
              "Azure Beach, Bicutan Paranaque",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green, decoration: TextDecoration.underline),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  "Target Date",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Urgent",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
            Text(
              "Sat, 17 Jan (11:59 PM)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your offer",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Make Offer"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF45B28F),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),SizedBox(height: 16),
            Text(
              "Description",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              "Help me find and purchase this book in any Fullybooked branches around Las Pinas and Alabang sana.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "• Book name: Keep no Secrets by Charlie Lane",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ), SizedBox(height: 16),
            Text(
              "Skills and Experience (optional)",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              "N/A",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Payment Method",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              "Cash upon task completion",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
                children: [
            Expanded(
            child: ElevatedButton(
            onPressed: () {},
            child: Text("Cancel", style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFDCF5ED),
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          ),
          SizedBox(width: 8),
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserInfoScreen(),
              ),
            );
          },
          child: const Text("Accept"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF45B28F),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      ],
    ),
    ],
    ),
    ),
      ),
    );
    }
}
