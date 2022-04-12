import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/utils/colors.dart';

import '../providers/myproveedor.dart';

class linea_display extends StatefulWidget {
  const linea_display({Key? key}) : super(key: key);

  @override
  State<linea_display> createState() => _linea_displayState();
}

class _linea_displayState extends State<linea_display> {
  late ConfettiController _confettiController;
  bool play = true;
  bool visible = false;
  double _lineaOpacity = 0;
  TextStyle stilo = GoogleFonts.sigmarOne(
      textStyle: TextStyle(color: myRed, fontSize: 30, height: 2));

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    _confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Proveedor>(context);
    if (provider.cantaLineaYa && !provider.ganeLinea) {
      if (play) {
        _confettiController.play();
        visible = true;
        setState(() {
          _lineaOpacity = 1;
        });
      }
      play = false;
    } else {
      _confettiController.stop();
      visible = false;
    }
    return GestureDetector(
      onTap: () => _lineaOpacity = 0,
      child: Visibility(
        visible: visible,
        child: AnimatedOpacity(
          opacity: _lineaOpacity,
          duration: Duration(seconds: 1),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'L',
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
                      'E',
                      style: stilo,
                      textScaleFactor: 1.5,
                    ),
                    Text(
                      'A',
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
          ),
        ),
      ),
    );
  }
}
