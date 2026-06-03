import 'package:get/get.dart';

import '../modules/detalle/detalle_binding.dart';
import '../modules/detalle/detalle_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/nav/nav_binding.dart';
import '../modules/nav/nav_view.dart';
import '../modules/registro/registro_binding.dart';
import '../modules/registro/registro_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.registro,
      page: () => const RegistroView(),
      binding: RegistroBinding(),
    ),
    GetPage(
      name: AppRoutes.nav,
      page: () => const NavView(),
      binding: NavBinding(),
    ),
    GetPage(
      name: AppRoutes.detalle,
      page: () => const DetalleView(),
      binding: DetalleBinding(),
    ),
  ];
}
