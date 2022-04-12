import 'package:flutter/cupertino.dart';
import 'package:vnbingo/models/user.dart';
import 'package:vnbingo/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<User?> refreshUser() async {
    User? user = await _authMethods.getUsDetails();
    _user = user;

    notifyListeners();
    return user;
  }

  void setUser(user) {
    _user = user;
  }
}
