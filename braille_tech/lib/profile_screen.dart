import 'package:braille_tech/BaseDatosSQL/SQLiteConnetion.dart';
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
 * mostrando datos que pueden ser rellenados por él, esta función aún no está terminada
 * ni mucho menos refinada.
 */

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emergencyNumberController = TextEditingController();
  
  // ID del usuario que quieres cargar
  int userId = 9;
  int userId_2 = 1;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    print("HolaMundo");
  }

  // Método para cargar los datos del usuario
  Future<void> _loadUserData() async {
    String? userName = await LocalDB().getUsuarioNombre(userId);
    String? emergencyNumber = await LocalDB().getNumeroEmergencia(userId); // Asegúrate de implementar este método en tu clase LocalDB
    
    setState(() {
      _usernameController.text = userName ?? ''; // Carga el nombre en el controlador
      _emergencyNumberController.text = emergencyNumber ?? ''; // Carga el número de emergencia
    });
  }

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
                labelText: 'Nombre del Usuario', // Cambia esto si es necesario
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
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async { // Botón para poder guardar el Usuario
                    String NombreDelFokinUsuario = _usernameController.text;
                    String fotoPerfil = 'ruta/a/la/foto.jpg'; // Aquí puedes obtener la ruta de la foto
                    int idIdioma = 1; // Valor estático o dinámico
                    int idUniversidad = 1; // Valor estático o dinámico

                    //ActualizarUsuario
                    await LocalDB().updateUsuario(userId, NombreDelFokinUsuario);
                    print("UsuarioActualizado si si si");
                    // Agregar usuario
                            //await LocalDB().addUsuario(NombreDelFokinUsuario, fotoPerfil, idIdioma, idUniversidad);
                            //print('Usuario agregado');
                            //print(NombreDelFokinUsuario);
                  },
                  child: Text('Guardar Perfil'),
                ),
                Container(child: Text("                  ")),
                ElevatedButton( // Botón para guardar el número de teléfono
                  onPressed: () async {
                    String emergencyNumber = _emergencyNumberController.text;
                    //Actualizar Numero
                    await LocalDB().updateNumEmergencia(userId_2, emergencyNumber);
                    print("La Actualización del num fue exitosa")
                    //Agregar un Numero
                        //await LocalDB().addNumeroEmergencia(userId, emergencyNumber);
                        //print("El agregado del numero fue un exito");

                  },
                  child: Text('Guardar Número'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
