import 'package:flutter/material.dart';


/**Observacion
 * El codigo de abajo es una version de prueba, no esta refinado ni terminado, pero su objetivo es
 * poder traducir el contenido a 4 idiomas distintos: Español, Ingles, Portugués y Frances
 */

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Idioma'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botón para Español
            ElevatedButton(
              onPressed: () {
                // Acción para cambiar el idioma a Español
              },
              style: ElevatedButton.styleFrom(
                //primary: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Español', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            
            // Botón para Inglés
            ElevatedButton(
              onPressed: () {
                // Acción para cambiar el idioma a Inglés
              },
              style: ElevatedButton.styleFrom(
                //primary: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Inglés', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            
            // Botón para Portugués
            ElevatedButton(
              onPressed: () {
                // Acción para cambiar el idioma a Portugués
              },
              style: ElevatedButton.styleFrom(
                //primary: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Portugués', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            
            // Botón para Francés
            ElevatedButton(
              onPressed: () {
                // Acción para cambiar el idioma a Francés
              },
              style: ElevatedButton.styleFrom(
                //primary: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Francés', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}