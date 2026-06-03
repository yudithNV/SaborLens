import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  final _supabase = Supabase.instance.client;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 900), goToHome);
  }

  void goToHome() {
    final session = _supabase.auth.currentSession;
    Get.offNamed(session == null ? AppRoutes.login : AppRoutes.nav);
  }
}
