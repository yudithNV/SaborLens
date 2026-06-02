import 'package:get/get.dart';
import 'buscar_controller.dart';

class BuscarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BuscarController>(BuscarController());
  }
}