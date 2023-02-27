// cd android && ./gradlew signingReport
// SHA1: 47:20:97:C9:8F:24:1D:DB:83:10:7B:8E:C7:5F:43:7B:EE:E0:C8:EE

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initializeApp()async{
    //Push Notifications

    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    //Local Notifications
  }
}