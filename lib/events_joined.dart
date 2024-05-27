import 'package:flutter/material.dart';

class EventsJoinedScreen extends StatefulWidget {
  const EventsJoinedScreen({super.key, required this.userData});
  final Map<String, dynamic> userData;
  @override

  
  _EventsJoinedScreenState createState() => _EventsJoinedScreenState();
}

class _EventsJoinedScreenState extends State<EventsJoinedScreen> {
  List<Map<String, dynamic>> eventsJoined = [
    {
      'title': 'Event A',
      'date': '2023-06-10',
      'location': 'San Francisco',
    },
    {
      'title': 'Event B',
      'date': '2023-07-15',
      'location': 'Tokyo',
    },
    {
      'title': 'Event C',
      'date': '2023-08-20',
      'location': 'Sydney',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events Joined'),
      ),
      body: ListView.builder(
        itemCount: eventsJoined.length,
        itemBuilder: (context, index) {
          final event = eventsJoined[index];
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