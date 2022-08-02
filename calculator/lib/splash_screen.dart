import 'dart:async';

import 'package:calculator/base_app.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return BaseApp();
            })));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff002A3C),
      body: Center(
        child: Container(
          width: 215,
          height: 215,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/calcu.png'))),
        ),
      ),
    );
  }
}
