import 'package:flutter/material.dart';

class AsistenciaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Asistencias',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
        ),
        body: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'No hay asistencias tomadas por el docente!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        )));
  }
}
