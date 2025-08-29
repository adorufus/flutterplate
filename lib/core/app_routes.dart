import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:badiklat/modules/auth/bindings.dart';
import 'package:badiklat/modules/auth/views/login_view.dart';
import 'package:badiklat/modules/dashboard/bindings.dart';
import 'package:badiklat/modules/dashboard/views/dashboard_view.dart';

class AppRoutes {
  static String authPath = '/auth';
  static String dashboardPath = '/dashboard';

  static final pages = [
    GetPage(name: authPath, page: () => LoginView(), binding: AuthBindings()),
    GetPage(
      name: dashboardPath,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
