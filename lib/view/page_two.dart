import 'package:flutter/material.dart';


class PageTwo extends StatelessWidget {
   PageTwo({super.key,this.txt=''});
String txt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page two'),
      ),
      body: Center(child: Text(txt),),
    );
  }
}
