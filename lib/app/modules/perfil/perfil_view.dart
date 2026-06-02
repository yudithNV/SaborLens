import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import 'perfil_controller.dart';

class PerfilView extends GetView<PerfilController> {
  const PerfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // card con datos del usuario
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 52, height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.whiteTransparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person_outline,
                      color: AppColors.white, size: 26),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Usuario',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        )),
                    const SizedBox(height: 3),
                    Text('usuario@correo.com',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textMuted,
                        )),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // solo cerrar sesión
          GestureDetector(
            onTap: controller.cerrarSesion,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: const Color(0xFFEDE5DF), width: 0.5),
              ),
              child: Row(
                children: [
                  Container(
                    width: 36, height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primarySoft,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.logout_outlined,
                        size: 18, color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text('Cerrar sesión',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                        )),
                  ),
                  Icon(Icons.chevron_right_outlined,
                      size: 18, color: const Color(0xFFC4B0A0)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _opcion({
    required IconData icon,
    required String label,
    required Color iconBg,
    required Color iconColor,
    Color? labelColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: const Color(0xFFEDE5DF), width: 0.5),
        ),
        child: Row(
          children: [
            Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 18, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: labelColor ?? AppColors.textDark,
                ),
              ),
            ),
            Icon(Icons.chevron_right_outlined,
                size: 18, color: const Color(0xFFC4B0A0)),
          ],
        ),
      ),
    );
  }
}