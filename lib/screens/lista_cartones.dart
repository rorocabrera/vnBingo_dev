import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/providers/myproveedor.dart';
import 'package:vnbingo/screens/carton.dart';
import 'package:vnbingo/utils/colors.dart';
import 'package:vnbingo/utils/utils.dart';
import 'package:vnbingo/widgets/linea_widget.dart';

class ListaCartones extends StatefulWidget {
  const ListaCartones({Key? key}) : super(key: key);

  @override
  State<ListaCartones> createState() => _ListaCartonesState();
}

class _ListaCartonesState extends State<ListaCartones> {
  late FToast fToast = FToast();
  late ConfettiController _confettiController;

  @override
  void initState() {
    fToast.init(context);
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 4));
  }

  _showToast() {
    Widget toast = Toasty();
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 4),
    );
  }

  @override
  void dispose() {
    fToast.removeCustomToast();
    fToast.removeQueuedCustomToasts();
    super.dispose();
    _confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle stilo = GoogleFonts.sigmarOne(
        textStyle: TextStyle(color: myRed, fontSize: 60, height: 2));
    final listProvider = Provider.of<Proveedor>(context);
    int intellindex = 0;
    double devicewidth = MediaQuery.of(context).size.width;

    if (listProvider.notifyLinea) {
      Future.delayed(Duration.zero, () => _showToast());
      Future.delayed(Duration.zero, () => listProvider.setnotifyLinea(false));
    }

    if (listProvider.notifyBingo) {
      Future.delayed(Duration.zero, () => _showToast());
    }

    if (devicewidth < 750) {
      return Expanded(
        child: Stack(
          children: [
            ListView.builder(
              itemCount: listProvider.cartones.length,
              itemBuilder: (context, index) {
                if (listProvider.cartones.isNotEmpty) {
                  return CartonWidget(
                    carton: listProvider.cartones[index],
                    cartonindex: index,
                  );
                } else {
                  return Container();
                }
              },
            ),
            const linea_display(),
            AnimatedOpacity(
              opacity: listProvider.opacityBola,
              duration: Duration(seconds: 1),
              child: IgnorePointer(
                ignoring: true,
                child: Center(
                  child: Text(
                    listProvider.bolaS,
                    style: stilo,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: Stack(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.8,
              ),
              itemCount: listProvider.cartones.length,
              itemBuilder: (BuildContext context, int index) {
                if (listProvider.cartones.isNotEmpty) {
                  return CartonWidget(
                    carton: listProvider.cartones[index],
                    cartonindex: index,
                  );
                } else {
                  return Container();
                }
              },
            ),
            const linea_display(),
            AnimatedOpacity(
              opacity: listProvider.opacityBola,
              duration: Duration(seconds: 1),
              child: IgnorePointer(
                ignoring: true,
                child: Center(
                  child: Text(
                    listProvider.bolaS,
                    style: stilo,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
