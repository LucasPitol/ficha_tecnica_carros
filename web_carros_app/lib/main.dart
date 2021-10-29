import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:web_carros_app/utils/styles.dart';
import 'package:flutter/material.dart';

import 'main_component.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize();
  // RequestConfiguration configuration =
  //     RequestConfiguration(testDeviceIds: ['3C1D1E219E8F3888FFE1E04B63476530']);
  // MobileAds.instance.updateRequestConfiguration(configuration);

  await Firebase.initializeApp();

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
