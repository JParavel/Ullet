import 'package:flutter/material.dart';
import 'package:platzi_trip_flutter/pages/my_home_page.dart';
import 'package:platzi_trip_flutter/pages/payment_page.dart';
import 'package:platzi_trip_flutter/pages/profile_page.dart';
import 'package:get/get.dart';
import 'package:platzi_trip_flutter/splashs/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
