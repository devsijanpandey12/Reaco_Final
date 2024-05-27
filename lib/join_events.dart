import 'package:flutter/material.dart';

class JoinEventsScreen extends StatefulWidget {
   const JoinEventsScreen({super.key, required this.userData});
  final Map<String, dynamic> userData;

  @override
  _JoinEventsScreenState createState() => _JoinEventsScreenState();
}

class _JoinEventsScreenState extends State<JoinEventsScreen> {
  final _urlController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  void _scanQRCode() {
    // Implement code to open camera for QR code scanning
    // You may need to use a third-party package or native code for this functionality
    print('Opening camera for QR code scanning');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Join Event',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Enter URL or Scan QR code:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _scanQRCode,
              child: Text('Scan QR Code'),
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Join the event with URL
                  final url = _urlController.text;

                  if (url.isNotEmpty) {
                    print('Joined event with URL: $url');
                  } else {
                    print('Please enter a URL');
                  }
                },
                child: Text('Join Event'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}