import 'package:flutter/material.dart';
import 'package:shapeblinder/core/haptic_utilities.dart';
import 'package:shapeblinder/core/my_lost_screen_arguments.dart';
import 'package:shapeblinder/ui/widgets/layout.dart';
import 'package:shapeblinder/ui/widgets/logo.dart';
import 'package:shapeblinder/ui/widgets/tap.dart';

class Lost extends StatelessWidget {
  const Lost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as LostScreenArguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            lightHaptic();
            Navigator.pop(context);
          },
          child: Layout(children: <Widget>[
            const Spacer(
              flex: 2,
            ),
            Logo(title: "You lost", subtitle: "score: ${args.points}"),
            const Spacer(),
            const Tap(title: "Tap anywhere to start again")
          ])),
    );
  }
}
