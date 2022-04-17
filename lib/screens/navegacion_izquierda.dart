import 'package:flutter/material.dart';
import 'package:vnbingo/providers/myproveedor.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/utils/colors.dart';

class NavegacionIzquierda extends StatefulWidget {
  const NavegacionIzquierda({Key? key}) : super(key: key);

  @override
  State<NavegacionIzquierda> createState() => _NavegacionIzquierdaState();
}

class _NavegacionIzquierdaState extends State<NavegacionIzquierda> {
  @override
  IconData icono = Icons.volume_down;
  Color colorIcono = Color.fromARGB(255, 177, 177, 177);

  @override
  Widget build(BuildContext context) {
    final thesocket = Provider.of<Proveedor>(context);
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    bool controlWidth = devicewidth < 750;
    double aspectratio = deviceheight / devicewidth;
    double vol = thesocket.volume;

    return Container(
      width: controlWidth ? 200 : double.infinity,
      child: Drawer(
        child: SingleChildScrollView(
          primary: false,
          child: Column(children: [
            SizedBox(
              height: controlWidth ? deviceheight * 0.07 : 0,
            ),
            Container(
              width: 200,
              padding: EdgeInsets.all(5.0),
              child: SizedBox(
                height: 400,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 15,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: thesocket.pizarra.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (NumerosBoard(index: index));
                  },
                ),
              ),
            ),
            Row(children: [
              Icon(
                icono,
                color: colorIcono,
              ),
              Flexible(
                child: Slider(
                    activeColor: myBlue,
                    value: vol,
                    onChanged: (value) {
                      thesocket.setvolume(value);
                      setState(() {
                        if (value == 0) {
                          icono = Icons.volume_mute;
                          colorIcono = Color.fromARGB(45, 153, 153, 153);
                        }
                        if (value > 0 && value < 0.8) {
                          icono = Icons.volume_down;
                          colorIcono = Color.fromARGB(255, 177, 177, 177);
                        }
                        if (value > 0.8) {
                          icono = Icons.volume_up;
                          colorIcono = Colors.white;
                        }
                      });

                      vol = value;
                    }),
              )
            ])
          ]),
        ),
      ),
    );
  }
}

class NumerosBoard extends StatefulWidget {
  const NumerosBoard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<NumerosBoard> createState() => _NumerosBoardState();
}

class _NumerosBoardState extends State<NumerosBoard> {
  Color color = Colors.black45;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Prov = Provider.of<Proveedor>(context);
    if (Prov.pizarra[widget.index]) {
      color = Colors.white;
    } else {
      color = Colors.black45;
    }

    return FittedBox(
      child: Text(
        '${widget.index + 1} ',
        style: TextStyle(fontSize: 12, height: 1.2, color: color),
      ),
    );
  }
}
