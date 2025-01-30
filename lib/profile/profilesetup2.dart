import 'package:flutter/material.dart';
import 'profilesetup3.dart';

class TaskPreferencesScreen extends StatefulWidget {
  @override
  _TaskPreferencesScreenState createState() => _TaskPreferencesScreenState();
}

class _TaskPreferencesScreenState extends State<TaskPreferencesScreen> {
  Map<String, bool> runErrandTasks = {
    'Picking up': false,
    'Delivery': false,
    'Queuing': false,
    'Drop offs': false,
    'Others': false,
  };

  Map<String, bool> homeServicesTasks = {
    'Basic home maintenance': false,
    'Housekeeping': false,
    'Lawn and Garden Care': false,
    'Pet Care': false,
    'Others': false,
  };

  Map<String, bool> relocationTasks = {
    'Packing and Unpacking': false,
    'Small Move Support': false,
    'Pre-move cleaning': false,
    'Post-move cleaning': false,
    'Others': false,
  };

  Map<String, bool> studyandworkTasks = {
    'Language Tutoring': false,
    'Academic Tutoring': false,
    'Tech Support': false,
    'Software Installation': false,
    'Others': false,
  };

  Map<String, bool> seniorTasks = {
    'Doctor Visit Assistance': false,
    'Companionship': false,
    'Light Cleaning': false,
    'Errand Assistance': false,
    'Others': false,
  };

  Map<String, bool> eventTasks = {
    'Setup Support': false,
    'Errand Runner': false,
    'On-Site Help': false,
    'Decoration Rental and Setup': false,
    'Others': false,
  };

  Map<String, bool> personalizedTasks = {
    'Gift Shopping': false,
    'Home Essentials': false,
    'Returns and Exchanges': false,
    'Custom Orders': false,
    'Others': false,
  };

  bool customTaskRequest = false; // New boolean to track the custom task checkbox

  void _onNextPressed() {
    List<String> selectedTasks = [
      ...runErrandTasks.entries.where((e) => e.value).map((e) => e.key),
      ...homeServicesTasks.entries.where((e) => e.value).map((e) => e.key),
    ];

    print("Selected Tasks: $selectedTasks");
    print("Custom Task Requests: $customTaskRequest");

    // Navigate to the next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RequirementsScreen()),
    );
  }

  Widget _buildTaskSection(String title, String emoji, Map<String, bool> tasks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(emoji, style: TextStyle(fontSize: 20)), // Emoji icon
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        ...tasks.keys.map((task) {
          return Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: CheckboxListTile(
              title: Text(task),
              value: tasks[task],
              onChanged: (bool? value) {
                setState(() {
                  tasks[task] = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        }).toList(),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.white, // White background for the entire content
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2 out of 4',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Task Preferences',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Please select all the tasks you want to be notified about.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      _buildTaskSection('Run Errand', '🛒', runErrandTasks),
                      _buildTaskSection('Home Services', '🏡', homeServicesTasks),
                      _buildTaskSection('Relocation Assistance', '📦', relocationTasks),
                      _buildTaskSection('Study/Work Support', '📚', studyandworkTasks),
                      _buildTaskSection('Senior & Disability Help', '👤', seniorTasks),
                      _buildTaskSection('Event Assistance', '🎉', eventTasks),
                      SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: CheckboxListTile(
                          title: Row(
                            children: [
                              Text('✏️', style: TextStyle(fontSize: 24)),
                              SizedBox(width: 8),
                              Text('Custom Task Requests'),
                            ],
                          ),
                          value: customTaskRequest,
                          onChanged: (bool? value) {
                            setState(() {
                              customTaskRequest = value ?? false;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: ElevatedButton(
                onPressed: _onNextPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(69, 178, 143, 1),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
