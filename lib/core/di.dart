import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';
import 'package:newapp/core/services/firebase/firebase_analytic_service.dart';
import 'package:newapp/core/services/http.service.dart';
import 'package:newapp/core/services/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDependencies() async {
  //http services
  final httpService = HttpService();
  Get.put<HttpService>(httpService, permanent: true);
  //shared prefs service
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final localStorageService = LocalStorageService(prefs);
  Get.put<LocalStorageService>(localStorageService, permanent: true);
  //analytics service
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  Get.put<FirebaseAnalyticService>(FirebaseAnalyticService(analytics));
}
