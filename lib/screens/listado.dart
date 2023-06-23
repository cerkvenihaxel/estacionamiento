import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';

//Falta agregar el listado de los vehículos

class ListadoPage extends StatelessWidget {
  final String patente;
  final TimeOfDay horaIngreso;

  const ListadoPage({
    required this.patente,
    required this.horaIngreso,
    Key? key,
  }) : super(key: key);

  Future<Uint8List> _generarPDF() async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    // Crear el contenido del PDF
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text(
                  'Estacionamiento La Virgencita de Guandacol',
                  style: pw.TextStyle(font: font),
                ),
                pw.SizedBox(height: 12),
                pw.Text(
                  'Número de patente: $patente',
                  style: pw.TextStyle(font: font),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  'Hora de ingreso: $horaIngreso',
                  style: pw.TextStyle(font: font),
                ),
              ],
            ),
          );
        },
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Ticket entrada'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Estacionamiento La Virgencita de Guandacol',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Número de patente: $patente',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Hora de ingreso: ${horaIngreso.format(context)}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                _generarPDF();
                context.go('/');
              },
              child: const Text('Imprimir Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
