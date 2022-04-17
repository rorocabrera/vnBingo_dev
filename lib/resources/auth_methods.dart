import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vnbingo/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User?> getUsDetails() async {
    final docUser =
        _firestore.collection('usuarios').doc(_auth.currentUser!.uid);

    final snapshot = await docUser.get();

    if (snapshot.exists) {
      print('from auth_methods:');
      print(snapshot.data());
      return model.User.fromSnap(snapshot);
    }
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String password2,
    required double saldo,
    required String cartera,
  }) async {
    String res = 'Hubo un problema con el registro';
    try {
      if (email.isNotEmpty || password.isNotEmpty || password2.isNotEmpty) {
        if (password == password2) {
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);

          model.User user = model.User(
            uid: cred.user!.uid,
            email: email,
            saldo: saldo,
            cartera: cartera,
          );
          await _firestore
              .collection('usuarios')
              .doc(cred.user!.uid)
              .set(user.toJson());
          res = 'Usuario registrado satisfactoriamente';
        } else {
          res = 'Las claves no coinciden';
        }
      }
    } on FirebaseException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'Email incorrecto';
      }
      if (err.code == 'weak-password') {
        res = 'Su clave debe contener al menos 6 caracteres';
      }
      if (err.code == 'email-already-in-use') {
        res = 'Email ya se encuentra registrado';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String res = 'Error';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'Exito';
      } else {
        res = 'Por favor introduzca todos los datos';
      }
    } on FirebaseException catch (err) {
      if (err.code == 'user-not-found' && res != 'Exito') {
        res = 'Usuario no registrado';
      }
      if (err.code == 'wrong-password') {
        res = 'Contraseña incorrecta';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
