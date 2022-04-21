import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as dale;

import 'package:vnbingo/providers/proveecartones.dart';

class Proveedor with ChangeNotifier {
  bool _stoplinea = false;
  bool _stopbingo = false;
  bool _cantaLineaYa = false;
  bool _cantaBingoYa = false;
  bool _ganeLinea = false;
  double _volume = 0.1;
  bool _soundRequest = false;
  int _bolita = 0;
  String _bolaS = ' ';
  int _stateServer = -1;
  bool _haysorteo = false;
  List<bool> _pizarra = [];
  bool _estadoLinea = false;
  bool _estadoBingo = false;
  List<String> ganadoresLinea = [];
  List<String> ganadoresBingo = [];
  bool _notifyLinea = false;
  bool _notifyBingo = false;
  int _pedido = 0;
  int _recibido = 0;
  Duration _proxSorteo = Duration(hours: 0, minutes: 0, seconds: 0);
  String _uid = ' ';
  String _email = ' ';
  Carton _Carton = Carton(b: [0], i: [0], n: [0], g: [0], o: [0], pressed: []);
  double _opacityBola = 0;
  int _nCartonesv = 0;

  List<Carton> _cartones = [];

  // online server  https://vnbingo.herokuapp.com/

  // local server 127.0.0.1:5050

  dale.Socket socket = dale.io(
      'https://vnbingo.herokuapp.com/',
      dale.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());

  // dale.Socket socket = dale.io(
  //     'http://127.0.0.1:5050',
  //     dale.OptionBuilder()
  //         .setTransports(['websocket'])
  //         .disableAutoConnect()
  //         .build());

  void conexion(uid, email) {
    socket.connect();
    // registrar(uid, email);

    socket.onReconnect((data) => print('recontecto!'));

    socket.onDisconnect((_) => {desconexion()});

    socket.on('bolita', (data) => fbolita(data));

    socket.on('nextRun', (data) => nextRun(data));

    socket.on('state', (data) => prestado(data));

    socket.on('cantaron linea', (data) => cantaronlinea(data));

    socket.on('cantaron bingo', (data) => cantaronbingo(data));

    socket.on('stop linea', (data) => stoplinea(data));

    socket.on('stop bingo', (data) => stopbingo(data));

    socket.on('jugada', (data) => restablecejugada(data));

    socket.on('cartones vendidos', (data) => updateCartonesVendidos(data));

    socket.onConnect((data) => {registrar(uid, email)});
  }

  void updateCartonesVendidos(data) {
    _nCartonesv = data;
    notifyListeners();
  }

  void registrar(uid, email) {
    print('se llamo a conexion con $uid .  $email');
    _uid = uid;
    var Map = {'uid': uid, 'email': email};
    var jsonMap = jsonEncode(Map);
    print('se emite registrar con $uid .  $email');
    socket.emit('registrar', jsonMap);
  }

  void disconnect() {
    socket.close();
  }

  bool socketStatus() {
    return socket.connected;
  }

  void restablecejugada(data) {
    var hello = jsonDecode(data['jugada']['seCantol'].toString());
    _estadoLinea = hello;
    _cantaLineaYa = hello;
    var jugada = List<int>.from(data['jugada']['jugada'].map((x) => x));
    if (_cartones.length == 0) {
      var cartones = List<dynamic>.from((data['cartones'].map((x) => x)));
      for (var e in cartones) {
        recibeCarton(e);
      }
    }

    for (var element in jugada) {
      _pizarra[element - 1] = true;
    }
    notifyListeners();
  }

  void stoplinea(data) {
    _stoplinea = true;
  }

  void stopbingo(data) {
    _stopbingo = true;
  }

//Manejo del ****************ESTADO DEL SERVIDOR***********************
  void desconexion() {
    _stateServer = -1;
    _cartones = [];
    print('disconected');
    notifyListeners();
  }

  void hayCom() {
    _stateServer = 0;
    notifyListeners();
  }

  void prestado(data) {
    hayCom();
    estado(data);
  }

  void estado(data) {
    if (!data) {
      _bolita = 0;
      _bolaS = ' ';
      _cartones = [];
      _estadoLinea = false;
      _estadoBingo = false;
      _cantaLineaYa = false;
      _cantaBingoYa = false;
      _notifyLinea = false;
      _notifyBingo = false;

      _stoplinea = false;
      _stopbingo = false;
      _opacityBola = 0;
      ganadoresLinea = [];
      ganadoresBingo = [];
      initializePizzara();
    }

    _haysorteo = data;
    notifyListeners();
  }

  void nextRun(data) {
    hayCom();
    _proxSorteo = Duration(milliseconds: data);
    notifyListeners();
  }

  // ********************Manejo de la COMPRA DE CARTONES****************

  void compraCarton() {
    socket.emit('compra carton', _uid);
    socket.once('venta carton', (data) => recibeCarton(data));
    print('se emite comprar carton');
  }

