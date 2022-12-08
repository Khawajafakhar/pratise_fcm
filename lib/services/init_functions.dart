import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/Material.dart';
import '../view/page_one.dart';
import '../view/page_two.dart';
import '../view/background_noti_screen.dart';

class InitFunctions{


  static void initialMessage(BuildContext context) async {
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

   static void onMessage(BuildContext context){
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
 }

 static void onMessageOpenedApp(BuildContext context){
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


}