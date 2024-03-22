import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
 // import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../その他/Ankert.dart';


class Result extends StatefulWidget {
  @override
  Result(this.item1,this.name,this.mistake,this.corect);
  List item1;String name;int mistake;int corect;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var co = -1;

  var kamoku = "";

  var uid = "";

  var messageId = "";

  var name = "";

  var kamokuL = "";

  var Firelist = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("結果",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), automaticallyImplyLeading: false,centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: widget.item1.length,
                itemBuilder: (context, index) {
                  return Card(elevation: 0, color: Colors.grey[100],
                    child: ListTile(
                        title: Text(widget.item1[index]["text"],style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.bold, fontSize: 15)),
                        subtitle: Text("[1] ${widget.item1[index]["f1"]}\n[2] ${widget.item1[index]["f2"]}\n[3] ${widget.item1[index]["f3"]}\n[4] ${widget.item1[index]["f4"]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        onTap: () {co = index;
                        showDialog(
                            context: context,
                            builder: (context) =>
                                AlertDialog(
                                  title: Text("答えは" + widget.item1[index]["f5"] + "番です"),
                                ));
                        }),

                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              child: ElevatedButton(
                onPressed: () {
                  int count = 0;
                  Navigator.popUntil(context, (_) => count++ >= 2);
                },
                child: Text('閉じる',
                  style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),);
  }
  void initState() {
    super.initState();
    _getCounterValue();
    inputData();review();
  }
  Future<String> inputData() async {
    final  user = await FirebaseAuth.instance.currentUser!;
    String id = user.uid.toString();
    DateTime now = DateTime.now();
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');
    var date = outputFormat.format(now);
    FirebaseFirestore.instance.collection("Result").doc(date).collection("aa").doc()// ドキュメントID自動生成
        .set({"科目":1,});
    return id;
  }

  void review(){
    var rand = new Random();
    if (rand.nextInt(2) == 1){
      _requestReview();
    }}

  Future<void> _requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {inAppReview.requestReview();}}

  void _getCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _counter = prefs.getInt("アンケート")?? 0;
    _counter=  _counter + 1;
    prefs.setInt("アンケート",_counter );
   //
   if (widget.item1.length == widget.corect){prefs.setString(widget.name,"全問正解");}else{prefs.setString(widget.name,"不正解");}
   if (_counter == 3){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Ankert()));
  }}
}


