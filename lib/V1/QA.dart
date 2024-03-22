import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kokushi/%E3%81%9D%E3%81%AE%E4%BB%96/Slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../V8/URL.dart';
import 'Result.dart';
import '../アカウント/SignUp.dart';
import 'kaisetu.dart';
import '../その他/mail.dart';
import '../main.dart';

class QA extends StatefulWidget {


  QA(this.name,this.Kamoku);
  String name;
  String Kamoku;
  @override
  State<QA> createState() => _QAState();
}
enum Menu {huan,mis,size }
class _QAState extends State<QA> {
  @override
  var item = [];
  var item1 = [];
  var uid = "";
  var co = 0;
  var reCo = 0;
  var _counter = 0.0;
  var textSize = 20.0;
  var mistake = 0;var corect = 0;
  var f1 = "";
  var f2 = "";
  var f3 = "";
  var f4 = "";
  var f5 = "";
  var text = "";
  var Id = "";
  var answer = "";
  var start = "スタート";
  var barText = "";
  var mailText = "";
  var QALabel = "問題";
  var color = Colors.blue;
  var colorB1 = Colors.blue;
  var colorB2 = Colors.blue;
  var colorB3 = Colors.blue;
  var colorB4 = Colors.blue;
  var color1 = Colors.white;
  var color2 = Colors.white;
  var color3 = Colors.white;
  var color4 = Colors.white;
  bool KaisetuB = true;
  bool reB = true;
  bool EditB = true;
  bool NextB = true;
  bool AnswerL = true;
  bool _A1B = true;
  bool _A2B = true;
  bool _A3B = true;
  bool _A4B = true;
  bool _NextB = true;

  bool A1B = false;
  bool A2B = false;
  bool A3B = false;
  bool A4B = false;
  // bool A1B = true;
  // bool A2B = true;
  // bool A3B = true;
  // bool A4B = true;

  var map = {};

