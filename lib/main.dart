import 'dart:developer';
import 'package:erp/ERPHome.dart';
import 'package:erp/ErpTabBar.dart';
import 'package:erp/splashscreen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'document/documentex.dart';
import 'loginscreen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primarySwatch: Colors.indigo,
      ),
      home: Splashsceen(),
    );
  }
}
