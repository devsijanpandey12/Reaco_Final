import 'package:flutter/material.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({super.key, required this.userData});
  final Map<String, dynamic> userData;
  @override
  _MyEventsScreenState createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  List<Map<String, dynamic>> myEvents = [
    {
      'title': 'Event 1',
      'date': '2023-05-15',
      'location': 'New York',
    },
    {
      'title': 'Event 2',
      'date': '2023-06-01',
      'location': 'London',
    },
    {
      'title': 'Event 3',
      'date': '2023-07-10',
      'location': 'Paris',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Events'),
      ),
      body: ListView.builder(
        itemCount: myEvents.length,
        itemBuilder: (context, index) {
          final event = myEvents[index];
          return Card(
            child: ListTile(
              title: Text(event['title']),
              subtitle: Text('${event['date']} - ${event['location']}'),
            ),
          );
        },
      ),
    );
  }
}