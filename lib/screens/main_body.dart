import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/providers/myproveedor.dart';
import 'package:vnbingo/screens/lista_cartones.dart';
import 'package:vnbingo/utils/colors.dart';

class MainBody extends StatefulWidget {
  MainBody({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  State<MainBody> createState() => _mainBodyState();
}

class _mainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    final mbodyProvider = Provider.of<Proveedor>(context);

    if (mbodyProvider.stateServer == 0) {
      if (!mbodyProvider.haysorteo) {
        if (mbodyProvider.cartones.length == 0) {
          return ProxSorteo(
            mbodyProvider: mbodyProvider,
            height: widget.height * 1.2,
          );
        } else {
          return Expanded(
              child: Column(
            children: [
              ListaCartones(),
              ProxSorteo(
                mbodyProvider: mbodyProvider,
                height: widget.height,
              ),
            ],
          ));
        }
      } else {
        if (mbodyProvider.cartones.length > 0) {
          return const ListaCartones();
        } else {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 40.0,
                    child: Text(
                      "Sorteo en curso",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  CircularProgressIndicator(color: myBlue),
                ],
              ),
            ),
          );
        }
      }
    } else if (mbodyProvider.stateServer == -1) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 40.0,
                child: Text(
                  "Conectándose al Servidor",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              CircularProgressIndicator(
                color: myBlue,
              ),
            ],
          ),
        ),
      );
    } else if (mbodyProvider.stateServer == -2) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 40.0,
                child: Text(
                  "Esperando información del servidor",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    } else {
      return const Expanded(
          child: Center(
        child: Text('Error desconocido'),
      ));
    }
  }
}

class ProxSorteo extends StatelessWidget {
  const ProxSorteo({
    Key? key,
    required this.mbodyProvider,
    required this.height,
  }) : super(key: key);

  final Proveedor mbodyProvider;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height,
            child: Text(
              "Próximo Sorteo en:",
              style: TextStyle(fontSize: 20),
            ),
          ),
          FittedBox(
            child: Text(
              mbodyProvider.proxSorteo,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
