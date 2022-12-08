import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practise_fcm/firebase_options.dart';
import 'package:practise_fcm/services/notification_service.dart';
import './view/home_screen.dart';
import './consts/app_texts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
     
    );
  }
}

