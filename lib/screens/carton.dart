import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/providers/myproveedor.dart';
import 'package:vnbingo/providers/proveecartones.dart';
import 'package:vnbingo/providers/user_provider.dart';
import 'package:vnbingo/screens/bingo_screen.dart';
import 'package:vnbingo/utils/colors.dart';
import 'package:vnbingo/utils/secure_storage.dart';
import 'package:vnbingo/utils/utils.dart';

bool cantadaLinea = false;

class CartonWidget extends StatefulWidget {
  final Carton carton;
  final int cartonindex;
  const CartonWidget({
    Key? key,
    required this.carton,
    required this.cartonindex,
  }) : super(key: key);

  @override
  State<CartonWidget> createState() => _CartonWidgetState();
}

class _CartonWidgetState extends State<CartonWidget> {
  double _opacity = 0.3;

  static const countMatrix = 5;
  Color colorButton = Colors.white70;
  Color colorCarton = myBlueLight;
  Color colorText = myRed;
  Color? ColorStamp = myRed;

  List<List<dynamic>> matrix = [];

  final List<ValueNotifier<bool>> _hasBeenPressed = [];
  final List<ValueNotifier<bool>> _isErrorFree = [];

  @override
  void initState() {
    super.initState();
    setEmptyFields();
    populateMatrix();
    populatehasBeenP();
    inspect(_hasBeenPressed);
    inspect(_isErrorFree);
    inspect(widget.carton.pressed);
  }

  void populatehasBeenP() {
    var pizarra = Provider.of<Proveedor>(context, listen: false).pizarra;

    for (int i = 0; i < 25; i++) {
      _hasBeenPressed.add(ValueNotifier(widget.carton.pressed[i]));
    }

    for (int i = 0; i < 25; i++) {
      var j = numerito(i, matrix) - 1;

      if (j == -1) {
        _isErrorFree.add(ValueNotifier(true));
      } else {
        if (widget.carton.pressed[i] && !pizarra[j]) {
          _isErrorFree.add(ValueNotifier(false));
        } else {
          _isErrorFree.add(ValueNotifier(true));
        }
      }
    }
  }

  void populateMatrix() {
    int i = 0;
    (widget.carton.toJson()).forEach((key, value) {
      matrix[i] = value;
      i++;
    });
  }

  void setEmptyFields() => setState(() => matrix = List.generate(
      countMatrix, (_) => List.generate(countMatrix, (_) => ' ')));

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Proveedor>(context);

    bool visible = false;

    if (provider.haysorteo) {
      setState(() {
        colorText = myPurple;
        _opacity = 1;
      });
      if (provider.cantaLineaYa) {
        colorText = myRed;
        colorCarton = myRedLight;
      }
      if (provider.estadoLinea) {
        colorText = myRed;
      }
    }
    TextStyle stilo = GoogleFonts.sigmarOne(
        textStyle: TextStyle(color: colorText, fontSize: 16, height: 2));

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          child: Center(
            child: AspectRatio(
              aspectRatio: 1.95,
              child: Container(
                  constraints: BoxConstraints(minWidth: 450),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: colorCarton,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GridView.builder(
                          padding: const EdgeInsets.only(top: 20),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 2.3,
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 3),
                          itemCount: 25,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                EachNumber(
                                  matrix: matrix,
                                  colorButton: colorButton,
                                  isErrorFree: _isErrorFree,
                                  index: index,
                                  hasBeenPressed: _hasBeenPressed,
                                  sorteoActivo: provider.haysorteo,
                                  carton: widget.carton,
                                  cartonIndex: widget.cartonindex,
                                ),
                                ValueListenableBuilder(
                                  valueListenable: _hasBeenPressed[index],
                                  child: Xmark(
                                    colortext: colorText,
                                    hasBeenPressed: _hasBeenPressed,
                                    isErrorFree: _isErrorFree,
                                    index: index,
                                    carton: widget.carton,
                                    cartonIndex: widget.cartonindex,
                                  ),
                                  builder: (context, n, c) {
                                    return Xmark(
                                      colortext: colorText,
                                      hasBeenPressed: _hasBeenPressed,
                                      isErrorFree: _isErrorFree,
                                      index: index,
                                      carton: widget.carton,
                                      cartonIndex: widget.cartonindex,
                                    );
                                  },
                                ),
                              ],
                              alignment: AlignmentDirectional.center,
                            );
                          }),
                      Positioned(
                        top: -9,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'B',
                              textScaleFactor: 1.2,
                              style: stilo,
                            ),
                            Text(
                              'I',
                              textScaleFactor: 0.9,
                              style: stilo,
                            ),
                            Text(
                              'N',
                              style: stilo,
                            ),
                            Text(
                              'G',
                              textScaleFactor: 1.2,
                              style: stilo,
                            ),
                            Text(
                              'O',
                              style: stilo,
                            ),
                          ],
                        ),
                      ),
                      // LineLogic(),
                    ],
                  )),
            ),
          ),
        ));
  }
}

