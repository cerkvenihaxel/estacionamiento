import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home.dart';
import 'screens/ingreso.dart';
import 'screens/listado.dart';
import 'screens/salida.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/ingreso',
          builder: (context, state) => const IngresoPage(),
        ),
        GoRoute(
          path: '/listado/:patente/:horaIngreso',
          builder: (context, state) {
            return ListadoPage(
              patente: state.pathParameters['patente']!,
              horaIngreso: TimeOfDay(
                hour: int.parse(
                  state.pathParameters['horaIngreso']!.split(':')[0],
                ),
                minute: int.parse(
                  state.pathParameters['horaIngreso']!.split(':')[1],
                ),
              ),
            );
          },
        ),
        GoRoute(
          path: '/salida',
          builder: (context, state) => SalidaPage(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Estacionamiento App',
      theme: ThemeData(),
      routerConfig: router,
    );
  }
}
