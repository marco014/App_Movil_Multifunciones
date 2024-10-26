import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Para abrir el enlace de GitHub

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  // Función para abrir la URL de GitHub
  Future<void> _launchGitHub() async {
    final Uri url =
        Uri.parse('https://github.com/marco014');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir el enlace $url';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // Define una paleta de colores sobrios y elegantes
    const Color startGradient = Color(0xFF1E3C72); // Azul profundo
    const Color endGradient = Color(0xFF2A5298); // Azul medio
    const Color accentBlue = Color(0xFF4A90E2); // Azul vivo para detalles
    const Color darkBackground = Color(0xFF1B1F3B); // Azul gris oscuro
    const Color lightColor = Color(0xFFE0E0E0); // Color claro para el texto
    const Color lightAccentBlue = Color(0xFFB0C4DE); // Azul claro para el texto

    return Scaffold(
      backgroundColor: darkBackground,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo con diseño mejorado
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Forma circular
                  border: Border.all(
                    color: accentBlue, // Color del borde
                    width: 2.0, // Ancho del borde
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 10.0,
                      offset: Offset(3.0, 3.0),
                    ),
                  ],
                ),
                child: ClipOval( // Utiliza ClipOval para un recorte circular
                  child: Image.asset(
                    'asset/img/uplogo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Nombre
              const Text(
                'Marco Ortiz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: lightColor, // Color claro
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black26,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Información adicional
              const Text(
                'Ingeniería en Desarrollo de Software',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: lightAccentBlue, // Azul claro
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Programación para Móviles',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: lightColor, // Color claro
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '221213  -  9°A',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: lightAccentBlue, // Azul claro
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              // Botón estilizado para el enlace a GitHub
              GestureDetector(
                onTap: _launchGitHub,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: const LinearGradient(
                      colors: [startGradient, accentBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 5.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Ver repositorio en GitHub',
                    style: TextStyle(
                      color: lightColor, // Color claro para el botón
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}