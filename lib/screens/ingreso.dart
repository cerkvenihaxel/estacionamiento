import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IngresoPage extends StatefulWidget {
  const IngresoPage({Key? key}) : super(key: key);

  @override
  State<IngresoPage> createState() => _IngresoPageState();
}

class _IngresoPageState extends State<IngresoPage> {
  final _formKey = GlobalKey<FormState>();
  late String _patente;
  late TimeOfDay _horaIngreso;

  @override
  void initState() {
    super.initState();
    _patente = '';
    _horaIngreso = TimeOfDay.now();
  }

  void _guardarIngreso() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Número de patente: $_patente');
      print('Hora de ingreso: $_horaIngreso');

      final horaIngresoString =
          _horaIngreso.format(context); // Convertir TimeOfDay a cadena legible

      context.go('/listado/$_patente/$horaIngresoString');
      // Navegar a la pantalla de listado y pasar los datos guardados como parámetros
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingreso'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Patente'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa la patente';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patente = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _guardarIngreso,
                child: const Text('Guardar Ingreso'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
