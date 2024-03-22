import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../その他/Slider.dart';
import '../その他/fab_animation.dart';
import '../アカウント/SignUp.dart';

class V7Print extends StatefulWidget {
  V7Print(this.text, this.ImgId, this.messageId,this.Page,this.textRe);

  String text;
  String ImgId;
  String messageId;
  String Page;
  String textRe;


  @override
  State<V7Print> createState() => _V7PrintState();
}

class _V7PrintState extends State<V7Print> {
  // This widget is the root of your application.
  @override
  bool aka = true;
  var uid = "";
  var co = 0;
  var coRe = 0;
  var coColor = 0;
  var colorbid = 0.03;
  var color = Colors.red;
  var barText = "";
  var text = "シートOFF";
  var textColor = "緑";
  var position = const Offset(0, 0);
  double top = 100.0 as double;
  double bottom = 60.0 as double;
  double left = 0.0 as double;
  double right = 0.0 as double;
  double mediaWidth = 80;
  double scaleWidthFactor = 1;
  double minWidth = 40;
  double maxWidth = 160;
  var _counter = 0.0;
  void initState() {
    super.initState();
    aa();
    _getCounterValue();
    barText = widget.text;
    //widget.ImgId = "images/IMG_7657.png";
  }
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,elevation: 0,
          title: Text(widget.text,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          actions: [ IconButton(
              onPressed: () { Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => Slider2(widget.ImgId)),).then((value) => _getCounterValue());},
              icon: Icon(Icons.light))],
        ),
        floatingActionButton: ExpandableFab(
          distance: 112.0,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  if (co == 0) {
                    text = "シートON";
                    aka = false;
                    co = 1;
                  } else {
                    text = "シートOFF";
                    aka = true;
                    co = 0;
                  }
                });},
              label: Text(text),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  if (widget.Page == "0"){
                    if (coRe == 0) {
                      widget.textRe = "追加済み";
                      add();
                      coRe = 1;}
                  }else{
                    if (coRe == 0) {
                      widget.textRe = "削除済み";
                      delete();
                      coRe = 1;}
                  }
                });},
              label: Text(widget.textRe),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  if (coColor == 0) {
                    textColor = "赤";
                    color = Colors.green;
                    coColor = 1;
                  } else {
                    textColor = "緑";
                    color = Colors.red;
                    coColor = 0;
                  }
                });
              },
              label: Text(textColor),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child:Stack(
            children: <Widget>[
              Container(margin: EdgeInsets.only(top:10),alignment: Alignment.topCenter,width: double.infinity,child:Image.asset("images/IMG_7867.jpg",fit: BoxFit.contain,)),
              Container(child:
              new IgnorePointer(
                ignoring: true,
                child: Stack(children: <Widget>[
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                  new Center(
                    child: Visibility(
                      visible: aka,
                      child: Container(
                        margin: new EdgeInsets.only(
                            top: top, bottom: bottom, left: left, right: right),
                        color: color[900]?.withOpacity(colorbid),
                      ),
                    ),
                  ),
                ]),)),
            ],
            // fit: StackFit.expand
          ),)
    );
  }

  void aa() async {SharedPreferences prefs = await SharedPreferences.getInstance();
  uid = prefs.getString("アカウント")?? "";
  if (uid == ""){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUp();}));})
        ;} else {uid = user.uid;}});}}
  Future<void> add() async {
    var aa =  randomString(20);
    await FirebaseFirestore.instance
        .collection('users').doc(uid)// コレクションID指定
        .collection("暗記復習").doc(aa)// ドキュメントID自動生成
        .set({
      "messageId" : aa,
      "ImgId": widget.ImgId,
      "text":widget.text
    });
  }
  Future<void> delete() async {
    print(widget.messageId);
    await FirebaseFirestore.instance
        .collection('users').doc(uid)// コレクションID指定
        .collection("暗記復習").doc(widget.messageId).delete();
  }
  String randomString(int length) {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },
    );
    return new String.fromCharCodes(codeUnits);
  }
  void _getCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getDouble("light")?? 0.3; setState(() {});
  }
}


