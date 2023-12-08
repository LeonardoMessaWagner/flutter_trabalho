// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_trabalho/paginas/home.dart';
import 'package:flutter_trabalho/paginas/login_cad.dart';
import 'package:flutter_trabalho/servicos/auth.dart';
import 'package:provider/provider.dart';

class authCheck extends StatefulWidget {
  const authCheck({super.key});

  @override
  State<authCheck> createState() => _authCheckState();
}

class _authCheckState extends State<authCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const Login_cad();
    } else {
      return const Home();
    }
  }

  loading() {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
