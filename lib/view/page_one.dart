import 'package:flutter/material.dart';
import 'package:practise_fcm/consts/app_texts.dart';

class PageOne extends StatelessWidget {
   PageOne({super.key,this.txt = ''});

  String txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageOneAppBarText),
      ),
      body: Center(child: Text(txt)),
    );
  }
}
