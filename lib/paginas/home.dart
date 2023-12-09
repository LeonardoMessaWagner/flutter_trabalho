import 'package:flutter/material.dart';
import 'package:flutter_trabalho/paginas/appbar.dart';
import 'package:flutter_trabalho/paginas/cad_casas.dart';
import 'package:flutter_trabalho/servicos/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    String? email = usuario?.email;

    return Scaffold(
      appBar: CustomAppBar(title: "Olá, $email"),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu de Opções',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.house),
              title: const Text('Cadastrar Casas'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CadCasas()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () => context.read<AuthService>().logout(),
            ),
          ],
        ),
      ),
    );
  }
}
