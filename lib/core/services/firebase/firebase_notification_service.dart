import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationService {
  final FirebaseMessaging _messaging;

  FirebaseNotificationService(this._messaging);

  Future<void> initialize() async {
    // Request permissions for iOS
    await _messaging.requestPermission();

    // Get the device token
    String? token = await _messaging.getToken();
    print('[FCM] Device Token: $token');

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
        '[FCM] Foreground Message: ${message.notification?.title} - ${message.notification?.body}',
      );
      // Handle foreground notification here
    });

    // Listen for background & terminated state messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('[FCM] Message opened app: ${message.notification?.title}');
      // Handle notification tap
    });
  }

  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }
}
