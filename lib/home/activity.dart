import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 0,
            child: ListTile(
              leading: Icon(Icons.cleaning_services, color: Colors.black),
              title: Text(
                'Home Service',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('12 Jan 2025, 01:55 PM'),
              trailing: Text(
                '₱500.00',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
