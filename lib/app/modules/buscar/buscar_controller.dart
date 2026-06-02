import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class BuscarController extends GetxController {
  // texto de búsqueda
  final RxString query = ''.obs;

  // datos mock de platos bolivianos
  final List<Map<String, dynamic>> _todosLosPlatos = [
    {'nombre': 'Silpancho Cochabambino', 'origen': 'Cochabamba', 'calorias': '650 kcal', 'tiempo': '35 min'},
    {'nombre': 'Salteña Paceña',         'origen': 'La Paz',     'calorias': '320 kcal', 'tiempo': '20 min'},
    {'nombre': 'Fricasé',                'origen': 'La Paz',     'calorias': '580 kcal', 'tiempo': '60 min'},
    {'nombre': 'Pique Macho',            'origen': 'Cochabamba', 'calorias': '750 kcal', 'tiempo': '40 min'},
    {'nombre': 'Sopa de Maní',           'origen': 'Cochabamba', 'calorias': '420 kcal', 'tiempo': '45 min'},
    {'nombre': 'Chicharrón de Cerdo',    'origen': 'Cochabamba', 'calorias': '700 kcal', 'tiempo': '50 min'},
    {'nombre': 'Majadito',               'origen': 'Santa Cruz', 'calorias': '480 kcal', 'tiempo': '30 min'},
    {'nombre': 'Locro',                  'origen': 'Oruro',      'calorias': '390 kcal', 'tiempo': '55 min'},
  ];

  /// Platos filtrados según el texto de búsqueda
  List<Map<String, dynamic>> get platosFiltrados {
    if (query.value.isEmpty) return _todosLosPlatos;
    return _todosLosPlatos
        .where((p) => p['nombre']
            .toString()
            .toLowerCase()
            .contains(query.value.toLowerCase()))
        .toList();
  }

  /// Actualiza el texto de búsqueda
  void onQueryChanged(String value) {
    query.value = value;
  }

  /// Navega al detalle del plato seleccionado
  void verDetalle(Map<String, dynamic> plato) {
    Get.toNamed(AppRoutes.detalle, arguments: plato);
  }
}