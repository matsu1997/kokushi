import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultTango extends StatefulWidget {
  @override
  ResultTango(this.item1,this.name,this.mistake,this.corect);
  List item1;String name;int mistake;int corect;

  @override
  State<ResultTango> createState() => _ResultTangoState();
}

class _ResultTangoState extends State<ResultTango> {
  var co = -1;

  var kamoku = "";

  var uid = "";

  var messageId = "";

  var name = "";

  var kamokuL = "";

  var Firelist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,elevation: 0,
        title: Text("結果",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
        iconTheme: IconThemeData(color: Colors.black), automaticallyImplyLeading: false,centerTitle: true,
        leading: IconButton(onPressed: () {   int count = 0;
        Navigator.popUntil(context, (_) => count++ >= 2); }, icon: Icon(Icons.keyboard_arrow_left_sharp),),
      ),
      body: SingleChildScrollView(child:Container(margin: EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
              itemCount: widget.item1.length, itemBuilder: (context, index) {
                return Card(elevation: 0,color:Colors.grey[100],child: ListTile(
                    title: Text(widget.item1[index]["Qtext"],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
                    onTap: (){print(widget.item1);showDialog(context: context, builder: (context) => AlertDialog(title: Text(widget.item1[index]["Atext"],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15,height: 2), textAlign: TextAlign.center),));} ),);},),),
      ));
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
      },);
    return new String.fromCharCodes(codeUnits);
  }
  void initState() {
    super.initState();
    inputData();_getCounterValue();
  }
  Future<String> inputData() async {
    final  user = await FirebaseAuth.instance.currentUser!;
    String id = user.uid.toString();
    DateTime now = DateTime.now();
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');
    var date = outputFormat.format(now);
    FirebaseFirestore.instance.collection("ResultTango").doc(date).collection("a").doc()// ドキュメントID自動生成
        .set({
      "科目":1,
    });
    return id;
  }
  void _getCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (widget.item1.length == widget.corect){prefs.setString(widget.name,"全問正解");}else{prefs.setString(widget.name,"不正解");}
  }
}

