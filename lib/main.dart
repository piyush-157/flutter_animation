import 'package:flutter/material.dart';
import 'package:flutter_animation/HomePage.dart';
import 'package:flutter_animation/details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "DetailsPage": (BuildContext context) => DetailsPage(),
      },
    );
  }
}