import 'package:examenodoo/screens/trimestre2.dart';
import 'package:examenodoo/screens/trimestre3.dart';
import 'package:flutter/material.dart';

class Trimestre1Screen extends StatefulWidget {
  @override
  _Trimestre1Screen createState() => _Trimestre1Screen();
}

class _Trimestre1Screen extends State<Trimestre1Screen> {
  final List<Map<String, dynamic>> subjects = [
    {"name": "Matemáticas", "score": 67, "color": Colors.orange},
    {"name": "Lenguaje", "score": 45, "color": Colors.red},
    {"name": "Ciencias Sociales", "score": 98, "color": Colors.green},
    {"name": "Historia", "score": 83, "color": Colors.green},
    {"name": "Educación Física", "score": 51.5, "color": Colors.green},
    {"name": "Arte", "score": 100, "color": Colors.red},
    {"name": "Religión", "score": 49.5, "color": Colors.green},
  ];

  String _selectedTrimestre = '1er Trimestre';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calificaciones',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Henry Saavedra Gomez',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _selectedTrimestre,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      dropdownColor: Colors.indigo,
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTrimestre = newValue!;
                          if (newValue == '3er Trimestre') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Trimestre3Screen()),
                            );
                          }
                          if (newValue == '1er Trimestre') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Trimestre1Screen()),
                            );
                          }
                          if (newValue == '2do Trimestre') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Trimestre2Screen()),
                            );
                          }
                        });
                      },
                      items: <String>[
                        '1er Trimestre',
                        '2do Trimestre',
                        '3er Trimestre'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: ListTile(
                        leading: Text(
                          subjects[index]['name'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        trailing: Text(
                          subjects[index]['score'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: subjects[index]['color'],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
