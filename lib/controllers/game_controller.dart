import 'dart:math';

class GameController {

  // tomatoes random position generator
  List<int> getRandomPosition() {
    List<int> position = List.filled(10, 0);

    Random random = Random();

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

    return position;
  }
}