  @override
  @override
  void initState() {
    super.initState();
    aa();
    _loadData1();
    _getCounterValue();
    reB = false;
    KaisetuB = false;
    EditB = false;
    AnswerL = false;
    barText =  widget.name;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant QA oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      // Appbar
      appBar: AppBar(
        title: FittedBox(fit: BoxFit.fitWidth, child: Text(widget.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: _counter,), textAlign: TextAlign.center,),),
        centerTitle: true,
        backgroundColor: color,
        actions: [
          PopupMenuButton(
            onSelected: popupMenuSelected,
            icon:Icon(Icons.pending,color: Colors.white,),
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<Menu>>[
              const PopupMenuItem( child: const ListTile( leading:Icon(Icons.mail),
                  title:Text("間違いを報告する")), value: Menu.mis,),
              const PopupMenuItem( child: const ListTile( leading:Icon(Icons.format_color_text),
                  title:Text("文字サイズ変更")), value: Menu.size),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("次"),
        onPressed: () {
          if(item.length == 0){_loadData1();}else{
            co += 1;
            start = "次";
            next();}
        },
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                height: 50,
                child: Row(children: <Widget>[
                  Container(width: 10),
                  Container(
                    child: Text(QALabel,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,),),
                  ),
                  Container(
                      height: 50,
                      child: Visibility(
                        visible: reB,
                        child: IconButton(
                        icon: Icon(Icons.repeat,color: Colors.blue,),
                          onPressed: () {
                            setState(() {
                              if(reCo == 0){
                                QALabel = "問題";
                                text = item[co]["text"];
                                reCo = 1;
                                KaisetuB = false;
                              }else{
                                QALabel = "解説";
                                if (item1.length != 0){
                                  text = item1[0]["Atext"];}else{text = "";}
                                reCo = 0;
                                KaisetuB = true;
                              }});
                          },
                        ),)
                  ),
                 Container(margin: EdgeInsets.only(left: 10),child:Visibility(
                    visible: reB,
                    child: ElevatedButton(
                      child: const Text('不安'),
                      style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.yellow[800], shape: const StadiumBorder(),),
                      onPressed: () {huan();},
                    ),))
                ])),
            Container(height: 200, width: double.infinity,
                child: Column(children: <Widget>[
                  Expanded(child: Stack(children: <Widget>[
                    new Center(child: Container(margin: EdgeInsets.all(10), width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 5, blurRadius: 5, offset: Offset(1.5, 1.5),),], color: Colors.white,),
                      alignment: Alignment.center,
                        child:Text(text,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: _counter), textAlign: TextAlign.center,),
                   )),
      Container(
          width: double.infinity, height:double.infinity,
          margin: EdgeInsets.only(left: 10,right: 10),
          child: Visibility(visible: KaisetuB,
                child: Column(children: [
                  Container(margin: EdgeInsets.only(top: 80,bottom: 0),width: double.infinity, child: TextButton(child:Text('LINE.OpenChatで質問',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.blue, decoration: TextDecoration.underline,)),
                    onPressed: () async {
                      final data = ClipboardData(text: '問題:' +  item[co]["text"]  + "\n" + f1 +"\n" + f2 +"\n" + f3 + "\n" + f4 +"\n" + "答え:" +f5 + "番");
                      Clipboard.setData(data);
                      final url = Uri.parse('https://line.me/ti/g2/tqfeu7x4tj8AovbYoFgse_qLhNt5aZKTxXEwOw?utm_source=invitation&utm_medium=link_copy&utm_campaign=default');
                      launchUrl(url);},),),
                  Container(margin:EdgeInsets.only(top:5),width: double.infinity,child: Text("問題は自動でコピーされます\n情報収集の場としてもどうぞ",style: TextStyle(fontSize:10,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),textAlign: TextAlign.center,),),
                ],)))])),//https://line.me/ti/g2/tqfeu7x4tj8AovbYoFgse_qLhNt5aZKTxXEwOw?utm_source=invitation&utm_medium=link_copy&utm_campaign=default
                ])),
            Container(
              height: 20,
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                child: Visibility(
                  visible: A1B,
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top:5,bottom: 5,left: 10,right: 10),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: color,
                              backgroundColor: color1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side:  BorderSide(color: colorB1 ,width: 5 ),
                            ),
                            onPressed: !_A1B ? null :() {
                              setState(() {
                              answer = "1";judge();});
                              },
                            //child: Text(item[co]["f1"]),
                            // child: Text(f1,style: TextStyle(color: Colors.black),),
                            child:FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(f1, style: TextStyle(fontSize: _counter,color: Colors.black,fontWeight: FontWeight.bold,),
                              ),),
                          ),
                        ),)
                      ),
                      Expanded(
                          child: Visibility(
                            visible: A2B,
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top:5,bottom: 5,left: 10,right: 10),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: color,
                              backgroundColor: color2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: BorderSide(color: colorB2,width: 5),
                            ),
                            onPressed:!_A2B ? null : () {answer = "2";judge();},
                            child:FittedBox(
                              fit: BoxFit.contain,
                              child: Text(f2, style: TextStyle(fontSize: _counter,color: Colors.black,fontWeight: FontWeight.bold,),
                              ),),
                          ),
                        ),)
                      ),
                      Expanded(
                          child: Visibility(
                            visible: A3B,
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top:5,bottom: 5,left: 10,right: 10),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: color,
                              backgroundColor: color3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side:  BorderSide(color: colorB3,width: 5),
                            ),
                            onPressed:!_A3B ? null : () {answer = "3";judge();},
                            child:FittedBox(fit: BoxFit.fitWidth,
                              child: Text(f3, style: TextStyle(fontSize: _counter,color: Colors.black,fontWeight: FontWeight.bold,),
                              ),),
                          ),
                        ),)
                      ),
                      Expanded(
                          child: Visibility(
                            visible: A4B,
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top:5,bottom: 5,left: 10,right: 10),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: color,
                              backgroundColor: color4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side:  BorderSide(color:colorB4,width: 5),
                            ),
                            onPressed:!_A4B ? null : () {answer = "4";judge();},
                            child:FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(f4, style: TextStyle(fontSize: _counter,color: Colors.black,fontWeight: FontWeight.bold,),
                              ),),
                          ),
                        ),)

                      ),
                      Container(
                       height: 60,
                        ),
                ])),
          ],
        ),
      ),
    );
  }

  void next() {
    reCo = 0;
    textSize = 20;
    setState(() {
    AnswerL = false;
    reB = false;
    KaisetuB = false;
    EditB = false;
    NextB = false;
    _A1B  = true;
    _A2B  = true;
    _A3B  = true;
    _A4B  = true;
    A1B  = true;
    A2B  = true;
    A3B  = true;
    A4B  = true;
    color = Colors.blue;
    color1 = Colors.white;
    color2 = Colors.white;
    color3 = Colors.white;
    color4 = Colors.white;
    barText = widget.name;
    QALabel = "問題";
    if(item.length != 0){
    if(co < item.length){
      _loadData();
      f1 = item[co]["f1"];
      f2 = item[co]["f2"];
      f3 = item[co]["f3"];
      f4 = item[co]["f4"];
      f5 = item[co]["f5"];
      text = item[co]["text"];
      Id = item[co]["messageId"];
      mailText = barText + "(" + co.toString() +")" + " : " + item[co]["text"];
    } else{
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Result(item,widget.name,mistake,corect)),
      );}
    }else{
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //       builder: (context) => Result(item)),
      // );
      _loadData1();
    }
  });
  }
  void judge (){
    setState(() {
      KaisetuB = true;
    NextB = true;
    AnswerL = true;
    _A1B  = false;
    _A2B  = false;
    _A3B  = false;
    _A4B  = false;
    QALabel = "解説";
    if (item1.length != 0){
    text = item1[0]["Atext"];}else{text = "";}
     reB = true;
      switch (f5){
        case "1": color1 = Colors.blue;colorB1 = Colors.blue;
        break;
        case "2":color2 = Colors.blue;colorB2 = Colors.blue;
        break;
        case "3":color3 = Colors.blue;colorB3 = Colors.blue;
        break;
        case "4":color4 = Colors.blue;colorB4 = Colors.blue;
      }
    if (f5 ==  answer){
      barText = "◯";
      textSize = 40;corect = corect +1;
    }else{
mis();
barText = "✖︎";
textSize = 30;mistake = mistake + 1;
 color = Colors.red;
    }
    });
  }
  void popupMenuSelected(Menu selectedMenu){
    switch(selectedMenu) {
      case Menu.huan:huan();
        break;
      case Menu.mis:Navigator.of(context).push(MaterialPageRoute(builder: (context) => mail(mailText)));
        break;
      case Menu.size:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Slider1())).then((value) { setState(() {_getCounterValue();});});
      break;
    }}
  void _loadData()  {
    item1 = [];
    FirebaseFirestore.instance.collection('SCard').doc("kaisetu").collection(uid).doc(widget.name).collection(item[co]["messageId"]).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {setState(() {item1.add(doc);;});});});
    if (item1.length == 0){
      item1 = [];
    }
  }

  void _loadData1()  {
    FirebaseFirestore.instance.collection('SCard').doc("All").collection(widget.name).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {item.add(doc);});next();
        ;});});}

  Future<void> mis() async {
    map = {"f1" : item[co]["f1"], "f2" :item[co]["f2"], "f3" : item[co]["f3"], "f4" : item[co]["f4"], "f5" : item[co]["f5"], "text" : item[co]["text"], "Kamoku":widget.Kamoku,};
   DocumentReference ref = FirebaseFirestore.instance.collection('users').doc(uid);
   ref.update({"4択間違い": FieldValue.arrayUnion([map]),});map = {};
  }

  Future<void> huan() async {
    map = {"f1" : item[co]["f1"], "f2" :item[co]["f2"], "f3" : item[co]["f3"], "f4" : item[co]["f4"], "f5" : item[co]["f5"], "text" : item[co]["text"], "Kamoku":widget.Kamoku,};
    DocumentReference ref = FirebaseFirestore.instance.collection('users').doc(uid);
    ref.update({"不安": FieldValue.arrayUnion([map]),});map = {};
    setState(() {barText = "保存しました";textSize = 20;});
    }

  void _getCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     _counter = prefs.getDouble("size")?? 20.0;
  }



  void showProgressDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });}

  void aa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("アカウント") ?? "";
    if (uid == "") {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));}else{}
  }
}
