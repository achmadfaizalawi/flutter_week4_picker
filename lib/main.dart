import 'package:flutter/material.dart';
import 'package:flutter_week4_picker/features/create_post_page/ui/create_post_page.dart';
import 'package:flutter_week4_picker/features/homepage/ui/homepage.dart';
//import 'package:flutter_picker_app/features/create_post_page/ui/create_post_page.dart';
//import 'features/homepage/ui/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage()
    );
  }
}