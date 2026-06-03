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
            body: ListView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              children: [
                _hero(),
                const SizedBox(height: 16),
                _actions(),
                const SizedBox(height: 22),
                _sectionHeader(
                  'Explora rapido',
                  'Consejos para un mejor escaneo',
                ),
                const SizedBox(height: 10),
                _tipsRow(),
                const SizedBox(height: 24),
                _sectionHeader(
                  'Platos recomendados',
                  'Sabores populares de Bolivia',
                ),
                const SizedBox(height: 12),
                _recommendedCard(
                  title: 'Silpancho Cochabambino',
                  origin: 'Cochabamba',
                  calories: '650 kcal',
                  time: '35 min',
                  color: AppColors.primarySoft,
                  iconColor: AppColors.primary,
                ),
                const SizedBox(height: 10),
                _recommendedCard(
                  title: 'Sopa de Mani',
                  origin: 'Cochabamba',
                  calories: '420 kcal',
                  time: '45 min',
                  color: AppColors.secondaryLight,
                  iconColor: AppColors.secondary,
                ),
              ],
            ),
          ),
          if (controller.isLoading.value) _loadingOverlay(),
        ],
      ),
    );
  }

  Widget _hero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(top: -54, right: -46, child: _circle(150)),
          Positioned(bottom: -44, left: -34, child: _circle(92)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.whiteTransparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.whiteBorder),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.white,
                  size: 26,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Reconoce tu plato',
                style: GoogleFonts.fraunces(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sube una foto y SaborLens identifica platos bolivianos con su historia, ingredientes y calorias.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textMuted,
                  height: 1.55,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  _heroPill(Icons.auto_awesome_outlined, 'IA culinaria'),
                  const SizedBox(width: 8),
                  _heroPill(Icons.public_outlined, 'Bolivia'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actions() {
    return Row(
      children: [
        Expanded(
          child: _actionCard(
            icon: Icons.camera_alt_rounded,
            title: 'Escanear',
            subtitle: 'Usar camara',
            onTap: controller.escanearPlato,
            isPrimary: true,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _actionCard(
            icon: Icons.photo_library_outlined,
            title: 'Galeria',
            subtitle: 'Elegir foto',
            onTap: controller.subirDeGaleria,
          ),
        ),
      ],
    );
  }

  Widget _actionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        constraints: const BoxConstraints(minHeight: 126),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isPrimary ? AppColors.primary : const Color(0xFFEDE5DF),
            width: isPrimary ? 1 : 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: isPrimary ? AppColors.primary : AppColors.secondaryLight,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: isPrimary ? AppColors.white : AppColors.secondary,
                size: 22,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: AppColors.textMedium),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: AppColors.textMedium),
        ),
      ],
    );
  }

  Widget _tipsRow() {
    return Row(
      children: [
        _tip(Icons.wb_sunny_outlined, 'Buena luz'),
        const SizedBox(width: 10),
        _tip(Icons.center_focus_strong_outlined, 'Plato centrado'),
        const SizedBox(width: 10),
        _tip(Icons.no_flash_outlined, 'Sin reflejos'),
      ],
    );
  }

  Widget _tip(IconData icon, String label) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(minHeight: 82),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEDE5DF), width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary, size: 20),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recommendedCard({
    required String title,
    required String origin,
    required String calories,
    required String time,
    required Color color,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEDE5DF), width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.restaurant_menu_outlined, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 13,
                      color: AppColors.textMedium,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      origin,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _miniStat(Icons.local_fire_department_outlined, calories),
                    const SizedBox(width: 12),
                    _miniStat(Icons.access_time_outlined, time),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniStat(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 13, color: AppColors.primary),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: AppColors.textMedium),
        ),
      ],
    );
  }

  Widget _loadingOverlay() {
    return Container(
      color: Colors.black.withValues(alpha: 0.62),
      child: Center(
        child: Container(
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 26),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 3,
              ),
              const SizedBox(height: 18),
              Text(
                'Identificando plato...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'La IA esta analizando tu imagen',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: AppColors.textMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heroPill(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.whiteTransparent,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.whiteBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.white),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle(double size) => Container(
    width: size,
    height: size,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.whiteTransparent,
    ),
  );
}
