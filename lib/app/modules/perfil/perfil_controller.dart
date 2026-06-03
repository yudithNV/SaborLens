import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../routes/app_routes.dart';

class PerfilController extends GetxController {
  final _supabase = Supabase.instance.client;

  final favoritosCount = 0.obs;
  final isLoadingStats = false.obs;

  User? get user => _supabase.auth.currentUser;

  String get nombre {
    final metadataName = user?.userMetadata?['nombre'];
    if (metadataName != null && metadataName.toString().trim().isNotEmpty) {
      return metadataName.toString().trim();
    }

    final email = user?.email ?? '';
    if (email.contains('@')) return email.split('@').first;
    return 'Usuario';
  }

  String get email => user?.email ?? 'Sin correo';

  @override
  void onInit() {
    super.onInit();
    cargarEstadisticas();
  }

  Future<void> cargarEstadisticas() async {
    final currentUser = user;
    if (currentUser == null) return;

    try {
      isLoadingStats.value = true;
      final data = await _supabase
          .from('favoritos')
          .select('id')
          .eq('user_id', currentUser.id);

      favoritosCount.value = data.length;
    } catch (_) {
      favoritosCount.value = 0;
    } finally {
      isLoadingStats.value = false;
    }
  }

  Future<void> cerrarSesion() async {
    await _supabase.auth.signOut();
    Get.offAllNamed(AppRoutes.login);
  }
}
