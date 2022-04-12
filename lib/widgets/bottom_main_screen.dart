import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/providers/myproveedor.dart';
import 'package:vnbingo/screens/comprar_cartones.dart';
import 'package:vnbingo/utils/colors.dart';
import 'package:vnbingo/widgets/display_bolitas.dart';

class Bottom_Main_Screen extends StatefulWidget {
  const Bottom_Main_Screen({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  State<Bottom_Main_Screen> createState() => _Bottom_Main_Screen();
}

class _Bottom_Main_Screen extends State<Bottom_Main_Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final thesocket = Provider.of<Proveedor>(context);

    if (thesocket.haysorteo) {
      return display_bolitas_and_sound(bolaS: thesocket.bolaS);
    } else {
      return Container(
          height: widget.height,
          width: double.infinity,
          child: thesocket.stateServer == -1
              ? Container()
              : Center(
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: myBlue),
                  child: Text('Comprar Cartones'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const ComprarCartones());
                  },
                )));
    }
  }
}
