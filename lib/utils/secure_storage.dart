import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();
  static const _keyHasBeenList = 'HasBeenList';
  static const _errorFree = 'ErrorFreeList';

  static Future setHasBeenPressed(
      List<ValueNotifier<bool>> hasBeenPressed) async {
    List<bool> hasBeenValued = [];

    for (var e in hasBeenPressed) {
      hasBeenValued.add(e.value);
    }

    List<String> hasBeenStringed =
        hasBeenValued.map((i) => i.toString()).toList();

    await _storage.write(
        key: _keyHasBeenList, value: json.encode(hasBeenStringed));
  }

  static Future<List<ValueNotifier<bool>>?> getHasBeenPressed() async {
    String? read = await _storage.read(key: _keyHasBeenList);
  }

  static Future setErrorFree(List<ValueNotifier<bool>> errorFree) async {
    List<bool> isErrorValued = [];

    for (var e in errorFree) {
      isErrorValued.add(e.value);
    }

    List<String> errorFreeStringed =
        isErrorValued.map((i) => i.toString()).toList();
    await _storage.write(
        key: _errorFree, value: json.encode(errorFreeStringed));
  }

  static Future<List<ValueNotifier<bool>>?> getErrorFree() async {
    List<ValueNotifier<bool>>? theReturn = [];
    String? read = await _storage.read(key: _errorFree);
    List<bool>? readListed = read == null
        ? null
        : List<bool>.of(
            json.decode(read).map((x) => x)); //No se como probar esto?
    if (readListed != null) {
      for (var e in readListed) {
        theReturn.add(ValueNotifier(e));
      }
    }
  }
}
