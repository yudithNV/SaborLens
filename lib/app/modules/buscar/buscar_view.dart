import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import 'buscar_controller.dart';

class BuscarView extends GetView<BuscarController> {
  const BuscarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // barra de búsqueda
          TextField(
            onChanged: controller.onQueryChanged,
            style: TextStyle(fontSize: 14, color: AppColors.textDark),
            decoration: InputDecoration(
              hintText: 'Buscar plato boliviano...',
              hintStyle: TextStyle(color: const Color(0xFFC4B0A0)),
              prefixIcon: Icon(Icons.search_outlined,
                  color: AppColors.textMedium, size: 20),
              filled: true,
              fillColor: AppColors.cardBg,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                    color: Color(0xFFE8DDD6), width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                    color: Color(0xFFE8DDD6), width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide:
                    BorderSide(color: AppColors.primary, width: 1),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text(
            'Platos populares',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 12),

          // lista reactiva — se actualiza al escribir
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.platosFiltrados.length,
              itemBuilder: (context, index) {
                final plato = controller.platosFiltrados[index];
                return _platoItem(plato);
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _platoItem(Map<String, dynamic> plato) {
    return GestureDetector(
      onTap: () => controller.verDetalle(plato),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: const Color(0xFFEDE5DF), width: 0.5),
        ),
        child: Row(
          children: [
            // imagen placeholder
            Container(
              width: 52, height: 52,
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.restaurant,
                  size: 24,
                  color: AppColors.primary.withOpacity(0.3)),
            ),
            const SizedBox(width: 12),

            // info del plato
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plato['nombre'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 11, color: AppColors.textMedium),
                      const SizedBox(width: 2),
                      Text(
                        plato['origen'],
                        style: TextStyle(
                            fontSize: 11, color: AppColors.textMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ícono de favorito
            Icon(Icons.favorite_outline,
                size: 20, color: const Color(0xFFE8DDD6)),
          ],
        ),
      ),
    );
  }
}