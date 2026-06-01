import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  void login() {
    Get.offAllNamed(AppRoutes.home);
  }

  void irARegistro() {
    Get.toNamed(AppRoutes.registro);
  }
}