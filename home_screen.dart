import 'package:flutter/material.dart';
import 'tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final String gender;

  HomeScreen({required this.username, required this.gender});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool preferJava = false;
  bool preferPython = false;
  bool preferDart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, ${widget.username}!'),
            SizedBox(height: 16),
            Text('Gender: ${widget.gender}'),
            SizedBox(height: 32),
            Text('User List:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Grece, Female'),
            SizedBox(height: 8),
            Text('${widget.username}, ${widget.gender}'),
            SizedBox(height: 16),
            Text('Preferred Programming Language:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            buildLanguageCheckbox('Java', preferJava),
            buildLanguageCheckbox('Python', preferPython),
            buildLanguageCheckbox('Dart', preferDart),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TasksScreen()),
                );
              },
              child: Text('View Tasks'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLanguageCheckbox(String label, bool value) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            setState(() {
              if (label == 'Java') {
                preferJava = newValue ?? false;
              } else if (label == 'Python') {
                preferPython = newValue ?? false;
              } else if (label == 'Dart') {
                preferDart = newValue ?? false;
              }
            });
          },
        ),
        Text(label),
      ],
    );
  }
}
