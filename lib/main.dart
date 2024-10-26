import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'views/sensor_view.dart';
import 'views/geo_view.dart';
import 'views/info_view.dart';
import 'views/qr_view.dart';
import 'views/speech_to_text_view.dart';
import 'views/text_to_speech_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Herramientas del Teléfono',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    InfoView(),
    GeoView(),
    QRView(),
    SensorView(),
    SpeechToTextView(),
    TextToSpeechView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define una paleta de colores pastel cálida y amigable
    const Color pastelPurple = Color(0xFFEDE7F6); // Lavanda suave más clara
    const Color pastelPink = Color(0xFFF8BBD0); // Rosa suave más clara
    const Color accentPeach = Color(0xFFFFCCBC); // Durazno suave más claro
    const Color accentGreen = Color(0xFFB2DFDB); // Verde menta más claro
    const Color lightBackground = Color(0xFFFFFFFF); // Fondo blanco
    const Color darkBackground = Color(0xFFB0BEC5); // Azul gris claro
    const Color whiteColor = Colors.black; // Texto negro

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Multifunciones',
          style: TextStyle(color: whiteColor), // Texto negro
        ),
        backgroundColor: pastelPurple, // Fondo lavanda suave
        elevation: 4, // Sombra para darle un poco de profundidad
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: lightBackground, // Fondo blanco para la barra
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Sombra ligera
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.transparent, // Hacer que el fondo de la barra sea transparente para el contenedor
          elevation: 0, // Eliminar la sombra de la barra por defecto
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: accentGreen, // Verde menta para iconos seleccionados
          unselectedItemColor: pastelPink, // Rosa suave para iconos no seleccionados
          selectedFontSize: 14,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded, color: accentGreen), // Icono con esquinas redondeadas
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_searching_rounded, color: accentGreen), // Icono más moderno para GPS
              label: 'Ubicación',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_rounded, color: accentGreen), // Icono más elegante para QR
              label: 'Escáner QR',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sensors_outlined, color: accentGreen), // Icono moderno para sensores
              label: 'Sensores',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mic_rounded, color: accentGreen), // Icono con bordes redondeados para micrófono
              label: 'Micrófono',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.surround_sound_rounded, color: accentGreen), // Icono más fluido para TTS
              label: 'Audio',
            ),
          ],
        ),
      ),
    );
  }


}
