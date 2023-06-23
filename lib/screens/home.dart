import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String currentTime;

  @override
  void initState() {
    super.initState();
    currentTime = _getCurrentTime();
    _updateTime();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final formatter = DateFormat('HH:mm:ss');
    return formatter.format(now);
  }

  void _updateTime() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        currentTime = _getCurrentTime();
        _updateTime();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Estacionamiento App',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/parking.png', // Ruta de la imagen
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    currentTime,
                    style: const TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/ingreso');
                      // Lógica para el botón de "Ingreso"
                    },
                    child: const Text('Ingreso'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/salida');
                      // Lógica para el botón de "Salida"
                    },
                    child: const Text('Salida'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para el botón de "Ingresos"
                    },
                    child: const Text('Vehículos ingresados'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
