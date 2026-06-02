import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class RegistroController extends GetxController {
  void registro() {
    Get.offAllNamed(AppRoutes.nav);
  }

  void irALogin() {
    Get.back();
  }
}