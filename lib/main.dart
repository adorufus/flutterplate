import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:badiklat/core/app_routes.dart';
import 'package:badiklat/core/di.dart';
import 'package:badiklat/core/services/firebase/firebase_analytic_service.dart';
import 'package:badiklat/core/services/firebase/firebase_notification_service.dart';
import 'package:badiklat/core/services/firebase/firebase_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.notification!.body}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.init();
  await initDependencies();

  final FirebaseAnalyticService analyticService =
      Get.find<FirebaseAnalyticService>();
  analyticService.logEvent("test_event", parameters: {'debug': "true"});

  final FirebaseNotificationService notificationService =
      Get.find<FirebaseNotificationService>();
  notificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

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
