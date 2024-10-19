import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'profile_screen.dart';
import 'language_screen.dart';
import 'asignaturas_screen.dart';
import 'calificaciones_screen.dart';
import 'mensajes_screen.dart';

void main() {
  runApp(BrailleTechApp());
}

class BrailleTechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BRAILLE TECH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromRadius(50),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  if (_currentIndex != 0) {
                    setState(() {
                      _currentIndex = 0;
                    });
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(2.7),
                child: Center(
                  child: Image.asset(
                    'assets/LogoApp.png',
                    height: 60,
                  ),
                ),
              ),
              Text(
                'BRAILLE TECH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case 'Asignaturas':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AsignaturasScreen()),
                    );
                    break;
                  case 'Calificaciones':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalificacionesScreen()),
                    );
                    break;
                  case 'Mensajes':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MensajesWhatsAppStyle()),
                    );
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Asignaturas', 'Calificaciones', 'Mensajes'}
                    .map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice, style: TextStyle(color: Colors.black)),
                  );
                }).toList();
              },
              icon: Icon(
                Icons.more_vert,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0; // Mapa
                      });
                    },
                    child: Text('Mapa'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1; // Menú
                      });
                    },
                    child: Text('Menú'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 2; // Ajustes
                      });
                    },
                    child: Text('Ajustes'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 0.5,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Center(
                      //child: Text('Contenido del Mapa',
                      // style: TextStyle(color: Colors.white))),
                      // Mostrar ambas imágenes al seleccionar "Mapa"
                      if (_currentIndex == 0)
                        Column(
                          children: [
                            Image.asset("assets/MAPAMENU.png"),
                            SizedBox(height: 10),
                            Image.asset("assets/ABAJOMAPA.png"),
                          ],
                        )
                    ],
                  ),
                  MenuScreen(),
                  SettingsScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Cuadro de ubicación
          Container(
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Center(
              child: Text(
                'Ubicación precisa',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 80),
          // Botón redondo con el ícono de micrófono
          ElevatedButton(
            onPressed: _listen,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
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
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _talbackEnabled = false;
  bool _showAssistants = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Perfil',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            if (_showAssistants) ...[
              SizedBox(height: 20),
              _buildAssistantButton('Camila'),
              SizedBox(height: 10),
              _buildAssistantButton('Eduardo'),
              SizedBox(height: 10),
              _buildAssistantButton('Christhian'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showAssistants = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Regresar', style: TextStyle(fontSize: 18)),
              ),
            ] else ...[
              Expanded(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showAssistants = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text('Asistentes', style: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón Talback
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            minimumSize: Size(240, 50),
                          ),
                          child:
                              Text('Talback', style: TextStyle(fontSize: 18)),
                        ),
                        Switch(
                          value: _talbackEnabled,
                          onChanged: (value) {
                            setState(() {
                              _talbackEnabled = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LanguageScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text('Idioma', style: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para el botón Navegador
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text('Navegador', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAssistantButton(String name) {
    return ElevatedButton(
      onPressed: () {
        // Acción al presionar el botón del asistente
        print('Seleccionaste a $name');
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(name, style: TextStyle(fontSize: 18)),
    );
  }
}
