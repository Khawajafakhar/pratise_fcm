import 'package:flutter/material.dart';
import '../consts/app_texts.dart';


class BackgroundNotiScreen extends StatelessWidget {
  BackgroundNotiScreen({super.key, this.txt=''});
  String txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(backgroundPageText),
      ),
      body: Center(
        child: Text(txt),
      ),
    );
  }
}
