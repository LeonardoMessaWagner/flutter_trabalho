import 'package:flutter/material.dart';
import 'package:flutter_trabalho/aplicativo.dart';
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

    String texto = "Bem-vindo $email";
    String selectedPage = '';

    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
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
            // ListTile(
            //   leading: const Icon(Icons.message),
            //   title: const Text('Messages'),
            //   onTap: () {
            //     setState(() {
            //       selectedPage = 'Messages';
            //     });
            //   },
            // ),

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
