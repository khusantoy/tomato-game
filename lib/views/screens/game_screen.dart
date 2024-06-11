import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pomidor_game/utils/sizes.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool isGameStarted = false;

  int score = 0;
  int second = 10;
  int minute = 0;

  void timer() {
    Timer(Duration(seconds: 10), handleTimeout);
  }

  void handleTimeout() {
    isGameStarted = false;

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "O'yin tugadi",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Font',
                  color: Color(0xFF795548),
                ),
              ),
              const Text("Sizning natijangiz"),
              Text("$score"),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/game');
                },
                child: const Text("Qayta o'ynash"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/main');
                },
                child: const Text("Bosh sahifa"),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<int> position = List.filled(10, 0);

    Random random = Random();

    void startGame() {
      setState(() {
        isGameStarted = true;
      });
    }

    if (isGameStarted) {
      timer();

      int bombTomatoCount = random.nextInt(4) + 2;
      Set<int> bombTomatoPositionIndex = {};

      while (bombTomatoPositionIndex.length < bombTomatoCount) {
        bombTomatoPositionIndex.add(random.nextInt(10));
      }

      int remainingPositions = 9 - bombTomatoCount;

      int simpleTomatoCount =
          (remainingPositions > 0) ? random.nextInt(remainingPositions) + 1 : 0;
      Set<int> simpleTomatoPositionIndex = {};

      while (simpleTomatoPositionIndex.length < simpleTomatoCount) {
        int randomNumber = random.nextInt(10);
        if (!bombTomatoPositionIndex.contains(randomNumber)) {
          simpleTomatoPositionIndex.add(randomNumber);
        }
      }

      for (int index in bombTomatoPositionIndex) {
        position[index] = -1;
      }

      for (int index in simpleTomatoPositionIndex) {
        position[index] = 1;
      }

      second--;

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {});
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pomidor"),
      ),
      body: Column(
        children: [
          Text(
            "00 : ${second < 10 ? "0$second" : second}",
            style: const TextStyle(
              fontSize: 40,
              fontFamily: 'Font',
              color: Color(0xFF795548),
            ),
          ),
          Text(
            "$score",
            style: const TextStyle(
              fontSize: 30,
              fontFamily: 'Font',
              color: Color(0xFF795548),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Expanded(
            child: Wrap(
              children: List<Widget>.generate(position.length, (index) {
                if (index == 8) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: SizeUtils.screenWidth(context) / 4,
                    ),
                    child: position[index] == 0
                        ? Image.asset(
                            "assets/images/bg_hole.png",
                            width: SizeUtils.screenWidth(context) / 4,
                            height: SizeUtils.screenWidth(context) / 4,
                          )
                        : position[index] == 1
                            ? GestureDetector(
                                onTap: () {
                                  score++;
                                  second++;
                                },
                                child: Stack(children: [
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Image.asset(
                                      "assets/images/pomidor_normal.png",
                                      width:
                                          SizeUtils.screenWidth(context) / 5.9,
                                      height:
                                          SizeUtils.screenWidth(context) / 5.9,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/fg_hole.png",
                                    width: SizeUtils.screenWidth(context) / 4,
                                    height: SizeUtils.screenWidth(context) / 4,
                                  ),
                                ]),
                              )
                            : GestureDetector(
                                onTap: () {
                                  second -= 5;
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 8,
                                      child: Image.asset(
                                        "assets/images/pomidor_bomb.png",
                                        width:
                                            SizeUtils.screenWidth(context) / 5,
                                        height:
                                            SizeUtils.screenWidth(context) / 5,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/fg_hole.png",
                                      width: SizeUtils.screenWidth(context) / 4,
                                      height:
                                          SizeUtils.screenWidth(context) / 4,
                                    ),
                                  ],
                                ),
                              ),
                  );
                }
                return position[index] == 0
                    ? Image.asset(
                        "assets/images/bg_hole.png",
                        width: SizeUtils.screenWidth(context) / 4,
                        height: SizeUtils.screenWidth(context) / 4,
                      )
                    : position[index] == 1
                        ? GestureDetector(
                            onTap: () {
                              score++;
                              second++;
                            },
                            child: Stack(children: [
                              Positioned(
                                left: 10,
                                top: 10,
                                child: Image.asset(
                                  "assets/images/pomidor_normal.png",
                                  width: SizeUtils.screenWidth(context) / 5.9,
                                  height: SizeUtils.screenWidth(context) / 5.9,
                                ),
                              ),
                              Image.asset(
                                "assets/images/fg_hole.png",
                                width: SizeUtils.screenWidth(context) / 4,
                                height: SizeUtils.screenWidth(context) / 4,
                              ),
                            ]),
                          )
                        : GestureDetector(
                            onTap: () {
                              second -= 5;
                            },
                            child: Stack(children: [
                              Positioned(
                                top: 8,
                                child: Image.asset(
                                  "assets/images/pomidor_bomb.png",
                                  width: SizeUtils.screenWidth(context) / 5,
                                  height: SizeUtils.screenWidth(context) / 5,
                                ),
                              ),
                              Image.asset(
                                "assets/images/fg_hole.png",
                                width: SizeUtils.screenWidth(context) / 4,
                                height: SizeUtils.screenWidth(context) / 4,
                              ),
                            ]),
                          );
              }),
            ),
          ),
          SizedBox(
            width: 200.w,
            height: 40.h,
            child: FilledButton(
              onPressed: isGameStarted ? null : startGame,
              child: const Text("START"),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