// class V7Print extends StatefulWidget {
//   V7Print(this.text, this.ImgId, this.messageId,this.Page,this.textRe);
//
//   String text;
//   String ImgId;
//   String messageId;
//   String Page;
//   String textRe;
//
//
//   @override
//   State<V7Print> createState() => _V7PrintState();
// }
//
// class _V7PrintState extends State<V7Print> {
//   // This widget is the root of your application.
//   @override
//   bool aka = true;
//   var uid = "";
//   var co = 0;
//   var coRe = 0;
//   var coColor = 0;
//   var colorbid = 0.03;
//   var color = Colors.red;
//   var barText = "";
//   var text = "シートOFF";
//   var textColor = "緑";
//   var position = const Offset(0, 0);
//   double top = 100.0 as double;
//   double bottom = 60.0 as double;
//   double left = 0.0 as double;
//   double right = 0.0 as double;
//   double mediaWidth = 80;
//   double scaleWidthFactor = 1;
//   double minWidth = 40;
//   double maxWidth = 160;
//   var _counter = 0.0;
//   void initState() {
//     super.initState();
//     aa();
//     _getCounterValue();
//     barText = widget.text;
//     //widget.ImgId = "images/IMG_7657.png";
//   }
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,elevation: 0,
//           title: Text(widget.text,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
//           iconTheme: IconThemeData(color: Colors.black),
//           centerTitle: true,
//           actions: [ IconButton(
//               onPressed: () { Navigator.of(context).push(
//                 MaterialPageRoute(
//                     builder: (context) => Slider2(widget.ImgId)),).then((value) => _getCounterValue());},
//               icon: Icon(Icons.light))],
//         ),
//         floatingActionButton: ExpandableFab(
//           distance: 112.0,
//           children: [
//             FloatingActionButton.extended(
//               onPressed: () {
//                 setState(() {
//                   if (co == 0) {
//                     text = "シートON";
//                     aka = false;
//                     co = 1;
//                   } else {
//                     text = "シートOFF";
//                     aka = true;
//                     co = 0;
//                   }
//                 });},
//               label: Text(text),
//             ),
//             FloatingActionButton.extended(
//               onPressed: () {
//                 setState(() {
//                   if (widget.Page == "0"){
//                     if (coRe == 0) {
//                       widget.textRe = "追加済み";
//                       add();
//                       coRe = 1;}
//                   }else{
//                     if (coRe == 0) {
//                       widget.textRe = "削除済み";
//                       delete();
//                       coRe = 1;}
//                   }
//                 });},
//               label: Text(widget.textRe),
//             ),
//             FloatingActionButton.extended(
//               onPressed: () {
//                 setState(() {
//                   if (coColor == 0) {
//                     textColor = "赤";
//                     color = Colors.green;
//                     coColor = 1;
//                   } else {
//                     textColor = "緑";
//                     color = Colors.red;
//                     coColor = 0;
//                   }
//                 });
//               },
//               label: Text(textColor),
//             ),
//           ],
//         ),
//         body: Container(
//           height: 2000.0,
//           width: 1000,
//           child:Stack(
//             children: <Widget>[
//               InteractiveViewer(
//                 constrained: false,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 1000.0,
//                       width: 500,
//                       child:Container(
//                         // alignment: Alignment(0.0, -0.7),
//                         //  child:Image.network(widget.ImgId),
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage("images/test2.png"),
//                             // image: AssetImage("images/IMG_7657.png"),
//                             // colorFilter: ColorFilter.mode(
//                             //  Colors.white.withOpacity(1),
//                             //   BlendMode.lighten,
//                             // ),
//                           ),),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               new IgnorePointer(
//                 ignoring: true,
//                 child: Stack(children: <Widget>[
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                   new Center(
//                     child: Visibility(
//                       visible: aka,
//                       child: Container(
//                         margin: new EdgeInsets.only(
//                             top: top, bottom: bottom, left: left, right: right),
//                         color: color[900]?.withOpacity(colorbid),
//                       ),
//                     ),
//                   ),
//                 ]),),
//             ],
//             // fit: StackFit.expand
//           ),)
//     );
//   }
//
//   void aa() async {SharedPreferences prefs = await SharedPreferences.getInstance();
//   uid = prefs.getString("アカウント")?? "";
//   if (uid == ""){
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user == null) {
//         Future(() {Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUp();}));})
//         ;} else {uid = user.uid;}});}}
//   Future<void> add() async {
//     var aa =  randomString(20);
//     await FirebaseFirestore.instance
//         .collection('users').doc(uid)// コレクションID指定
//         .collection("暗記復習").doc(aa)// ドキュメントID自動生成
//         .set({
//       "messageId" : aa,
//       "ImgId": widget.ImgId,
//       "text":widget.text
//     });
//   }
//   Future<void> delete() async {
//     print(widget.messageId);
//     await FirebaseFirestore.instance
//         .collection('users').doc(uid)// コレクションID指定
//         .collection("暗記復習").doc(widget.messageId).delete();
//   }
//   String randomString(int length) {
//     const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
//     const _charsLength = _randomChars.length;
//     final rand = new Random();
//     final codeUnits = new List.generate(
//       length,
//           (index) {
//         final n = rand.nextInt(_charsLength);
//         return _randomChars.codeUnitAt(n);
//       },
//     );
//     return new String.fromCharCodes(codeUnits);
//   }
//   void _getCounterValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     _counter = prefs.getDouble("light")?? 0.3; setState(() {});
//   }
// }
