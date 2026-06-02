import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import 'favoritos_controller.dart';

class FavoritosView extends GetView<FavoritosController> {
  const FavoritosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ícono empty state
          Container(
            width: 72, height: 72,
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.favorite_outline,
                size: 34,
                color: AppColors.primary.withOpacity(0.4)),
          ),
          const SizedBox(height: 16),
          Text(
            'Sin favoritos aún',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Marca platos como favoritos\ndesde el detalle o la búsqueda',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textMedium,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}