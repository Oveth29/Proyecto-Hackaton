import 'package:braille_tech/BaseDatosSQL/SQLiteConnetion.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'profile_screen.dart'; // Importa la pantalla de Perfil
import 'language_screen.dart'; // Importa la pantalla de Idiomas

void main() {
  runApp(BrailleTechApp());
  checkTables();
}

/**Clase Principal
 * Le da estructura visual base al codigo
 */
class BrailleTechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Estandar Visual Google
      title: 'BRAILLE TECH',
      theme: ThemeData(
        //Define el color primario de la App
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

/**Cuerpo de la Aplicación
 * Se encarga de crear el Appbar y body principales, juntando el resto de witget, sirve como
 * interfaz inicial
 */
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
      //preferredSize: Size.fromHeight(120),
      preferredSize: Size.fromRadius(50),
      child:  AppBar(
        //Parte Visual Superior de la Aplicación
        backgroundColor: Colors.black,
        title: Row(
          children: [
            //Logo en la parte superior
            Padding( //Agrega espacio alrededor de una imagen
              padding: const EdgeInsets.all(2.7), //Espacio de 8
              child: Center(
                child: Image.asset(
                  'assets/LogoApp.png', //LogoBarilleTech
                  height: 60,
                ),
              ),
            ),
            Text(
              'BRAILLE TECH',
              style: TextStyle(
                //Añade stilos al texto
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ],
        ),
        leading: IconButton(
          //Crea un boton a la izquierda
          icon: Icon(
            Icons.arrow_back_ios_new_rounded, //Le da una forma de triangulo
            size: 50,
            color: Colors.white,
          ),
          onPressed: () {
            //Aquí va la funcionalidad del boton                            <---AgregarFuncionalidad(SalirDelApp)
          },
        ),
        actions: [
          IconButton(
            //Crea un botton en la derecha
            icon: Icon(
              Icons.more_vert, //Le da un icono al boton en forma de 3 puntos
              size: 50,
              color: Colors.white,
            ),
            onPressed: () {
              // Acción al presionar los tres puntitos                      <----AgregarFuncionalidad
            },
          ),
        ],
      ),
      ),
      body: SafeArea(//Establece una area segura para evitar chocar con el appbar
      child: Column(
        children: [
          // Botones horizontales
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Navegación al mapa
                  },
                  child: Text('Mapa'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Navegación al menú
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuScreen()),
                    );
                  },
                  child: Text('Menú'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Navegación a ajustes
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  },
                  child: Text('Ajustes'),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 5,), // Espacio en la parte inferior
          Padding(//Agrega espacio o margenes para su widget hijo
            padding: const EdgeInsets.symmetric(//Aplica lo mismo a ambos lados
              horizontal: 10 //Longitud de la linea horizontal 
            ),
            child: Container(
              height: 0.5,//Grosor linea blanca debajo de botones
              color: Colors.white,
            ),
          )
          
        ],
      ),
    ),
    );
  }
}

/**============BOTON MENU=============.
 * La siguiente clase muestra el lienzo con el que se estará trabajando dentro del boton del
 * appbar principal "Menu".
*/
class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Presiona para hablar';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
            onResult: (val) => setState(() {
                  _text = val.recognizedWords;
                }));
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 46, 46),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Menú'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Semicuadrado que representa la ubicación
            Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white, // Fondo blanco
                borderRadius: BorderRadius.only(
                  //@Winter: Modificadores de cuadrado de ubicación
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  'Ubicación precisa',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
                height:
                    80), // Espacio estético entre el semicuadrado y el botón
            // Botón redondo con el ícono de micrófono
            ElevatedButton(
              onPressed: _listen,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(40),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _isListening ? Icons.mic : Icons.mic_none,
                    size: 60,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Text(
                    _isListening ? 'Escuchando...' : 'Pulse para hablar',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              _text,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

/**========BOTON AJUSTES==========
 * La siguiente clase muestra el lienzo con el que se estará trabajando dentro del boton del
 * appbar principal "Ajustes".
*/
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _talbackEnabled = false; // Estado del Talback (Activado/Desactivado)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Círculo de perfil en la parte superior
            GestureDetector(
              onTap: () {
                // Navega a la pantalla de edición de perfil al tocar el círculo
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfileScreen(), // Pantalla de edición de perfil
                  ),
                );
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300], // Color del círculo
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.black, // Ícono del perfil
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Perfil',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, // Texto en letras blancas
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40), // Espacio estético entre perfil y botones

            // Botones semirectangulares verticales
            Expanded(
              child: Column(
                children: [
                  // Botón 1: Asistentes
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón Asistentes
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AssistantsScreen(), // Navega a la pantalla de Asistentes
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.blue,
                      minimumSize:
                          Size(double.infinity, 50), // Botón ancho y bajo
                    ),
                    child: Text('Asistentes', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 20),

                  // Botón 2: Talback (con interruptor de activado/desactivado)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón Talback
                        },
                        style: ElevatedButton.styleFrom(
                          //primary: Colors.blue,
                          minimumSize: Size(240, 50),
                        ),
                        child: Text('Talback', style: TextStyle(fontSize: 18)),
                      ),
                      Switch(
                        value: _talbackEnabled,
                        onChanged: (value) {
                          setState(() {
                            _talbackEnabled = value; // Cambiar estado
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Botón 3: Idioma
                  ElevatedButton(
                    onPressed: () {
                      // Navega a la pantalla de selección de idioma
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LanguageScreen(), // Pantalla de idiomas
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('Idioma', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 20),

                  // Botón 4: Navegador
                  ElevatedButton(
                    onPressed: () {
                      // Acción para el botón Navegador (por ahora sin funcionalidad)
                    },
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('Navegador', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
