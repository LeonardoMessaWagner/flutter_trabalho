import 'package:flutter/material.dart';
import 'package:flutter_trabalho/database/casas_store.dart';
import 'package:provider/provider.dart';

class EditCasasPage extends StatefulWidget {
  final String casaId;
  final bool gar;
  final bool pis;

  const EditCasasPage({
    Key? key,
    required this.casaId,
    required this.pis,
    required this.gar,
  }) : super(key: key);

  @override
  State<EditCasasPage> createState() => _EditCasasPageState();
}

class _EditCasasPageState extends State<EditCasasPage> {
  final TextEditingController _newapelidoController = TextEditingController();
  final TextEditingController _newruaController = TextEditingController();
  final TextEditingController _newnumeroController = TextEditingController();
  final TextEditingController _newcepController = TextEditingController();

  bool? _newtemGaragem;
  bool? _newtemPiscina;

  @override
  void initState() {
    super.initState();
    _newtemGaragem = widget.gar;
    _newtemPiscina = widget.pis;
  }

  editar() async {
    String resultado = await context.read<CasasRepository>().editCasa(
        widget.casaId,
        _newapelidoController.text,
        _newruaController.text,
        _newnumeroController.text,
        _newcepController.text,
        _newtemGaragem!,
        _newtemPiscina!);

    if (resultado == 'erro-cep') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Ocorreu um erro ao validar o CEP, os demais dados foram atualizados.'),
        ),
      );
    } else if (resultado == 'fim') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Dados atualizados!'),
        ),
      );
    }
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edição de casas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _newapelidoController,
                decoration: const InputDecoration(labelText: 'Apelido da Casa'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o apelido da casa';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newruaController,
                decoration: InputDecoration(labelText: 'Rua'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira a rua';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newnumeroController,
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
                controller: _newcepController,
                decoration: const InputDecoration(labelText: 'CEP'),
              ),
              CheckboxListTile(
                title: const Text('Tem Garagem'),
                value: _newtemGaragem,
                onChanged: (bool? value) {
                  setState(() {
                    _newtemGaragem = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Tem Piscina'),
                value: _newtemPiscina,
                onChanged: (bool? value) {
                  setState(() {
                    _newtemPiscina = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  editar();
                },
                child: Text('Editar Casa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
