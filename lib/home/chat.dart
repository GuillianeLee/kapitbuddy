import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildToggleButton('Chat', true),
              SizedBox(width: 8),
              _buildToggleButton('Notifications', false),
            ],
          ),
          SizedBox(height: 16),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/avatar.png'), // Replace with your image
            ),
            title: Text(
              'Sydny O.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'This chat remains open for this ...',
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              'Sun',
              style: TextStyle(color: Colors.grey),
            ),
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF45B28F) : Color(0xFFDCF5ED),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF45B28F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

