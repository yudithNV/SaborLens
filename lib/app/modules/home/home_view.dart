import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.background,
            // AppBar eliminado — lo maneja NavView
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    '¿Qué estás comiendo hoy?',
                    style: TextStyle(
                        fontSize: 13, color: AppColors.textMedium),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Identifica cualquier plato\nboliviano al instante',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textDark,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _mainButton(
                    icon: Icons.camera_alt_outlined,
                    label: 'Escanear Plato',
                    sublabel: 'Usa la cámara de tu dispositivo',
                    onTap: controller.escanearPlato,
                  ),
                  const SizedBox(height: 10),
                  _secondaryButton(
                    icon: Icons.photo_outlined,
                    label: 'Subir de Galería',
                    sublabel: 'Elige una foto existente',
                    onTap: controller.subirDeGaleria,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Platos Recomendados',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _recommendedCard(),
                ],
              ),
            ),
          ),

          // overlay de loading
          if (controller.isLoading.value)
            Container(
              color: Colors.black.withOpacity(0.6),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 28),
                  decoration: BoxDecoration(
                    color: AppColors.cardBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: 3,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Identificando plato...',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'La IA está analizando tu imagen',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _mainButton({
    required IconData icon,
    required String label,
    required String sublabel,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(
                color: AppColors.whiteTransparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppColors.white, size: 22),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    )),
                const SizedBox(height: 2),
                Text(sublabel,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _secondaryButton({
    required IconData icon,
    required String label,
    required String sublabel,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: const Color(0xFFE8DDD6), width: 0.5),
        ),
        child: Row(
          children: [
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(
                color: AppColors.secondaryLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppColors.secondary, size: 22),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textDark,
                    )),
                const SizedBox(height: 2),
                Text(sublabel,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textMedium,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _recommendedCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: const Color(0xFFEDE5DF), width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 90, height: 90,
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Icon(Icons.restaurant,
                size: 38,
                color: AppColors.primary.withOpacity(0.4)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primarySoft,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('Recomendado',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        )),
                  ),
                  const SizedBox(height: 6),
                  Text('Silpancho Cochabambino',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDark,
                      )),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 12, color: AppColors.textMedium),
                      const SizedBox(width: 2),
                      Text('Cochabamba',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textMedium)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _stat(Icons.local_fire_department_outlined,
                          '650 kcal'),
                      const SizedBox(width: 12),
                      _stat(Icons.access_time_outlined, '35 min'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 14),
        ],
      ),
    );
  }

  Widget _stat(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 13, color: AppColors.primary),
        const SizedBox(width: 4),
        Text(label,
            style: TextStyle(
                fontSize: 11, color: AppColors.textMedium)),
      ],
    );
  }
}