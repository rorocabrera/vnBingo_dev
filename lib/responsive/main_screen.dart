import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/models/user.dart' as model;
import 'package:vnbingo/providers/myproveedor.dart';
import 'package:vnbingo/providers/user_provider.dart';
import 'package:vnbingo/resources/auth_methods.dart';
import 'package:vnbingo/screens/login_screen.dart';
import 'package:vnbingo/screens/navegacion_izquierda.dart';
import 'package:vnbingo/utils/colors.dart';
import 'package:vnbingo/utils/player.dart';
import 'package:vnbingo/screens/main_body.dart';

import '../screens/comprar_cartones.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen>
    with TickerProviderStateMixin {
  String _username = '';
  int saldo = 0;
  String uid = '';
  String email = ' ';
  late AnimationController _controller;
  late Animation<Color?> _color;
  Color colorInicio = mBColor;
  Color colorFin = myPurple;
  String route = 'assets/vnbingo_logo_2.svg';
  late final Reproductor _reproductor;
  final AuthMethods _authMethods = AuthMethods();
  late Future<model.User?> _elFuturo;
  late model.User? _usuario;
  bool firstpass = false;

  @override
  void initState() {
    super.initState();

    addData();
    Provider.of<Proveedor>(context, listen: false).initializePizzara();
    _reproductor = Reproductor();
    _reproductor.setVolume(0.5);
    print('se inicia mobile screen');
    _controller = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _color = ColorTween(begin: colorInicio, end: colorFin).animate(_controller
      ..addListener(() {
        setState(() {});
      }));
  }

  addData() async {
    _elFuturo = _authMethods.getUsDetails();
  }

  changeColor() {
    _color = ColorTween(begin: colorInicio, end: colorFin).animate(_controller
      ..addListener(() {
        setState(() {});
      }));
  }

  @override
  void dispose() {
    _controller.dispose();
    _reproductor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final thesocket = Provider.of<Proveedor>(context);
    final _user = Provider.of<UserProvider>(context);

    double devicewidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;
    bool comprar = !thesocket.haysorteo && thesocket.stateServer != -1;

    bool controlWidth = devicewidth < 750;
    double passHeight = deviceheight * 0.06;
    double maxWidth = 0;
    double minWidth = 0;
    if (devicewidth < 750) {
      maxWidth = 450;
      minWidth = 350;
    } else {
      maxWidth = devicewidth;
      minWidth = 450;
    }

    if (!thesocket.haysorteo) {
      colorInicio = mBColor;
      colorFin = myPurple;
      route = 'assets/vnbingo_logo_2.svg';
      changeColor();
      _controller.reverse();
    }

    if (thesocket.haysorteo) {
      _controller..repeat();
      route = 'assets/vnbingo_logo_1.svg';
    }

    if (thesocket.estadoLinea) {
      colorFin = myRedLight;
      route = 'assets/vnbingo_logo_2.svg';
      changeColor();
    }

    if (thesocket.bolaS != ' ' && thesocket.soundRequest) {
      _reproductor.playSound(thesocket.bolaS);
      thesocket.setsoundRequest(false);
    }

    _reproductor.setVolume(thesocket.volume);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: _color.value,
          title: Row(
            children: [
              const Spacer(),
              SvgPicture.asset(
                route,
                height: 60,
              ),
              Expanded(
                child: Container(
                  child: firstpass
                      ? Text(_username,
                          style:
                              const TextStyle(fontSize: 12.0, color: priColor))
                      : FutureBuilder<model.User?>(
                          future: _elFuturo,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                print('I am waiting for your love');
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.done:
                              default:
                                if (snapshot.hasData) {
                                  firstpass = true;
                                  _user.setUser(snapshot.requireData);
                                  _username = _user.getUser.email;
                                  thesocket.conexion(
                                      _user.getUser.uid, _user.getUser.email);
                                  return _user == null
                                      ? Text('Error')
                                      : Text(_username,
                                          style: const TextStyle(
                                              fontSize: 12.0, color: priColor));
                                } else
                                  return Text('error');
                            }
                          }),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                color: priColor,
                onPressed: () async {
                  thesocket.disconnect();
                  thesocket.estado(false);
                  await AuthMethods().signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        drawer: controlWidth ? const NavegacionIzquierda() : null,
        body: Row(children: [
          if (!controlWidth) SizedBox(width: 200, child: NavegacionIzquierda()),
          Flexible(
            flex: 5,
            child: Main_Body_Center(
              maxWidth: maxWidth,
              minWidth: minWidth,
              passHeight: passHeight,
              saldo: saldo,
              comprar: comprar,
              nCartonesv: thesocket.nCartonesv,
            ),
          )
        ]));
  }
}

class Main_Body_Center extends StatelessWidget {
  const Main_Body_Center({
    Key? key,
    required this.maxWidth,
    required this.minWidth,
    required this.passHeight,
    required this.saldo,
    required this.comprar,
    required this.nCartonesv,
  }) : super(key: key);

  final double maxWidth;
  final double minWidth;
  final double passHeight;
  final int saldo;
  final bool comprar;
  final nCartonesv;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth, minWidth: minWidth),
            child: Column(children: [
              Container(
                  width: double.infinity,
                  height: passHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Saldo:  $saldo '),
                      SizedBox(
                        width: 40,
                      ),
                      Text('Cartones vendidos:  $nCartonesv ')
                    ],
                  )),
              MainBody(height: passHeight),
              if (comprar)
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: myBlue),
                    child: Text('Comprar Cartones'),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const ComprarCartones());
                    },
                  ),
                ),
            ])));
  }
}
