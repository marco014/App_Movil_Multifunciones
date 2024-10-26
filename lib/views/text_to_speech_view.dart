import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechView extends StatefulWidget {
  @override
  _TextToSpeechViewState createState() => _TextToSpeechViewState();
}

class _TextToSpeechViewState extends State<TextToSpeechView> {
  FlutterTts flutterTts = FlutterTts();
  String _text = 'Escribe algo para convertirlo en voz';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300, // Ancho del cuadro de texto
            decoration: BoxDecoration(
              color: Colors.white, // Color de fondo del cuadro de texto
              borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 4), // Efecto de sombra
                ),
              ],
            ),
            child: TextField(
              onChanged: (val) => setState(() => _text = val),
              decoration: InputDecoration(
                hintText: 'Ingresa el texto aquí',
                hintStyle: TextStyle(color: Colors.grey[600]), // Estilo del texto de ayuda
                border: InputBorder.none, // Sin borde predeterminado
                contentPadding: const EdgeInsets.all(16.0), // Espaciado interno
              ),
            ),
          ),
          const SizedBox(height: 20), // Espacio entre el cuadro de texto y el botón
          GestureDetector(
            onTap: () => _speak(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFC5CAE9), // Lavanda suave
                    Color(0xFFFFAB91), // Durazno suave
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 4), // Efecto de sombra
                  ),
                ],
              ),
              child: const Text(
                'Escuchar Texto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future _speak() async {
    await flutterTts.speak(_text);
  }
}
