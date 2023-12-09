import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

late AuthService auth;

class _HomeState extends State<Home> {
  late AuthService authService;
  late User? usuario;

  @override
  void initState() {
    super.initState();
    authService = Provider.of<AuthService>(context, listen: false);
    usuario = authService.usuario;
  }

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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('usuarios/${usuario?.uid}/minhascasas')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar os dados'));
          }

          // Lista de documentos
          List<DocumentSnapshot> casas = snapshot.data!.docs;

          return ListView.builder(
            itemCount: casas.length,
            itemBuilder: (context, index) {
              var casa = casas[index];
              return ListTile(
                title: Text(casa['apelido']),
                subtitle: Text('CEP: ${casa['Cep']}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Exclui o documento do Firebase Firestore
                    FirebaseFirestore.instance
                        .collection('usuarios/${usuario?.uid}/minhascasas')
                        .doc(casa.id)
                        .delete()
                        .then((value) {
                      // Ação após a exclusão (opcional)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Casa excluída com sucesso')),
                      );
                    }).catchError((error) {
                      // Caso ocorra um erro na exclusão
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erro ao excluir a casa')),
                      );
                    });
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
