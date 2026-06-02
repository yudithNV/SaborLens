import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class PerfilController extends GetxController {
  void cerrarSesion() {
    // cuando conectes Supabase, aquí va el signOut
    Get.offAllNamed(AppRoutes.login);
  }
}