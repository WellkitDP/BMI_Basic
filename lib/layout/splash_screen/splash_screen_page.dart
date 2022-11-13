import 'package:flutter/material.dart';

import '../layout_bmi/bmi_layout_service.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BMIScreenPage()),
            (route) => false);
      },
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/splash.png",
          width: 60,
        ),
      ),
    );
  }
}
