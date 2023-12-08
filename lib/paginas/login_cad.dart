// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_trabalho/servicos/auth.dart';
import 'package:provider/provider.dart';

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

  bool loading = false;

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

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Informe um email válido";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: senha,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe sua senha';
                        } else if (value.length < 8) {
                          return 'A senha deve ter no minimo 8 caracteres';
                        }
                        return null;
                      },
                    )),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isLogin) {
                          login();
                        } else {
                          registrar();
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (loading)
                          ? [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                      color: Colors.white),
                                ),
                              )
                            ]
                          : [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  botao,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Icon(Icons.check),
                            ],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () => {setFormAction(!isLogin)},
                    child: Text(textBelowBotao)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
