import 'package:flutter/material.dart';
import 'package:flutter_pr1/repositories/views/rate.dart';
import 'package:flutter_pr1/repositories/views/home_page.dart';
import 'package:flutter_pr1/repositories/views/aftermain_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomePage(),
  '/page2': (context) => const MyHomePage(),
  '/page1bit': (context) => const BitPage(),
};