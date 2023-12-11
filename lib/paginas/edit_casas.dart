import 'package:flutter/material.dart';
import 'package:flutter_trabalho/database/casas_store.dart';
import 'package:provider/provider.dart';

class EditCasasPage extends StatefulWidget {
  const EditCasasPage(casaId, {super.key});

  @override
  State<EditCasasPage> createState() => _EditCasasPageState();
}

class _EditCasasPageState extends State<EditCasasPage> {
  final TextEditingController _apelidoController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  bool? _temGaragem = false;
  bool? _temPiscina = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Casa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                onPressed: () async {
                  await context.read<CasasRepository>().editCasa(
                      casaId,
                      _apelidoController.text,
                      _ruaController.text,
                      _numeroController.text,
                      _cepController.text,
                      _temGaragem!,
                      _temPiscina!);
                },
                child: const Text('Editar Casa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
