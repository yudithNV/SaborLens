import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import 'perfil_controller.dart';

class PerfilView extends GetView<PerfilController> {
  const PerfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.cargarEstadisticas,
      color: AppColors.primary,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          _header(),
          const SizedBox(height: 16),
          _stats(),
          const SizedBox(height: 18),
          _sectionTitle('Cuenta'),
          _infoTile(
            icon: Icons.mail_outline,
            title: 'Correo',
            value: controller.email,
            iconBg: AppColors.primarySoft,
            iconColor: AppColors.primary,
          ),
          _infoTile(
            icon: Icons.verified_user_outlined,
            title: 'Sesion',
            value: 'Conectada con Supabase',
            iconBg: AppColors.secondaryLight,
            iconColor: AppColors.secondary,
          ),
          const SizedBox(height: 12),
          _sectionTitle('SaborLens'),
          _infoTile(
            icon: Icons.camera_alt_outlined,
            title: 'Escaneo IA',
            value: 'Reconocimiento de platos bolivianos',
            iconBg: const Color(0xFFFFF6D9),
            iconColor: const Color(0xFFB77700),
          ),
          _infoTile(
            icon: Icons.restaurant_menu_outlined,
            title: 'Recetas',
            value: 'Ingredientes, historia y calorias',
            iconBg: const Color(0xFFEFF3FF),
            iconColor: const Color(0xFF4664C8),
          ),
          const SizedBox(height: 18),
          _logoutButton(),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned(top: -40, right: -34, child: _circle(120)),
          Positioned(bottom: -42, left: -36, child: _circle(92)),
          Row(
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: AppColors.whiteTransparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.whiteBorder),
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: AppColors.white,
                  size: 34,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.nombre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whiteTransparent,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: AppColors.whiteBorder),
                      ),
                      child: const Text(
                        'Explorador culinario',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stats() {
    return Obx(
      () => Row(
        children: [
          _statCard(
            icon: Icons.favorite_rounded,
            value: controller.isLoadingStats.value
                ? '...'
                : controller.favoritosCount.value.toString(),
            label: 'Favoritos',
          ),
          const SizedBox(width: 12),
          _statCard(
            icon: Icons.camera_alt_rounded,
            value: 'IA',
            label: 'Escaneo',
          ),
          const SizedBox(width: 12),
          _statCard(icon: Icons.public_rounded, value: 'BO', label: 'Cultura'),
        ],
      ),
    );
  }

  Widget _statCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEDE5DF), width: 0.5),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(fontSize: 11, color: AppColors.textMedium),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppColors.textDark,
        ),
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
    required Color iconBg,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDE5DF), width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: AppColors.textMedium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoutButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: controller.cerrarSesion,
        icon: const Icon(Icons.logout_rounded),
        label: const Text('Cerrar sesion'),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary.withValues(alpha: 0.35)),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
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
