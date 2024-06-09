import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pomidor_game/utils/sizes.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    List<int> position = List.filled(10, 0);

    Random random = Random();

    int bombTomatoCount = random.nextInt(4);
    Set<int> bombTomatoPositionIndex = {};

    while (bombTomatoPositionIndex.length < bombTomatoCount) {
      bombTomatoPositionIndex.add(random.nextInt(10));
    }

    int simpleTomatoCount = random.nextInt(position.length - bombTomatoCount);
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

    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {});
    });


    return Scaffold(
      appBar: AppBar(
        title: const Text("Pomidor"),
      ),
      body: Column(
        children: [
          const Text(
            "00 : 00",
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Font',
              color: Color(0xFF795548),
            ),
          ),
          const Text(
            "0",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Font',
              color: Color(0xFF795548),
            ),
          ),
          Wrap(
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
                          ? Stack(children: [
                              Image.asset(
                                "assets/images/pomidor_normal.png",
                                width: SizeUtils.screenWidth(context) / 4,
                                height: SizeUtils.screenWidth(context) / 4,
                              ),
                              Image.asset(
                                "assets/images/fg_hole.png",
                                width: SizeUtils.screenWidth(context) / 4,
                                height: SizeUtils.screenWidth(context) / 4,
                              ),
                            ])
                          : Image.asset(
                              "assets/images/pomidor_bomb.png",
                              width: SizeUtils.screenWidth(context) / 4,
                              height: SizeUtils.screenWidth(context) / 4,
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
                      ? Image.asset(
                          "assets/images/pomidor_normal.png",
                          width: SizeUtils.screenWidth(context) / 4,
                          height: SizeUtils.screenWidth(context) / 4,
                        )
                      : Image.asset(
                          "assets/images/pomidor_bomb.png",
                          width: SizeUtils.screenWidth(context) / 4,
                          height: SizeUtils.screenWidth(context) / 4,
                        );
            }),
          ),
        ],
      ),
    );
  }
}
