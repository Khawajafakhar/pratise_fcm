import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import './background_noti_screen.dart';
import './page_one.dart';
import './page_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  void initialMessage() async {
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      if (message.data["page"] == "pageOne") {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PageOne(
            txt: message.data['pageOneMessage'].toString(),
          ),
        ));
      }if(message.data["page"] == "pageTwo"){
         // ignore: use_build_context_synchronously
         Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PageTwo(
            txt: message.data['pageTwoMessage'].toString(),
          ),
        ));
      }else if(message.data["page"] != "pageOne" || message.data["page"] != "pageTwo"){
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "No Page provieded to Navigate",
          ),
          duration:  Duration(seconds: 5),
          backgroundColor: Colors.red,
        ),
      );
      }
    }
  }

  @override
  void initState() {
    super.initState();

   initialMessage();

    FirebaseMessaging.onMessage.listen(
      (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message.notification!.body.toString(),
            ),
            duration: const Duration(seconds: 10),
            backgroundColor: Colors.green,
          ),
        );
      },
    );


    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BackgroundNotiScreen(
          txt: message.data['page'].toString(),
        ),
      ));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message.notification!.title.toString(),
          ),
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Test'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
