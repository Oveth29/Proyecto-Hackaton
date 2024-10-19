import 'package:flutter/material.dart';

<<<<<<< HEAD
<<<<<<< HEAD
/**Observacion
 * El codigo de abajo es una version de prueba, no esta refinado ni terminado, pero su objetivo es
 * poder traducir el contenido a 4 idiomas distintos: Español, Ingles, Portugués y Frances
 */

class LanguageScreen extends StatelessWidget {
=======
=======
>>>>>>> 8fac25e5be667864ab2481e8c0da682678c5ff08
/**======BOTON ASISTENTE========= */
class AssistantsScreen extends StatelessWidget {
>>>>>>> 8fac25e5be667864ab2481e8c0da682678c5ff08
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
<<<<<<< HEAD
<<<<<<< HEAD
          'Seleccionar Idioma',
          style: TextStyle(color: Colors.white), // Texto en blanco
=======
=======
>>>>>>> 8fac25e5be667864ab2481e8c0da682678c5ff08
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
<<<<<<< HEAD
>>>>>>> 8fac25e5be667864ab2481e8c0da682678c5ff08
=======
>>>>>>> 8fac25e5be667864ab2481e8c0da682678c5ff08
        ),
        backgroundColor: Colors.black, // Fondo negro
      ),
<<<<<<< HEAD
=======
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
<<<<<<< HEAD
>>>>>>> 8fac25e5be667864ab2481e8c0da682678c5ff08
=======
>>>>>>> 8fac25e5be667864ab2481e8c0da682678c5ff08
      body: Container(
        color: Color.fromRGBO(63, 68, 67, 1), // Fondo gris
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
<<<<<<< HEAD
            // Botón para Español
=======
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
>>>>>>> 8fac25e5be667864ab2481e8c0da682678c5ff08
            ElevatedButton(
              onPressed: () {
                // Acción para cambiar el idioma a Español
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Fondo negro
                foregroundColor: Colors.white, // Texto blanco
<<<<<<< HEAD
<<<<<<< HEAD
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
                backgroundColor: Colors.black, // Fondo negro
                foregroundColor: Colors.white, // Texto blanco
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
                backgroundColor: Colors.black, // Fondo negro
                foregroundColor: Colors.white, // Texto blanco
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
                backgroundColor: Colors.black, // Fondo negro
                foregroundColor: Colors.white, // Texto blanco
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Francés', style: TextStyle(fontSize: 18)),
=======
=======
>>>>>>> 8fac25e5be667864ab2481e8c0da682678c5ff08
                minimumSize: Size(double.infinity, 50), // Tamaño mínimo
              ),
              child: Text('Guardar'),
>>>>>>> 8fac25e5be667864ab2481e8c0da682678c5ff08
            ),
          ],
        ),
      ),
    );
  }
}
