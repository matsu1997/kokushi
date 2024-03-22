import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:webview_flutter/webview_flutter.dart';

class URL extends StatefulWidget {
  URL(this.url);
  String url;
  @override
  State<URL> createState() => _URLState();
}
class _URLState extends State<URL> {

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }


  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
        title: Text("", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body:WebViewWidget(controller: controller,),

    );}

}