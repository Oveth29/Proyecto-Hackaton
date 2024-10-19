import 'package:flutter/material.dart';

class MensajesWhatsAppStyle extends StatefulWidget {
  @override
  _MensajesWhatsAppStyleState createState() => _MensajesWhatsAppStyleState();
}

class _MensajesWhatsAppStyleState extends State<MensajesWhatsAppStyle> {
  List<Map<String, dynamic>> mensajes = [];

  void enviarAudio() {
    setState(() {
      mensajes.add({'audio': true, 'enviado': true});
    });
  }

  void recibirAudio() {
    setState(() {
      mensajes.add({'audio': true, 'enviado': false});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensajes de Voz'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mensajes.length,
              itemBuilder: (context, index) {
                bool enviado = mensajes[index]['enviado'];
                return Align(
                  alignment:
                      enviado ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: enviado ? Colors.greenAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.audiotrack,
                          color: enviado ? Colors.white : Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Audio',
                          style: TextStyle(
                              color: enviado ? Colors.white : Colors.black),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: enviarAudio,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
