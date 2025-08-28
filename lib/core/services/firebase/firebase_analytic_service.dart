import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticService {
  final FirebaseAnalytics analytics;

  FirebaseAnalyticService(this.analytics);

  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    await analytics.logEvent(name: name, parameters: parameters);
  }

  Future<void> setUserId(String userId) async {
    await analytics.setUserId(id: userId);
  }

  Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {
    await analytics.setUserProperty(name: name, value: value);
  }
}
