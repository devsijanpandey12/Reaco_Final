import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key,required this.userData});
  final Map<String, dynamic> userData;
 @override
 _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Profile'),
     ),
     body: Center(
       child: Text(
         'This is my Profile',
         style: TextStyle(
           fontSize: 24.0,
           fontWeight: FontWeight.bold,
         ),
       ),
     ),
   );
 }
}