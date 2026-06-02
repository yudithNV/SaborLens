import 'package:get/get.dart';

class NavController extends GetxController {
  // índice del tab activo (0=Inicio, 1=Buscar, 2=Favoritos, 3=Perfil)
  final RxInt currentIndex = 0.obs;

  /// Cambia el tab activo
  void cambiarTab(int index) {
    currentIndex.value = index;
  }
}