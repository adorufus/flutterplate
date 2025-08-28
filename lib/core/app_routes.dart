import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:newapp/modules/auth/bindings.dart';
import 'package:newapp/modules/auth/views/auth_view.dart';
import 'package:newapp/modules/dashboard/bindings.dart';
import 'package:newapp/modules/dashboard/views/dashboard_view.dart';

class AppRoutes {
  static String authPath = '/auth';
  static String dashboardPath = '/dashboard';

  static final pages = [
    GetPage(name: authPath, page: () => AuthView(), binding: AuthBindings()),
    GetPage(
      name: dashboardPath,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
