import "dart:math";
import "dart:core";

class RoundData {
  List<String> options;
  int correct;
  RoundData({required this.options, required this.correct});
}

Random random = Random();
List<String> possibleShapes = [
  "circle",
  "cross",
  "square",
  "oval",
  "donut",
  "line"
];

RoundData generateRound() {
  // make a copy of the original
  List<String> temp = possibleShapes.map((item) => item).toList();

  // result array
  List<String> res = <String>[];

  for (int i = 0; i < 3; i++) {
    // get a random number under the length
    int randomIndex = random.nextInt(temp.length);
    // put the item at that index from the temp array into the result
    res.add(temp[randomIndex]);
    // remove the item at that index from the temp array so we can't have a duplicate
    temp.removeAt(randomIndex);
  }

  RoundData data = RoundData(options: res, correct: random.nextInt(3));

  return data;
}
