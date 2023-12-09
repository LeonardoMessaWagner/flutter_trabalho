import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trabalho/database/db_firebase.dart';
import 'package:flutter_trabalho/servicos/auth.dart';

class CasasRepository extends ChangeNotifier {
  late FirebaseFirestore db;
  late AuthService auth;

  CasasRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  saveCasa(String Rua, int numero, String CEP, bool garagem, bool piscina) {}
}
