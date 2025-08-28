import 'package:get/get.dart';
import 'package:newapp/core/app_routes.dart';
import 'package:newapp/core/services/firebase/firebase_analytic_service.dart';
import 'package:newapp/core/services/local_storage_service.dart';

class AuthController extends GetxController {
  final FirebaseAnalyticService analyticService =
      Get.find<FirebaseAnalyticService>();
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();

  void onLogin() {
    analyticService.logEvent('login', parameters: {'method': 'email'});
    localStorageService.saveAny("mock_token", "MockTOken212020102").then((res) {
      print(res);
    });
    Get.toNamed(AppRoutes.dashboardPath);
  }
}
