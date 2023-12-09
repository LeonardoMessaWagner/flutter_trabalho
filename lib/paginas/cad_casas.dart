import 'package:flutter/material.dart';

class CadCasas extends StatefulWidget {
  const CadCasas({super.key});

  @override
  State<CadCasas> createState() => _CadCasasState();
}

class _CadCasasState extends State<CadCasas> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  bool? _temGaragem = false;
  bool? _temPiscina = false;
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
                decoration: InputDecoration(labelText: 'Número'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o número';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cepController,
                decoration: InputDecoration(labelText: 'CEP'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o CEP';
                  }
                  return null;
                },
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
                title: Text('Tem Piscina'),
                value: _temPiscina,
                onChanged: (bool? value) {
                  setState(() {
                    _temPiscina = value!;
                  });

                  ;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Cadastrar Casa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
