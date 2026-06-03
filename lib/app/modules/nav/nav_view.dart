import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../favoritos/favoritos_binding.dart';
import '../favoritos/favoritos_view.dart';
import '../home/home_binding.dart';
import '../home/home_view.dart';
import '../perfil/perfil_binding.dart';
import '../perfil/perfil_view.dart';
import 'nav_controller.dart';

class NavView extends GetView<NavController> {
  const NavView({super.key});

  static const _titles = ['SaborLens', 'Favoritos', 'Perfil'];

  static void _initBindings() {
    HomeBinding().dependencies();
    FavoritosBinding().dependencies();
    PerfilBinding().dependencies();
  }

  @override
  Widget build(BuildContext context) {
    _initBindings();

    final screens = const [HomeView(), FavoritosView(), PerfilView()];

    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: controller.currentIndex.value == 0
              ? Text(
                  'SaborLens',
                  style: GoogleFonts.fraunces(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                    letterSpacing: 0,
                  ),
                )
              : Text(
                  _titles[controller.currentIndex.value],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.cambiarTab,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.cardBg,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: const Color(0xFFC4B0A0),
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
