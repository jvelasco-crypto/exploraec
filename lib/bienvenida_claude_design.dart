import 'package:flutter/material.dart';

/// Pantalla de bienvenida generada a partir del diseño de Claude Design (/design).
class BienvenidaScreenClaudeDesign extends StatelessWidget {
  const BienvenidaScreenClaudeDesign({super.key});

  // Paleta del diseño: azul noche andino + acento ámbar
  static const _fondo = Color(0xFF10213A);
  static const _montanaLejana = Color(0xFF162C4B);
  static const _montanaCercana = Color(0xFF1B3558);
  static const _ambar = Color(0xFFF2B33D);
  static const _textoClaro = Color(0xFFF4F1EA);
  static const _textoSecundario = Color(0xFFC9D2DF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fondo,
      body: Stack(
        children: [
          // Siluetas de montañas al pie de la pantalla
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 300,
            child: CustomPaint(painter: _MontanasPainter()),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 48, 28, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      color: _ambar,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Icon(Icons.location_on_outlined,
                        color: _fondo, size: 40),
                  ),
                  const SizedBox(height: 28),
                  const Text.rich(
                    TextSpan(
                      text: 'Explora',
                      children: [
                        TextSpan(text: 'EC', style: TextStyle(color: _ambar)),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 52,
                      height: 1,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1.5,
                      color: _textoClaro,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'Descubre y guarda los lugares que vale la pena '
                      'visitar cerca de ti.',
                      style: TextStyle(
                          fontSize: 18, height: 1.5, color: _textoSecundario),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _ambar,
                        foregroundColor: _fondo,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Empezar'),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward, size: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Dibuja dos capas de montañas y un pico nevado (escala 390x300 del diseño).
class _MontanasPainter extends CustomPainter {
  const _MontanasPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final sx = size.width / 390;
    final sy = size.height / 300;

    Path capa(List<Offset> puntos) {
      final path = Path()..moveTo(puntos.first.dx * sx, puntos.first.dy * sy);
      for (final p in puntos.skip(1)) {
        path.lineTo(p.dx * sx, p.dy * sy);
      }
      return path..close();
    }

    canvas.drawPath(
      capa(const [
        Offset(0, 230), Offset(70, 170), Offset(120, 205), Offset(200, 110),
        Offset(255, 165), Offset(300, 135), Offset(390, 210),
        Offset(390, 300), Offset(0, 300),
      ]),
      Paint()..color = BienvenidaScreenClaudeDesign._montanaLejana,
    );
    canvas.drawPath(
      capa(const [
        Offset(0, 260), Offset(90, 215), Offset(160, 245), Offset(240, 190),
        Offset(320, 235), Offset(390, 220), Offset(390, 300), Offset(0, 300),
      ]),
      Paint()..color = BienvenidaScreenClaudeDesign._montanaCercana,
    );
    canvas.drawPath(
      capa(const [
        Offset(185, 125), Offset(200, 110), Offset(215, 127),
        Offset(207, 124), Offset(200, 130), Offset(193, 124),
      ]),
      Paint()..color = BienvenidaScreenClaudeDesign._textoClaro.withValues(alpha: 0.85),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