  void recibeCarton(data) {
    print('se recibe un carton');
    _Carton = Carton.fromJson(data);
    if (jsonDecode(data['ganaL'].toString())) {
      _ganeLinea = true;
    }
    print(_Carton.toJson());
    _cartones.add(_Carton);
    notifyListeners();
  }

//Funcion de   ******************RECIBIR NUMEROS DEL SORTEO******************

  void fbolita(data) {
    if (!_stoplinea) {
      if (!_estadoBingo) {
        efectivebolita(data);
      }
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        efectivebolita(data);
        _stoplinea = false;
      });
    }
  }

  void efectivebolita(data) {
    _opacityBola = 1;
    _soundRequest = true;
    _bolita = data;
    _haysorteo = true;
    _bolaS = data.toString();
    _pizarra[data - 1] = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 1), () {
      _opacityBola = 0;
      notifyListeners();
    });
  }

  void sendPress(bool Value, int cartonIndex, int numeroIndex) {
    _cartones[cartonIndex].pressed[numeroIndex] = Value;
    notifyListeners();
    Map<String, dynamic> datos = {
      "uid": _uid,
      "value": Value,
      "cartonIndex": cartonIndex.toString(),
      "numeroIndex": numeroIndex.toString()
    };
    var jsonMap = jsonEncode(datos);
    socket.emit('jugada', jsonMap);
  }

  // Manejo de   *********************JUGADA DE LINEA************************

  void setestadoLinea() {
    _estadoLinea = true;
    notifyListeners();
  }

  void setnotifyLinea(bool state) {
    _notifyLinea = state;

    notifyListeners();
  }

  void cantaronlinea(data) {
    if (_haysorteo) {
      _cantaLineaYa = false;
      var jsonlist = data as List;
      for (var e in jsonlist) {
        ganadoresLinea.add(e);
      }
      setestadoLinea();
      setnotifyLinea(true);
    }
  }

  void cantadaLinea(user, nlinea, ncarton) {
    _opacityBola = 0;
    _cantaLineaYa = true;
    notifyListeners();
    Map<String, dynamic> datos = {
      'uid': uid,
      'nlinea': nlinea,
      'ncarton': ncarton
    };
    socket.emit('linea', jsonEncode(datos));
    print(jsonEncode(datos));
  }

  //Manejo de ************************JUGADA DE BINGO************************

  void cantadaBingo(user, ncarton) {
    _cantaBingoYa = true;
    notifyListeners();
    Map<String, dynamic> datos = {'uid': user, 'ncarton': ncarton};
    socket.emit('bingo', jsonEncode(datos));
  }

  void setnotifyBingo(bool state) {
    _cantaBingoYa = state;
    _notifyBingo = state;
    notifyListeners();
  }

  void cantaronbingo(data) {
    print('se canto bingo');
    _estadoBingo = true;
    var jsonlist = data as List;

    for (var e in jsonlist) {
      ganadoresBingo.add(e);
    }
    setnotifyBingo(true);
  }

// *****************************GETTERS*********************************

  bool get cantaLineaYa {
    return _cantaLineaYa;
  }

  bool get cantaBingoYa {
    return _cantaBingoYa;
  }

  String get uid {
    return _uid;
  }

  bool get soundRequest {
    return _soundRequest;
  }

  int get stateServer {
    return _stateServer;
  }

  int get nCartonesv {
    return _nCartonesv;
  }

  String get bolaS {
    return _bolaS;
  }

  int get bolita {
    return _bolita;
  }

  bool get ganeLinea {
    return _ganeLinea;
  }

  bool get estadoLinea {
    return _estadoLinea;
  }

  bool get estadoBingo {
    return _estadoBingo;
  }

  bool get notifyLinea {
    return _notifyLinea;
  }

  bool get notifyBingo {
    return _notifyBingo;
  }

  bool get haysorteo {
    return _haysorteo;
  }

  double get opacityBola {
    return _opacityBola;
  }

  double get volume {
    return _volume;
  }

  List<Carton> get cartones {
    return _cartones;
  }

  List<bool> get pizarra {
    return _pizarra;
  }

  String get proxSorteo {
    return format(_proxSorteo);
  }

  String format(Duration d) {
    return d.toString().split('.').first.padLeft(8, "0");
  }

  String get email {
    return _email;
  }

//  *************************SETTERS***************************

  void setvolume(double vol) {
    _volume = vol;
    notifyListeners();
  }

  void setsoundRequest(bool state) {
    _soundRequest = state;
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  // ******************************INITIALIZE FUNCTIONS************************

  void initializePizzara() {
    if (_pizarra.length == 0) {
      for (int i = 0; i < 75; i++) {
        _pizarra.add(false);
      }
    } else {
      for (int i = 0; i < 75; i++) {
        _pizarra[i] = false;
      }
    }
  }
}
