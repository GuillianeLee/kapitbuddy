import 'package:flutter/material.dart';
import '/home/chat.dart';
import '/home/activity.dart';
import '/home/profile.dart';
import '/customer/userInfo.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Messages(),
    ActivityScreen(),
    ProfileScreen(),
  ];

  final List<String> _titles = [
    'Dashboard',
    'Messages',
    'Activity',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          _titles[_currentIndex],  // Dynamic Title
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28.0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 32.0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, size: 30.0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 26.0),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF45B28F),
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskRequestScreen()),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help me find and purchase this book',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            _buildInfoChip(Icons.location_on, 'Azure Beach'),
                            _buildInfoChip(Icons.calendar_today, '17 Jan, 11:59 PM'),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Task by Sydny O.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'PHP 1000.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Negotiable',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(thickness: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          SizedBox(width: 4),
          Text(text, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
