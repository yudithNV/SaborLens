import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  final _supabase = Supabase.instance.client;

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Datos incompletos', 'Ingresa tu correo y contrasena.');
      return;
    }

    try {
      isLoading.value = true;

      await _supabase.auth.signInWithPassword(email: email, password: password);

      Get.offAllNamed(AppRoutes.nav);
    } on AuthException catch (error) {
      Get.snackbar('No se pudo iniciar sesion', error.message);
    } catch (_) {
      Get.snackbar('Error', 'Ocurrio un problema al iniciar sesion.');
    } finally {
      isLoading.value = false;
    }
  }

  void irARegistro() {
    Get.toNamed(AppRoutes.registro);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
