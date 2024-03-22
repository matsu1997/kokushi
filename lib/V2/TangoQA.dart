import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kokushi/V2/ResultTango.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../経穴/ResultKeiketu.dart';
import '../アカウント/SignUp.dart';
import '../その他/Slider.dart';

class TangoQA extends StatefulWidget {

  TangoQA(this.uid,this.name);
  String name;
  String uid;

  @override
  State<TangoQA> createState() => _TangoQAState();
}

class _TangoQAState extends State<TangoQA> {
  List<List> _todoList = [[]];
  var item = [];var item2 = [];
  var first1 = 0;
  var count = 0;
  var text = "";
  var co = 0;
  var mistake = 0;var corect = 0;
  var _counter = 0.0;
  var Qtext = "";
  var Atext = "";
  var kamoku = "";
  var f4 = "";
  var f5 = "";
  var Id = "";
  var answer = "";
  var start = "スタート";
  var uid = "";
  var OUText = "問題";
  bool OK = false;
  bool Start = true;
  bool re = false;
  bool X = false;
  bool OUTex = false;
  var map = {};
  void initState() {
    super.initState();
   aa();_getCounterValue();
  }

  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
        title: FittedBox(fit: BoxFit.fitWidth, child: Text(widget.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: _counter,), textAlign: TextAlign.center,),),
        iconTheme: IconThemeData(color: Colors.black), centerTitle: true,
        actions: [IconButton(onPressed:() {Navigator.of(context).push(MaterialPageRoute(builder: (context) => Slider1())).then((value) { setState(() {_getCounterValue();});});}, icon: Icon(Icons.text_format))],
      ),
      body: Container(
        margin: EdgeInsets.only(top:80),
        child: Column(
          children: <Widget>[
            Container(
              //  color: Colors.white,
                margin: EdgeInsets.only(top: 3, left: 20, right: 20),
                // height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 5, blurRadius: 5, offset: Offset(1, 1),),],
                  color: Colors.white,
                ),
                child: Column(children: <Widget>[
                  Container(width: double.infinity,height: 200, margin: EdgeInsets.all(10), alignment: Alignment.center,
                    // child:FittedBox(
                    //   fit: BoxFit.fitWidth,
                      child: Text(text, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: _counter,), textAlign: TextAlign.center,),
                  //  ),
                  ),
                ])),
            Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(left:20,),
                      child: Visibility(
                        visible: OUTex,
                        child: Text(
                          OUText,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),)
                  ),
                  Container(
                      width: 30,
                      margin: EdgeInsets.only(left: 0),
                      child: Visibility(
                        visible: re,
                        child: IconButton(
                          icon: Icon(Icons.repeat,color: Colors.blue,),
                          onPressed: () {
                            setState(() {
                              if (co == 0) {
                                re0();
                              } else {
                                re1();
                              }});
                          },
                        ),)
                  )
                ],
              ),),

            Container(
             margin: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Row(children: <Widget>[
                Expanded(
                  child: Container(
                     height: 90,
                    width: 90,
                    //margin: EdgeInsets.only(left: 10, right: 10),
                child: Visibility(
                  visible: OK,
                    child: ElevatedButton(
                      child: const Text('覚えた',style: TextStyle(fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.green,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () {next();corect = corect + 1;},
                    ),
                  ),)
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 90,
                    width: 90,
                   // margin: EdgeInsets.only(left: 10, right: 10),
                    child: Visibility(
                      visible: OK,
                    child: ElevatedButton(
                      child: const Text('まだ',style: TextStyle(fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.red,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () {next();firebase();mistake = mistake + 1;},
                    ),
                  ),)
                )

              ]),
            ),
          ],
        ),
      ),
    );
  }
  void next() {
    setState(() {
      OUText = "問題";
      OK  = false;
      X = false;
      count += 1;
      co = 0;
      if(count < item.length) {
        text = item[count]["Qtext"];
        Qtext = item[count]["Qtext"];
        Atext = item[count]["Atext"];
        kamoku = item[count]["kamoku"];
      }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultTango(item,widget.name,mistake,corect)),
        );
      }});
  }
  void _getCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getDouble("size")?? 20.0;
  }

Future<void> firebase() async {
  map = { 'Qtext': Qtext, 'Atext': Atext, 'kamoku': kamoku,};
  DocumentReference ref = FirebaseFirestore.instance.collection('users').doc(uid);
  ref.update({"単語帳": FieldValue.arrayUnion([map]),});map = {};
}

  void set()  {
    FirebaseFirestore.instance.collection('SCard').doc(widget.uid).collection("単語帳名").doc(widget.name).collection("問題")
        .get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {item.add(doc);Qtext = item[count]["Qtext"];
        print(["(11)" +"1"+ "(11)","(11)" +doc["Qtext"]+ "(11)","(11)" +doc["Atext"]+ "(11)","(11)" +doc["kamoku"]+ "(11)"]);
        });
        ;});});
    Future.delayed(Duration(seconds: 1)).then((_) {      setState(() {
      Start = false;
      re = true;
      OUTex = true;
      text = item[count]["Qtext"];
      Qtext = item[count]["Qtext"];
      Atext = item[count]["Atext"];
      kamoku = item[count]["kamoku"];
    });;});}


  void first() {if (first1 == 0) {text = item[count]["Qtext"];first1 = 1;}}
  void re0() {setState(() {OUText = "答え";OK  = true;X = true;text = item[count]["Atext"];co = 1;});}
  void re1() {setState(() {OUText = "問題";OK  = true;X = true;text = item[count]["Qtext"];});co = 0;}


  void aa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("アカウント") ?? "";
    if (uid == "") {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));}else{set();}
  }

}
