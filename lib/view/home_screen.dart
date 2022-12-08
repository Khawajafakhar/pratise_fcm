import 'package:flutter/material.dart';
import '../services/init_functions.dart';
import '../consts/app_texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
//When the app is in terminated state
    InitFunctions.initialMessage(context);
//when the notification clicked in background state
    InitFunctions.onMessageOpenedApp(context);
//when the app is in forground state
    InitFunctions.onMessage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(homeAppBarText),
      ),
      body: const Center(
        child: Text(homeBodyText),
      ),
    );
  }
}
