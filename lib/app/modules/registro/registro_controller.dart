import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../routes/app_routes.dart';

class RegistroController extends GetxController {
  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmarPasswordController = TextEditingController();
  final isLoading = false.obs;

  final _supabase = Supabase.instance.client;

  Future<void> registro() async {
    final nombre = nombreController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmarPassword = confirmarPasswordController.text;

    if (nombre.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Datos incompletos',
        'Completa nombre, correo y contrasena.',
      );
      return;
    }

    if (password.length < 6) {
      Get.snackbar('Contrasena corta', 'Usa al menos 6 caracteres.');
      return;
    }

    if (password != confirmarPassword) {
      Get.snackbar('Contrasenas distintas', 'Confirma la misma contrasena.');
      return;
    }

    try {
      isLoading.value = true;

      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'nombre': nombre},
      );

      if (response.session == null) {
        Get.snackbar(
          'Cuenta creada',
          'Revisa tu correo para confirmar la cuenta antes de iniciar sesion.',
        );
        Get.offAllNamed(AppRoutes.login);
        return;
      }

      Get.offAllNamed(AppRoutes.nav);
    } on AuthException catch (error) {
      Get.snackbar('No se pudo registrar', error.message);
    } catch (_) {
      Get.snackbar('Error', 'Ocurrio un problema al crear la cuenta.');
    } finally {
      isLoading.value = false;
    }
  }

  void irALogin() {
    Get.back();
  }

  @override
  void onClose() {
    nombreController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmarPasswordController.dispose();
    super.onClose();
  }
}
