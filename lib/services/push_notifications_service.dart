// cd android && ./gradlew signingReport
// SHA1: 47:20:97:C9:8F:24:1D:DB:83:10:7B:8E:C7:5F:43:7B:EE:E0:C8:EE

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';

class PushNotificationService{
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message)async{
    // print('_backgroundHandler ${message.messageId}');
    _messageStream.add(message.data['product'] ?? 'No Data');
  }

  static Future _onMessageHandler(RemoteMessage message)async{
    // print('_onMessageHandler ${message.messageId}');
    _messageStream.add(message.data['product'] ?? 'No Data');
  }

  static Future _onMessageOpenApp(RemoteMessage message)async{
    // print('_onMessageOpenApp ${message.messageId}');
    _messageStream.add(message.data['product'] ?? 'No Data');
  }

  static Future initializeApp()async{
    //Push Notifications

    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //Local Notifications
  }

  static closeStreams()async{
    _messageStream.close();
  }
}