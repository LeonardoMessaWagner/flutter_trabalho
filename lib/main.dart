import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_trabalho/aplicativo.dart';
import 'package:flutter_trabalho/database/casas_store.dart';
import 'package:flutter_trabalho/servicos/auth.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => AuthService()), //provider de autenticação
    ChangeNotifierProvider(
        create: (context) => CasasRepository(
            auth: context.read<AuthService>())), //provider das casas
  ], child: const Aplicativo()
      // ignore: prefer_const_constructors
      ));
}
