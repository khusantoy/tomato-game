import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacementNamed(context, '/main'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Pomidor",
            style: TextStyle(
              fontSize: 70,
              fontFamily: 'Font',
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset("assets/images/pomidor_bomb.png"),
        ],
      ),
    );
  }
}
