import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pomidor_game/views/screens/game_screen.dart';
import 'package:pomidor_game/views/screens/main_screen.dart';
import 'package:pomidor_game/views/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(appBarTheme: const AppBarTheme(centerTitle: true)),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/main': (context) => const MainScreen(),
          '/game': (context) => const GameScreen(),
        },
      ),
    );
  }
}
