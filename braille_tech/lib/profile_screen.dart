import 'package:flutter/material.dart';

/**======BOTON ASISTENTE========= */
class AssistantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Asistentes',
          style: TextStyle(color: Colors.white), // Texto en blanco
        ),
        backgroundColor: Colors.black, // Fondo negro
      ),
      body: Center(
        child: Text(
          'Pantalla de Asistentes',
          style:
              TextStyle(fontSize: 24, color: Colors.white), // Texto en blanco
        ),
      ),
    );
  }
}

/**========Circulo De Perfil======== */
class ProfileScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emergencyNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar Perfil',
          style: TextStyle(color: Colors.white), // Texto en blanco
        ),
        backgroundColor: Colors.black, // Fondo negro
      ),
      body: Container(
        color: Color.fromRGBO(63, 68, 67, 1), // Fondo gris
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Semirectángulo para el Nombre de usuario
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Nombre de usuario',
                labelStyle: TextStyle(color: Colors.white), // Etiqueta blanca
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.white), // Borde blanco
                ),
                filled: true,
                fillColor: Colors.black, // Fondo negro
              ),
              style: TextStyle(color: Colors.white), // Texto en blanco
            ),
            SizedBox(height: 20),

            // Semirectángulo para el Número de emergencia
            TextField(
              controller: _emergencyNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Número de emergencia',
                labelStyle: TextStyle(color: Colors.white), // Etiqueta blanca
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.white), // Borde blanco
                ),
                filled: true,
                fillColor: Colors.black, // Fondo negro
              ),
              style: TextStyle(color: Colors.white), // Texto en blanco
            ),
            SizedBox(height: 40),

            // Botón para guardar los cambios
            ElevatedButton(
              onPressed: () {
                // Acciones al guardar la información del perfil
                String username = _usernameController.text;
                String emergencyNumber = _emergencyNumberController.text;
                // Implementar lógica de guardar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Fondo negro
                foregroundColor: Colors.white, // Texto blanco
                minimumSize: Size(double.infinity, 50), // Tamaño mínimo
              ),
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
