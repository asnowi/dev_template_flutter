import 'dart:math';

class RandomUtils {

  static RandomUtils get to => RandomUtils();

  late Random random;

  RandomUtils() {
    random = Random();
  }

   int getRandomInt() {
    return random.nextInt(100);
  }
}