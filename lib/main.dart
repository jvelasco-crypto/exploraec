import 'package:flutter/material.dart';

void main() {
  runApp(const ExploraEcApp());
}

class ExploraEcApp extends StatelessWidget {
  const ExploraEcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExploraEC',
      home: const BienvenidaScreen(),
    );
  }
}

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Design DNA de Stitch ("Andean Canopy")
    const fondo = Color(0xFFF2FCF6);
    const esmeralda = Color(0xFF0D6853);
    const tituloColor = Color(0xFF004E3D);
    const textoColor = Color(0xFF3F4945);

    return Scaffold(
      backgroundColor: fondo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: esmeralda,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 6),
                  boxShadow: [
                    BoxShadow(
                      color: esmeralda.withValues(alpha: 0.25),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(Icons.explore_outlined,
                    color: Colors.white, size: 44),
              ),
              const SizedBox(height: 32),
              const Text(
                'ExploraEC',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1.3,
                  color: tituloColor,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Descubre los mejores rincones, gastronomía y senderos '
                'a tu alrededor en Ecuador.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5, color: textoColor),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: esmeralda,
                    foregroundColor: Colors.white,
                    elevation: 6,
                    shadowColor: esmeralda.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Empezar'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20),
                    ],
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
