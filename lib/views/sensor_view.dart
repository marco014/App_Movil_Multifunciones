import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Acelerómetro
            StreamBuilder<AccelerometerEvent>(
              stream: accelerometerEvents,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildSensorDataCard(
                    title: 'Acelerómetro',
                    data: 'X: ${snapshot.data?.x?.toStringAsFixed(2)}\n'
                          'Y: ${snapshot.data?.y?.toStringAsFixed(2)}\n'
                          'Z: ${snapshot.data?.z?.toStringAsFixed(2)}',
                  );
                }
                return _buildLoadingCard('Acelerómetro');
              },
            ),
            const SizedBox(height: 20),

            // Magnetómetro
            StreamBuilder<MagnetometerEvent>(
              stream: magnetometerEvents,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildSensorDataCard(
                    title: 'Magnetómetro',
                    data: 'X: ${snapshot.data?.x?.toStringAsFixed(2)}\n'
                          'Y: ${snapshot.data?.y?.toStringAsFixed(2)}\n'
                          'Z: ${snapshot.data?.z?.toStringAsFixed(2)}',
                  );
                }
                return _buildLoadingCard('Magnetómetro');
              },
            ),
            const SizedBox(height: 20),

            // Giroscopio
            StreamBuilder<GyroscopeEvent>(
              stream: gyroscopeEvents,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildSensorDataCard(
                    title: 'Giroscopio',
                    data: 'X: ${snapshot.data?.x?.toStringAsFixed(2)}\n'
                          'Y: ${snapshot.data?.y?.toStringAsFixed(2)}\n'
                          'Z: ${snapshot.data?.z?.toStringAsFixed(2)}',
                  );
                }
                return _buildLoadingCard('Giroscopio');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Método para crear la tarjeta con datos del sensor
  Widget _buildSensorDataCard({required String title, required String data}) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFC5CAE9), // Lavanda suave
            Color(0xFFFFAB91), // Durazno suave
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black, // Color del texto
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black, // Color del texto
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // Método para crear la tarjeta de carga
  Widget _buildLoadingCard(String title) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFC5CAE9), // Lavanda suave
            Color(0xFFFFAB91), // Durazno suave
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black, // Color del texto
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }


}
