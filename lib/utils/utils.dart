import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/models/user.dart';
import 'package:vnbingo/providers/proveecartones.dart';
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

bool hayBingo(Carton carton, List<bool> pizarra, List<List> matrix) {
  if (linea(carton, 1, pizarra, matrix) &&
      linea(carton, 2, pizarra, matrix) &&
      linea(carton, 3, pizarra, matrix) &&
      linea(carton, 4, pizarra, matrix) &&
      linea(carton, 5, pizarra, matrix)) {
    return true;
  } else {
    return false;
  }
}

int hayLinea(Carton carton, List<bool> pizarra, List<List> matrix) {
  if (linea(carton, 1, pizarra, matrix)) return 1;
  if (linea(carton, 2, pizarra, matrix)) return 2;
  if (linea(carton, 3, pizarra, matrix)) return 3;
  if (linea(carton, 4, pizarra, matrix)) return 4;
  if (linea(carton, 5, pizarra, matrix)) return 5;
  if (linea(carton, 6, pizarra, matrix)) return 6;
  if (linea(carton, 7, pizarra, matrix)) return 7;
  if (linea(carton, 8, pizarra, matrix)) return 8;
  if (linea(carton, 9, pizarra, matrix)) return 9;
  if (linea(carton, 10, pizarra, matrix)) return 10;
  if (linea(carton, 11, pizarra, matrix)) return 11;
  if (linea(carton, 12, pizarra, matrix)) return 12;
  return 0;
}

bool linea(Carton carton, int caso, List<bool> pizarra, List<List> matrix) {
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
    if (j == 12) {
      continue;
    } else {
      if (carton.pressed[j] && pizarra[numerito(j, matrix) - 1]) {
        if (i == 4) {
          return true;
        } else {
          continue;
        }
      } else {
        return false;
      }
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
