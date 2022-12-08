import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
   PageOne({super.key,this.txt = ''});

  String txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page one"),
      ),
      body: Center(child: Text(txt)),
    );
  }
}
