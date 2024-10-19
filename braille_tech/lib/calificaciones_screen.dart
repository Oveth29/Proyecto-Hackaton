import 'package:flutter/material.dart';

class CalificacionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calificaciones',
          style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.04), // Tamaño más pequeño
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Color.fromRGBO(63, 68, 67, 1), // Color de fondo gris
        padding: EdgeInsets.all(16.0), // Espaciado interno
        child: Center(
          child: Text(
            'Aquí se mostrarán las calificaciones.',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.05, // Ajustar tamaño de texto
            ),
          ),
        ),
      ),
    );
  }
}
