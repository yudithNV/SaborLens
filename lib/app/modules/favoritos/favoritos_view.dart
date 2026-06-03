import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import 'favoritos_controller.dart';

class FavoritosView extends GetView<FavoritosController> {
  const FavoritosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        );
      }

      if (controller.errorMessage.value.isNotEmpty) {
        return _messageState(
          icon: Icons.error_outline,
          title: 'No se cargaron los favoritos',
          message: controller.errorMessage.value,
          action: TextButton.icon(
            onPressed: controller.cargarFavoritos,
            icon: const Icon(Icons.refresh),
            label: const Text('Reintentar'),
          ),
        );
      }

      if (controller.favoritos.isEmpty) {
        return _messageState(
          icon: Icons.favorite_outline,
          title: 'Sin favoritos aun',
          message: 'Marca platos como favoritos desde el detalle.',
        );
      }

      return RefreshIndicator(
        onRefresh: controller.cargarFavoritos,
        color: AppColors.primary,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: controller.favoritos.length,
          itemBuilder: (context, index) {
            final favorito = controller.favoritos[index];
            final plato = favorito['plato'] as Map<String, dynamic>;
            return _favoritoItem(favorito, plato);
          },
        ),
      );
    });
  }

  Widget _messageState({
    required IconData icon,
    required String title,
    required String message,
    Widget? action,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, size: 34, color: AppColors.primary),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textMedium,
                height: 1.5,
              ),
            ),
            if (action != null) ...[const SizedBox(height: 14), action],
          ],
        ),
      ),
    );
  }

  Widget _favoritoItem(
    Map<String, dynamic> favorito,
    Map<String, dynamic> plato,
  ) {
    final nombre = (plato['nombre'] ?? 'Plato sin nombre').toString();
    final historia = (plato['historia'] ?? plato['descripcion'] ?? '')
        .toString();
    final calorias = plato['calorias'];
    final favoritoId = favorito['id'];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEDE5DF), width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.restaurant, size: 24, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  calorias == null ? historia : '$calorias kcal',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: AppColors.textMedium),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: favoritoId is int
                ? () => controller.quitarFavorito(favoritoId)
                : null,
            icon: Icon(Icons.favorite_rounded, color: AppColors.primary),
            tooltip: 'Quitar de favoritos',
          ),
        ],
      ),
    );
  }
}
