import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/models/user.dart';
import 'package:vnbingo/utils/colors.dart';

import '../providers/myproveedor.dart';

mostrarSnackBar(String contenido, BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(contenido)));
}

class Toasty extends StatelessWidget {
  const Toasty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final thesocket = Provider.of<Proveedor>(context);
    List<String> ganadores = [];
    String text = '';

    if (!thesocket.notifyBingo) {
      ganadores = thesocket.ganadoresLinea;
      text = 'Cantaron Linea: ';
    } else {
      ganadores = thesocket.ganadoresBingo;
      text = 'Cantaron Bingo: ';
    }

    return Opacity(
      opacity: 0.8,
      child: Container(
          height: 200,
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: mBColor,
          ),
          child: Column(
            children: [
              Text(text),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: ganadores.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(ganadores[index]);
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

bool hayBingo(List<ValueNotifier<bool>> hasBeenPressed) {
  if (linea(hasBeenPressed, 1) &&
      linea(hasBeenPressed, 2) &&
      linea(hasBeenPressed, 3) &&
      linea(hasBeenPressed, 4) &&
      linea(hasBeenPressed, 5)) {
    return true;
  } else {
    return false;
  }
}

int hayLinea(List<ValueNotifier<bool>> hasBeenPressed) {
  if (linea(hasBeenPressed, 1)) return 1;
  if (linea(hasBeenPressed, 2)) return 2;
  if (linea(hasBeenPressed, 3)) return 3;
  if (linea(hasBeenPressed, 4)) return 4;
  if (linea(hasBeenPressed, 5)) return 5;
  if (linea(hasBeenPressed, 6)) return 6;
  if (linea(hasBeenPressed, 7)) return 7;
  if (linea(hasBeenPressed, 8)) return 8;
  if (linea(hasBeenPressed, 9)) return 9;
  if (linea(hasBeenPressed, 10)) return 10;
  if (linea(hasBeenPressed, 11)) return 11;
  if (linea(hasBeenPressed, 12)) return 12;
  return 0;
}

bool linea(List<ValueNotifier<bool>> valueMaster, int caso) {
  int j;
  for (int i = 0; i < 5; i++) {
    switch (caso) {
      case 1:
        j = i;
        break;
      case 2:
        j = i + 5;
        break;

      case 3:
        j = i + 10;
        break;

      case 4:
        j = i + 15;
        break;

      case 5:
        j = i + 20;
        break;

      case 6:
        j = (i * 5);
        break;

      case 7:
        j = (i * 5) + 1;
        break;

      case 8:
        j = (i * 5) + 2;
        break;

      case 9:
        j = (i * 5) + 3;
        break;

      case 10:
        j = (i * 5) + 4;
        break;

      case 11:
        j = (i * 6);
        break;

      case 12:
        j = (i * 4) + 4;
        break;

      default:
        return false;
    }

    if (valueMaster[j].value) {
      if (i == 4) {
        return true;
      } else {
        continue;
      }
    } else {
      return false;
    }
  }

  return false;
}

int numerito(int index, List<List<dynamic>> matrix) {
  if (index < 5) {
    return matrix[index][0];
  } else if (index >= 5 && index < 10) {
    return matrix[index - 5][1];
  } else if (index == 12) {
    return 0;
  } else if (index >= 10 && index < 15) {
    return matrix[index - 10][2];
  } else if (index >= 15 && index < 20) {
    return matrix[index - 15][3];
  } else if (index >= 20 && index < 25) {
    return matrix[index - 20][4];
  } else {
    return 0;
  }
}
