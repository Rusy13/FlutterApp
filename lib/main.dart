import 'package:flutter/material.dart';
import 'package:flutter_pr1/repositories/services/routes.dart';
// import 'package:flutter_pr1/repositories/services/database.dart';


void main() {
  runApp(const MyApp());
  //  connectToDatabase();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      routes: routes,
    );
  }
}
