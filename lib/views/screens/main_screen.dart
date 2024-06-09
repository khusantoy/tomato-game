import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bosh sahifa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/game'),
              child: const Text("O'yinni boshlash"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Ko'rsatmalar"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Sozlamalar"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Natijalar"),
            ),
          ],
        ),
      ),
    );
  }
}
