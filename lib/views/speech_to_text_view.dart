import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextView extends StatefulWidget {
  @override
  _SpeechToTextViewState createState() => _SpeechToTextViewState();
}

class _SpeechToTextViewState extends State<SpeechToTextView> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = 'Presiona el botón para empezar a hablar';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20), // Espacio entre el texto y el botón
          GestureDetector(
            onTap: _listen,
            child: Container(
              width: 100, // Ancho del botón
              height: 100, // Alto del botón
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFC5CAE9), // Lavanda suave
                    Color(0xFFFFAB91), // Durazno suave
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(50.0), // Botón circular
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
                  color: Colors.white,
                  size: 50, // Tamaño del icono
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('Status: $status'),
        onError: (errorNotification) =>
            print('Error: $errorNotification.errorMsg'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
            onResult: (val) => setState(() {
                  _text = val.recognizedWords;
                }));
      } else {
        setState(() => _text = 'No se pudo iniciar el reconocimiento de voz');
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
