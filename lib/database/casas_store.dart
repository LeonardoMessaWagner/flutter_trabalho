import 'dart:convert';
import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trabalho/database/db_firebase.dart';
import 'package:flutter_trabalho/http/constantes.dart';
import 'package:flutter_trabalho/servicos/auth.dart';
import 'package:http/http.dart' as http;

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

  saveCasa(String apelido, String Rua, String numero, String CEP, bool garagem,
      bool piscina) async {
    try {
      Uri url = Uri.parse(ApiConstants.baseurl + CEP + ApiConstants.endpoint);

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        if (data['erro'] == true) {
          return false;
        }
        int numeroint = int.parse(numero);

        final docCasa =
            db.collection('usuarios/${auth.usuario!.uid}/minhascasas').doc();

        docCasa.set({
          'id': docCasa.id,
          'rua': Rua,
          'numero': numeroint,
          'Cep': CEP,
          'garagem': garagem,
          'piscina': piscina,
          'apelido': apelido
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
