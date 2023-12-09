import 'package:flutter/material.dart';
import 'package:flutter_trabalho/database/casas_store.dart';
import 'package:provider/provider.dart';

class CadCasas extends StatefulWidget {
  const CadCasas({super.key});

  @override
  State<CadCasas> createState() => _CadCasasState();
}

class _CadCasasState extends State<CadCasas> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _apelidoController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  bool? _temGaragem = false;
  bool? _temPiscina = false;

  Future<void> _alertaPositivo() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tudo certo'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Casa cadastrada!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _alertaNegativo() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Algo errado'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Verifique os dados inseridos!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  salvar() async {
    bool resposta = await context.read<CasasRepository>().saveCasa(
        _apelidoController.text,
        _ruaController.text,
        _numeroController.text,
        _cepController.text,
        _temGaragem!,
        _temPiscina!);
    if (resposta == true) {
      _alertaPositivo();
    } else {
      _alertaNegativo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Casas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _apelidoController,
                decoration: const InputDecoration(labelText: 'Apelido da Casa'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o apelido da casa';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ruaController,
                decoration: InputDecoration(labelText: 'Rua'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira a rua';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numeroController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Número'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um número valido';
                  } else {}
                  return null;
                },
              ),
              TextFormField(
                controller: _cepController,
                decoration: const InputDecoration(labelText: 'CEP'),
              ),
              CheckboxListTile(
                title: const Text('Tem Garagem'),
                value: _temGaragem,
                onChanged: (bool? value) {
                  setState(() {
                    _temGaragem = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Tem Piscina'),
                value: _temPiscina,
                onChanged: (bool? value) {
                  setState(() {
                    _temPiscina = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  salvar();
                },
                child: Text('Cadastrar Casa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
