import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritosController extends GetxController {
  final favoritos = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  final _supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    cargarFavoritos();
  }

  Future<void> cargarFavoritos() async {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      favoritos.clear();
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final data = await _supabase
          .from('favoritos')
          .select('id, plato_id, creado_en, platos(*)')
          .eq('user_id', user.id)
          .order('creado_en', ascending: false);

      favoritos.assignAll(
        data.map<Map<String, dynamic>>((item) {
          final favorito = Map<String, dynamic>.from(item);
          final plato = favorito['platos'];

          return {
            ...favorito,
            'plato': plato is Map
                ? Map<String, dynamic>.from(plato)
                : <String, dynamic>{},
          };
        }).toList(),
      );
    } on PostgrestException catch (error) {
      errorMessage.value = error.message;
      favoritos.clear();
    } catch (_) {
      errorMessage.value = 'No se pudieron cargar tus favoritos.';
      favoritos.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> quitarFavorito(int favoritoId) async {
    try {
      await _supabase.from('favoritos').delete().eq('id', favoritoId);
      favoritos.removeWhere((favorito) => favorito['id'] == favoritoId);
    } catch (_) {
      Get.snackbar('Favoritos', 'No se pudo quitar el favorito.');
    }
  }
}
