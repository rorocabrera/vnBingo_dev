import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String email;
  final double saldo = 0;
  final String cartera = ' ';
  final String nombre;

  const User(
      {required this.email,
      required this.uid,
      required this.nombre,
      saldo = 0,
      cartera = ''});

  Map<String, dynamic> toJson() => {
        "email": email,
        "nombre": nombre,
        "uid": uid,
        "saldo": saldo,
        "cartera": cartera,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
      nombre: snapshot['nombre'],
    );
  }
}

class Ganadores {
  Ganadores({
    required this.user,
    required this.uid,
    required this.email,
  });
  late final String user;
  late final String uid;
  late final String email;

  Ganadores.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    uid = json['uid'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user;
    _data['uid'] = uid;
    _data['email'] = email;
    return _data;
  }

  String returnUser() {
    return user;
  }
}
