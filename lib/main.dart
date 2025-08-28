import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:newapp/core/app_routes.dart';
import 'package:newapp/core/di.dart';
import 'package:newapp/core/services/firebase/firebase_analytic_service.dart';
import 'package:newapp/core/services/firebase/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.init();
  await initDependencies();

  final FirebaseAnalyticService analyticService =
      Get.find<FirebaseAnalyticService>();
  analyticService.logEvent("test_event", parameters: {'debug': "true"});

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final FirebaseAnalyticService analyticService =
        Get.find<FirebaseAnalyticService>();

    return GetMaterialApp(
      title: 'Badiklat',
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analyticService.analytics),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.authPath,
      getPages: AppRoutes.pages,
    );
  }
}
