import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vnbingo/utils/colors.dart';

class bingo_screen extends StatelessWidget {
  const bingo_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}

class Splash extends StatefulWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late ConfettiController _confettiController;

  TextStyle stilo = GoogleFonts.sigmarOne(
      textStyle: TextStyle(color: myRed, fontSize: 30, height: 2));

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 2));
    _confettiController.play();
  }

  @override
  void dispose() {
    super.dispose();
    _confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: myRedLight,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'B',
                style: stilo,
                textScaleFactor: 2,
              ),
              Text(
                'I',
                style: stilo,
                textScaleFactor: 1.4,
              ),
              Text(
                'N',
                style: stilo,
                textScaleFactor: 1.8,
              ),
              Text(
                'G',
                style: stilo,
                textScaleFactor: 1.5,
              ),
              Text(
                'O',
                style: stilo,
                textScaleFactor: 2,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: true,
            colors: const [myBlue, myPurple, myGreen, myYellow, myRed],
          ),
        ),
      ],
    );
  }
}
