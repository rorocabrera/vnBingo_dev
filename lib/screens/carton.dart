import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/providers/myproveedor.dart';
import 'package:vnbingo/providers/proveecartones.dart';
import 'package:vnbingo/providers/user_provider.dart';
import 'package:vnbingo/screens/bingo_screen.dart';
import 'package:vnbingo/utils/colors.dart';
import 'package:vnbingo/utils/utils.dart';

bool cantadaLinea = false;

class CartonWidget extends StatefulWidget {
  final int cartonindex;
  const CartonWidget({
    Key? key,
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
  String route = 'assets/vnbingo_logo_2.svg';
  int caso = 0;

  List<List<dynamic>> matrix = [];

  @override
  void initState() {
    super.initState();
    setEmptyFields();
    populateMatrix();
  }

  void populateMatrix() {
    int i = 0;
    Carton carton = Provider.of<Proveedor>(context, listen: false)
        .cartones[widget.cartonindex];
    (carton.toJson()).forEach((key, value) {
      matrix[i] = value;
      i++;
    });
  }

  void setEmptyFields() => setState(() => matrix = List.generate(
      countMatrix, (_) => List.generate(countMatrix, (_) => ' ')));

  callback(casoLinea) {
    setState(() {
      caso = casoLinea;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Proveedor>(context);

    if (provider.haysorteo) {
      setState(() {
        colorText = myPurple;
        _opacity = 1;
        route = 'assets/vnbingo_logo_1.svg';
      });
      if (provider.cantaLineaYa) {
        colorText = myRed;
        colorCarton = myRedLight;
        route = 'assets/vnbingo_logo_2.svg';
      }
      if (provider.estadoLinea) {
        colorText = myRed;
        route = 'assets/vnbingo_logo_2.svg';
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
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: AspectRatio(
                aspectRatio: 1.95,
                child: Container(
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
                                    index: index,
                                    cartonIndex: widget.cartonindex,
                                    callback: callback,
                                  ),
                                  index == 12
                                      ? SvgPicture.asset(route)
                                      : Xmark(
                                          colortext: colorText,
                                          index: index,
                                          cartonIndex: widget.cartonindex,
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
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: CustomPaint(
                            foregroundPainter: LinePainter(caso),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ));
  }
}

class LinePainter extends CustomPainter {
  LinePainter(this.caso);

  int caso;

  @override
  void paint(Canvas canvas, Size size) {
    double c1 = 0.1702; // lo que se mueve vertical
    double c2 = 0.21; // lo que se mueve horizontal
    double w1 = 0.08;
    double w2 = 0;
    double h1 = 0.18;
    double h2 = 0;

    bool pinta = true;

    switch (caso) {
      case 0:
        pinta = false;
        break;
      case 1:
        w2 = w1 + (4 * c2);
        h2 = h1;
        break;
      case 2:
        h1 += c1;
        h2 = h1;
        w2 = w1 + (4 * c2);
        break;
      case 3:
        h1 += 2 * c1;
        h2 = h1;
        w2 = w1 + (4 * c2);
        break;
      case 4:
        h1 += 3 * c1;
        h2 = h1;
        w2 = w1 + (4 * c2);
        break;
      case 5:
        h1 += 4 * c1;
        h2 = h1;
        w2 = w1 + (4 * c2);
        break;
      case 6:
        w1 += 0.013;
        h1 -= 0.013;
        w2 = w1;
        h2 = h1 + (4.2 * c1);
        break;
      case 7:
        w1 += (c2 + 0.009);
        h1 -= 0.013;
        w2 = w1;
        h2 = h1 + (4.2 * c1);
        break;
      case 8:
        w1 += 2 * c2;
        h1 -= 0.013;
        w2 = w1;
        h2 = h1 + (4.2 * c1);
        break;
      case 9:
        w1 += 2.96 * c2;
        h1 -= 0.013;
        w2 = w1;
        h2 = h1 + (4.2 * c1);
        break;
      case 10:
        w1 += 3.93 * c2;
        h1 -= 0.013;
        w2 = w1;
        h2 = h1 + (4.2 * c1);
        break;

      case 11:
        w2 = w1 + (4 * c2);
        h2 = h1 + (4 * c1);
        break;
      case 12:
        w2 = w1 + (4 * c2);
        h2 = h1;
        h1 += 4 * c1;

        break;
      default:
        break;
    }

    if (pinta) {
      final paint = Paint()
        ..color = myRedLight
        ..strokeWidth = 10;
      canvas.drawLine(Offset(size.width * w1, size.height * h1),
          Offset(size.width * w2, size.height * h2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    throw UnimplementedError();
  }
}

class EachNumber extends StatefulWidget {
  const EachNumber({
    Key? key,
    required this.matrix,
    required this.colorButton,
    required this.index,
    required this.cartonIndex,
    required this.callback,
  }) : super(key: key);

  final List<List> matrix;
  final Function callback;

  final Color colorButton;
  final int index;

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

    return widget.index == 12
        ? Container()
        : ElevatedButton(
            onPressed: () {
              if (widget.index != 12) {
                if (provider.haysorteo) {
                  bool state = !provider
                      .cartones[widget.cartonIndex].pressed[widget.index];

                  if (!provider
                      .pizarra[(numerito(widget.index, widget.matrix)) - 1]) {
                    print('can´t be here');
                  }
                  provider.sendPress(state, widget.cartonIndex, widget.index);

                  if (!provider.estadoLinea) {
                    control = hayLinea(provider.cartones[widget.cartonIndex],
                        provider.pizarra, widget.matrix);
                    if (control > 0) {
                      provider.cantadaLinea(
                          usuario.getUser.uid, control, widget.cartonIndex);
                      widget.callback(control);
                    }
                  }

                  if (!provider.cantaBingoYa && !provider.estadoBingo) {
                    if (hayBingo(provider.cartones[widget.cartonIndex],
                        provider.pizarra, widget.matrix)) {
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
            },
            child:
                StringNumberOrBlank(index: widget.index, matrix: widget.matrix),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(widget.colorButton),
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
  const Xmark(
      {Key? key,
      required this.index,
      required this.cartonIndex,
      required this.colortext})
      : super(key: key);

  final int index;

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
    final provider = Provider.of<Proveedor>(context);

    if (widget.index == 12) {
      visible = false;
    } else {
      visible = provider.cartones[widget.cartonIndex].pressed[widget.index];
    }

    return Visibility(
        visible: visible,
        child: FittedBox(
          child: Opacity(
            opacity: 0.6,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                visible = false;
                bool state = !provider
                    .cartones[widget.cartonIndex].pressed[widget.index];
                provider.sendPress(state, widget.cartonIndex, widget.index);
              },
              icon: const Icon(Icons.brightness_1),
              color: widget.colortext,
              iconSize: 40,
            ),
          ),
        ));
  }
}
