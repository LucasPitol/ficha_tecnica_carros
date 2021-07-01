
import 'package:flutter/material.dart';
import 'package:web_carros_app/utils/styles.dart';

import 'main_component.dart';

Future<void> main() async {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Styles.mainTheme,
      home: MainComponent(),
    );
  }
}