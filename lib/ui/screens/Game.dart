import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shapeblinder/core/my_lost_screen_arguments.dart';
import 'package:shapeblinder/ui/widgets/layout.dart';
import 'package:shapeblinder/ui/widgets/logo.dart';
import 'package:touchable/touchable.dart';
import "../../core/round_utilities.dart";
import "../../core/haptic_utilities.dart";

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late RoundData data;
  int points = 0;
  int high = 0;
  final GlobalKey scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    setState(() {
      points = 0;
      data = generateRound();
    });
  }

  void guess(BuildContext context, String name) {
    lightHaptic();
    if (data.options[data.correct] == name) {
      // correct guess
      correctGuess(context);
    } else {
      // wrong guess
      lost();
    }
  }

  void correctGuess(BuildContext context) {
    // show snack bar for correct
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
        content: SizedBox(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.check, size: 80),
                SizedBox(width: 10),
                Text("Correct",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold))
              ]),
        )));

    setState(() {
      points++;
      data = generateRound();
    });
  }

  void lost() {
    vibrateHaptic();
    // navigate to the lost screen with the current points
    Navigator.pushNamed(context, "/lost",
        arguments: LostScreenArguments(points: points));

    // reset points
    reset();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Layout(children: [
          Logo(
              title: "shapeblinder",
              subtitle: "current score: $points | high: 0"),
          SizedBox(
              height: width / 1.25,
              width: width / 1.25,
              child: CanvasTouchDetector(
                builder: (context) {
                  return CustomPaint(
                      painter: getPainterForName(
                          context, vibrateHaptic, data.options[data.correct]));
                },
                gesturesToOverride: const <GestureType>[
                  GestureType.onPanDown,
                  GestureType.onPanStart,
                  GestureType.onPanUpdate
                ],
              )),
          Center(
              child: Text("Select the shape that you feel",
                  style: Theme.of(context).textTheme.bodyText2)),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
            child: Builder(builder: (context) {
              return Opacity(
                opacity: 0.4,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ...data.options.map((shape) => SizedBox(
                          height: width / 5,
                          width: width / 5,
                          child: GestureDetector(
                              onTap: () => guess(context, shape),
                              child: SvgPicture.asset("assets/svg/$shape.svg",
                                  semanticsLabel: "$shape icon"))))
                    ]),
              );
            }),
          )
        ]));
  }
}
