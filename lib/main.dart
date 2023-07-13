import 'package:flutter/material.dart';
import 'package:flutter_pr1/repositories/views/rate.dart';
import 'package:flutter_pr1/repositories/views/home_page.dart';
import 'package:flutter_pr1/repositories/views/aftermain_page.dart';
import 'package:flutter_pr1/repositories/services/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      routes: {
        '/':(context) => HomePage(),
        '/page2':(context) => MyHomePage(),
        '/page1bit':(context) => BitPage(),
      },
    );
  }
}