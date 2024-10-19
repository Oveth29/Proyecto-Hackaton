import 'package:flutter/material.dart';

class AsignaturasScreen extends StatefulWidget {
  @override
  _AsignaturasScreenState createState() => _AsignaturasScreenState();
}

class _AsignaturasScreenState extends State<AsignaturasScreen> {
  // Lista de asignaturas con el estado de si están hechas o no
  List<Map<String, dynamic>> asignaturas = [
    {'nombre': 'Matemáticas', 'completada': true},
    {'nombre': 'Ciencias', 'completada': false},
    {'nombre': 'Inglés', 'completada': true},
  ];

  void _toggleCompletion(int index) {
    setState(() {
      asignaturas[index]['completada'] = !asignaturas[index]['completada'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Asignaturas',
          style: TextStyle(color: Colors.white), // Texto blanco
        ),
        backgroundColor: Colors.black, // Fondo negro
      ),
      body: Container(
        color: Color(0xFF424242), // Fondo gris oscuro
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: asignaturas.length,
                itemBuilder: (context, index) {
                  bool completada = asignaturas[index]['completada'];
                  return GestureDetector(
                    onTap: () =>
                        _toggleCompletion(index), // Cambia el estado al tocar
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // Fondo blanco para los elementos
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            asignaturas[index]['nombre'],
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black), // Texto negro
                          ),
                          Icon(
                            completada ? Icons.check_circle : Icons.cancel,
                            color: completada ? Colors.green : Colors.red,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  // Aquí puedes agregar funcionalidad de grabación de audio
                },
                child: CircleAvatar(
                  radius: 50, // Tamaño del círculo
                  backgroundColor: Colors.white, // Fondo blanco
                  child: Icon(
                    Icons.mic,
                    color: Color(0xFF424242), // Micrófono gris oscuro
                    size: 40, // Tamaño del micrófono
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
