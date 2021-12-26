import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/create_drive.dart';
import 'package:flutter_application_1/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/createdrives': (context) => CreateDrive(),
        
      },
    );
  }
}





