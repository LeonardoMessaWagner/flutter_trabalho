import 'package:flutter/material.dart';

class Login_cad extends StatefulWidget {
  const Login_cad({super.key});

  @override
  State<Login_cad> createState() => _Login_cadState();
}

class _Login_cadState extends State<Login_cad> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;

  late String titulo;
  late String botao;
  late String textBelowBotao;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool decisao) {
    setState(() {
      isLogin = decisao;
      if (isLogin) {
        titulo = "Acesso ao Sistema";
        botao = "Entrar";
        textBelowBotao = "Sem cadastro? Cadastre-se!";
      } else {
        titulo = "Registro no Sistema";
        botao = "Registrar";
        textBelowBotao = "Retornar e acessar o sistema?";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Form(
            key: formKey,
            // ignore: prefer_const_constructors
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
