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
    List<int> position = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    int bombTomatoCount = Random().nextInt(4);
    List<int> bombTomatoPositionIndex = [];

    int count1 = 0;
    while (true) {
      if (count1 > bombTomatoCount) {
        break;
      } else {
        int randomNumber = Random().nextInt(10);
        if (!bombTomatoPositionIndex.contains(randomNumber)) {
          bombTomatoPositionIndex.add(randomNumber);
          count1++;
        }
      }
    }

    int simpleTomatoCount = Random().nextInt(position.length - bombTomatoCount);
    List<int> simpleTomatoPositionIndex = [];

    int count2 = 0;
    while (true) {
      if (count2 > simpleTomatoCount) {
        break;
      } else {
        int randomNumber = Random().nextInt(10);
        if (!simpleTomatoPositionIndex.contains(randomNumber) &&
            !bombTomatoPositionIndex.contains(randomNumber)) {
          simpleTomatoPositionIndex.add(randomNumber);
          count2++;
        }
      }
    }

    List<int> resultPositionIndex =
        bombTomatoPositionIndex + simpleTomatoPositionIndex;

    for (int i = 0; i < resultPositionIndex.length; i++) {
      if (bombTomatoPositionIndex.contains(resultPositionIndex[i])) {
        position[resultPositionIndex[i]] = -1;
      } else {
        position[resultPositionIndex[i]] = 1;
      }
    }
    print(bombTomatoPositionIndex);
    print(simpleTomatoPositionIndex);
    print(position);
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
