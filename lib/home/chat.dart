import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  bool _isChatSelected = true; // Tabs

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildToggleButton(context, 'Chat', _isChatSelected, true),
              SizedBox(width: 8),
              _buildToggleButton(context, 'Notifications', !_isChatSelected, false),
            ],
          ),
          SizedBox(height: 16),
          _isChatSelected ? _buildChatList() : _buildNotifications(),
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('assets/avatar.png'),
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
    );
  }

  Widget _buildNotifications() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/notifications_image.png',
            width: 200,
          ),
          SizedBox(height: 20),
          Text(
            'Notifications will appear here',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Watch this space for offers, updates and more',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(BuildContext context, String text, bool isSelected, bool isChat) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isChatSelected = isChat;
          });
        },
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
      ),
    );
  }
}
