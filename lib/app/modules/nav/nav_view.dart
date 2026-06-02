import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../home/home_binding.dart';
import '../home/home_view.dart';
import '../buscar/buscar_binding.dart';
import '../buscar/buscar_view.dart';
import '../favoritos/favoritos_binding.dart';
import '../favoritos/favoritos_view.dart';
import '../perfil/perfil_binding.dart';
import '../perfil/perfil_view.dart';
import 'nav_controller.dart';

class NavView extends GetView<NavController> {
  const NavView({super.key});

  // títulos del AppBar según el tab activo
  static const _titles = ['SaborLens', 'Buscar', 'Favoritos', 'Perfil'];

  // inicializamos los controllers de cada tab al arrancar el navbar
  // usamos Get.put para que estén listos antes de que se muestren
  static void _initBindings() {
    HomeBinding().dependencies();
    BuscarBinding().dependencies();
    FavoritosBinding().dependencies();
    PerfilBinding().dependencies();
  }

  @override
  Widget build(BuildContext context) {
    // iniciamos los bindings de todos los tabs
    _initBindings();

    // las 4 pantallas — se crean una sola vez y se mantienen vivas
    final screens = const [
      HomeView(),
      BuscarView(),
      FavoritosView(),
      PerfilView(),
    ];

    return Obx(() => Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        // título cambia según el tab activo
        title: controller.currentIndex.value == 0
            ? Text(
                'SaborLens',
                style: GoogleFonts.fraunces(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  letterSpacing: -0.3,
                ),
              )
            : Text(
                _titles[controller.currentIndex.value],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
      ),

      // IndexedStack mantiene vivas todas las pantallas
      // así no se reinician al cambiar de tab
      body: IndexedStack(
        index: controller.currentIndex.value,
        children: screens,
      ),

      // navbar inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.cambiarTab,
        type: BottomNavigationBarType.fixed, // necesario para 4+ tabs
        backgroundColor: AppColors.cardBg,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: const Color(0xFFC4B0A0),
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search_rounded),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite_rounded),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Perfil',
          ),
        ],
      ),
    ));
  }
}