class LineLogic extends StatefulWidget {
  const LineLogic({
    Key? key,
  }) : super(key: key);

  @override
  State<LineLogic> createState() => _LineLogicState();
}

class _LineLogicState extends State<LineLogic> {
  bool _visibility = false;

  void setVisibility() {
    _visibility = true;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visibility,
      child: Positioned(
          top: -110,
          left: 2,
          right: 0,
          bottom: 0,
          child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.01,
              child: Container(
                decoration: BoxDecoration(
                  color: myRed,
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ))),
    );
  }
}

class EachNumber extends StatefulWidget {
  const EachNumber({
    Key? key,
    required this.matrix,
    required this.colorButton,
    required this.index,
    required this.hasBeenPressed,
    required this.isErrorFree,
    required this.sorteoActivo,
    required this.carton,
    required this.cartonIndex,
  }) : super(key: key);

  final List<List> matrix;
  final bool sorteoActivo;
  final Color colorButton;
  final int index;
  final List<ValueNotifier<bool>> hasBeenPressed;
  final List<ValueNotifier<bool>> isErrorFree;
  final Carton carton;
  final int cartonIndex;

  @override
  State<EachNumber> createState() => _EachNumberState();
}

class _EachNumberState extends State<EachNumber> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Proveedor>(context);
    final usuario = Provider.of<UserProvider>(context);

    int control = 0;

    return ElevatedButton(
      onPressed: () {
        if (widget.index != 12) {
          if (widget.sorteoActivo) {
            widget.hasBeenPressed[widget.index].value =
                !widget.hasBeenPressed[widget.index].value;

            if (!provider
                .pizarra[(numerito(widget.index, widget.matrix) - 1)]) {
              print('can´t be here');
              widget.isErrorFree[widget.index].value = false;
            }
            provider.sendPress(widget.hasBeenPressed[widget.index].value,
                widget.cartonIndex, widget.index);

            if (!provider.estadoLinea) {
              // if (provider.bolita > 4) {
              control = hayLinea(widget.hasBeenPressed);
              if (control > 0) {
                print('Se ha cantado linea');
                if (linea(widget.isErrorFree, control)) {
                  print('La linea es correcta');

                  provider.cantadaLinea(
                      usuario.getUser.uid, control, widget.cartonIndex);
                }
                // }
              }
            }
            if (!provider.cantaBingoYa && !provider.estadoBingo) {
              if (hayBingo(widget.hasBeenPressed)) {
                print('Se ha cantado Bingo');
                if (hayBingo(widget.isErrorFree)) {
                  provider.cantadaBingo(
                      usuario.getUser.uid, widget.cartonIndex);
                  print('El bingo es correcto');
                  WidgetsBinding.instance!.addPostFrameCallback((_) =>
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Splash())));
                }
              }
            }
          }
        }
      },
      child: StringNumberOrBlank(index: widget.index, matrix: widget.matrix),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(widget.colorButton),
      ),
    );
  }
}

class StringNumberOrBlank extends StatelessWidget {
  const StringNumberOrBlank({
    Key? key,
    required this.index,
    required this.matrix,
  }) : super(key: key);

  final int index;
  final List<List> matrix;

  @override
  Widget build(BuildContext context) {
    String respuesta = numerito(index, matrix).toString();
    if (respuesta == '0') {
      respuesta = ' ';
    }

    return FittedBox(
      child: Text(
        respuesta,
        style: const TextStyle(
            fontSize: 14, color: mBColor, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class Xmark extends StatefulWidget {
  const Xmark({
    Key? key,
    required this.hasBeenPressed,
    required this.isErrorFree,
    required this.index,
    required this.carton,
    required this.cartonIndex,
    required this.colortext,
  }) : super(key: key);

  final List<ValueNotifier<bool>> hasBeenPressed;
  final List<ValueNotifier<bool>> isErrorFree;
  final int index;
  final Carton carton;
  final int cartonIndex;
  final Color colortext;

  @override
  State<Xmark> createState() => _XmarkState();
}

class _XmarkState extends State<Xmark> {
  bool visible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.index == 12) {
      visible = false;
    } else {
      visible = widget.hasBeenPressed[widget.index].value;
    }

    return Visibility(
        visible: visible,
        child: FittedBox(
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              widget.hasBeenPressed[widget.index].value =
                  !widget.hasBeenPressed[widget.index].value;

              widget.isErrorFree[widget.index].value = true;
            },
            icon: const Icon(Icons.clear),
            color: widget.colortext,
            iconSize: 40,
          ),
        ));
  }
}
