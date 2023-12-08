import 'package:flutter/material.dart';
import 'package:flutter_trabalho/servicos/auth_check.dart';

class Aplicativo extends StatelessWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabalho Disp. Movel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, secondaryHeaderColor: Colors.amber),
      home: const authCheck(),
    );
  }
}
