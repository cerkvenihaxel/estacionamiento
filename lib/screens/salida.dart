import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SalidaPage extends StatefulWidget {
  @override
  _SalidaPageState createState() => _SalidaPageState();
}

class _SalidaPageState extends State<SalidaPage> {
  final _formKey = GlobalKey<FormState>();
  late String _patente;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salida del Vehículo'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Patente',
                ),
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _marcarSalida();
                    _calcularTarifa();
                  }
                },
                child: Text('Marcar Salida y Calcular Tarifa'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _marcarSalida() {
    // Aquí puedes realizar las operaciones necesarias para marcar la salida del vehículo
    print('Vehículo con patente $_patente marcado como salida');
  }

  void _calcularTarifa() {
    // Aquí puedes realizar las operaciones necesarias para calcular la tarifa
    // Puedes acceder a la patente ingresada con la variable _patente
    // y realizar cálculos según tus requerimientos
    double tarifa = 10.0; // Ejemplo: tarifa fija de $10
    print('Tarifa calculada: $tarifa');
  }
}
