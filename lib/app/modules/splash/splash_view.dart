import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // círculos decorativos de fondo
          Positioned(top: -70, right: -60, child: _circle(220)),
          Positioned(bottom: 120, left: -30, child: _circle(140)),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 64),
                // logo
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: AppColors.whiteTransparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 22),
                // título
                Text(
                  'SaborLens',
                  style: GoogleFonts.fraunces(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 12),
                // subtítulo
                Text(
                  'Descubre los platos típicos de Bolivia\ncon solo una foto',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textMuted,
                    height: 1.55,
                  ),
                ),
                const SizedBox(height: 36),
                // feature cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _featureCard(
                        Icons.camera_alt_outlined,
                        'Reconocimiento por foto',
                        'Escanea o sube una imagen y la IA identifica el plato',
                      ),
                      const SizedBox(height: 12),
                      _featureCard(
                        Icons.eco_outlined,
                        'Información nutricional',
                        'Calorías, proteínas, ingredientes y tiempo de preparación',
                      ),
                      const SizedBox(height: 12),
                      _featureCard(
                        Icons.menu_book_outlined,
                        'Historia y cultura',
                        'Conoce el origen y la tradición detrás de cada plato',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // botón comenzar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.goToHome,
                      child: const Text('Comenzar'),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Bolivia · Sabores que cuentan historias',
                  style: TextStyle(fontSize: 12, color: AppColors.textSubtle),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle(double size) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white.withValues(alpha: 0.06),
    ),
  );

  Widget _featureCard(IconData icon, String title, String desc) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.whiteTransparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.whiteBorder, width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.white, size: 19),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  desc,
                  style: TextStyle(fontSize: 12, color: AppColors.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
