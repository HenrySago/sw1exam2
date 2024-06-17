import 'dart:convert';

import 'package:examenodoo/models/event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventoPage extends StatefulWidget {
  @override
  _EventoPageState createState() => _EventoPageState();
}

class _EventoPageState extends State<EventoPage> {
  late Future<List<Comunicado>> futureComunicados;

  @override
  void initState() {
    super.initState();
    futureComunicados = fetchComunicados();
  }

  Future<List<Comunicado>> fetchComunicados() async {
    final response = await http.get(
        Uri.parse('http://odooo.campozanodevlab.com/api/comunicados')); //API

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Comunicado.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load comunicados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: FutureBuilder<List<Comunicado>>(
          future: futureComunicados,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].titulo),
                    subtitle: Text(snapshot.data![index].descripcion),
                    trailing: Text(snapshot.data![index].fecha),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
