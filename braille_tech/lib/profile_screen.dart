import 'package:flutter/material.dart';

/**======BOTON ASISTENTE=========
 * La clase "AssistantsScreen" será la encargada de mostrar y ejecutar las funciones dentro del boton
 * Asistente que opera en el menu de "Ajustes". 
 */
class AssistantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asistentes'),
      ),
      body: Center(
        child: Text(
          'Pantalla de Asistentes',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

/**========Circulo De Perfil========
 * Esta clase entrará en acción cuando el usuario toque la burbuja de su perfil
 * mostrando datos que pueden ser rellenados por él, esta función aún no esta terminada
 * ni mucho menos refinada.
 */
/*Ingresar numero de emergencia, y su Usuario*/
class ProfileScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emergencyNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Semirectángulo para el Nombre de usuario
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Nombre de usuario',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Semirectángulo para el Número de emergencia
            TextField(
              controller: _emergencyNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Número de emergencia',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
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
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}


