// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:convert';
// import 'package:flutter/rendering.dart';
// import 'package:http/http.dart';
//hello 
import 'package:flutter/material.dart';
import 'package:reaco/create_events.dart';
import 'package:reaco/dashboard.dart';
import 'package:reaco/events_joined.dart';
import 'package:reaco/join_events.dart';
import 'package:reaco/login.dart';
import 'package:reaco/my_events.dart';
import 'package:reaco/profile.dart';
import 'package:reaco/splashscreen.dart';
// import 'package:reaco/welcome.dart';
import 'package:reaco/upload_images.dart';
// import 'package:reaco/signup_photograpger.dart';
// import 'package:reaco/signup_user.dart';

// import 'signup.dart';
// import 'forgot_password.dart';
// import 'signup_user.dart';
// import 'signup_photograpger.dart';

void main() {
  runApp(MaterialApp(
    home: Splash(),
    routes: {
      '/home': (context) => SCREENN(),
      // Add other routes here

      // '/userPage': (context) => UserPage(),
      // Route for UserPage

      // '/photographerPage': (context) => PhotographerPage(),
      // Route for PhotographerPage

      '/upload': (context) => UploadScreen(userData:{}),

      '/dash': (context) => DashBoard(userData: {},),

      '/profile': (context) => ProfileScreen(userData: {},),

      '/my-events': (context) => MyEventsScreen(userData: {},),

      '/events-joined': (context) => EventsJoinedScreen(userData: {},),

      '/create-event': (context) => CreateEventScreen(userData: {},),

      '/join-events': (context) => JoinEventsScreen(userData: {},),
    },
  ));
}
