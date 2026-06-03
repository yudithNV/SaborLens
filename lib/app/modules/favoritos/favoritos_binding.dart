import 'package:get/get.dart';

import 'favoritos_controller.dart';

class FavoritosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritosController>(() => FavoritosController());
  }
}
