import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class GeoView extends StatelessWidget {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Los permisos de ubicación están denegados.');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          try {
            Position position = await _determinePosition();
            final Uri url = Uri.parse(
                'https://www.google.com/maps?q=${position.latitude},${position.longitude}');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              throw 'Could not launch $url';
            }
          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Error: $e')));
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFB2DFDB), // Verde menta claro
                Color(0xFFFFCCBC), // Durazno suave claro
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
          child: const Text(
            'Obtener Coordenadas y Abrir en Google Maps',
            style: TextStyle(
              color: Colors.black, // Color del texto
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

}
