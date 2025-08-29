import 'package:badiklat/remote/repositories/auth_repository.dart';
import 'package:get/get.dart';
import 'package:badiklat/core/app_routes.dart';
import 'package:badiklat/core/services/firebase/firebase_analytic_service.dart';
import 'package:badiklat/core/services/local_storage_service.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  final FirebaseAnalyticService analyticService =
      Get.find<FirebaseAnalyticService>();
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();

  AuthController(this.authRepository);

  void onLogin() async {
    await authRepository.onLogin().then((response) {
      analyticService.logEvent('login', parameters: {'method': 'email'});
      localStorageService.saveAny("mock_token", "MockTOken212020102").then((
        res,
      ) {
        print(res);
      });
      Get.toNamed(AppRoutes.dashboardPath, arguments: {'is_skip_auth': false});
    });
  }
}
