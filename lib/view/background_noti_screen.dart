import 'package:flutter/material.dart';


class BackgroundNotiScreen extends StatelessWidget {
  static const routName ='background-notification';
  BackgroundNotiScreen({super.key, this.txt=''});
  String txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background notification'),
      ),
      body: Center(
        child: Text(txt),
      ),
    );
  }
}
