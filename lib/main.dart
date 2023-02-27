import 'package:flutter/material.dart';
import 'package:notifications/screens/screens.dart';
import 'package:notifications/services/push_notifications_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push Notifications',
      initialRoute: 'home',
      routes: {
        'home' : (context) => HomeScreen(),
      }
    );
  }
}