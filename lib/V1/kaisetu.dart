

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../V3/V3V2.dart';
import '../アカウント/SignUp.dart';

class kaisetu extends StatefulWidget {
  @override
  State<kaisetu> createState() => _kaisetuState();
  kaisetu(this.name,this.messageId);
  String name;
  String messageId;
}

class _kaisetuState extends State<kaisetu> {
  var item = [];
  var uid = "";
  var user = "";
  var co = 0;
  get onEng => null;
  late TextEditingController _bodyController;
  void initState() {
    super.initState();
    _bodyController = TextEditingController();
   aa();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('みんなの解説',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
        iconTheme: IconThemeData(color: Colors.black), centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(itemCount: item.length, itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                        title: Text(item[index]["Atext"]),)
                  );
                },
              ),
            ),
            Container(
              height: 100,
              child:Row(
                children: <Widget>[
                  SizedBox(width: 16.0,),
                  Expanded(
                    child: TextField(
                      controller: _bodyController,
                      decoration: InputDecoration(hintText: '解説文'),
                    ),
                  ),
                  CupertinoButton(
                    child: Text("投稿"),
                    onPressed: () {
                      send();
                      // キーボードを閉じる
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                  )
                ],
              )
              )
          ],),),);}
  void aa() async {SharedPreferences prefs = await SharedPreferences.getInstance();
  uid = prefs.getString("アカウント")?? "";
  if (uid == ""){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUp();}));})
        ;} else {uid = user.uid;_loadData();}});}else{_loadData();}}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('SCard').doc("kaisetuAll").collection(widget.name).doc(widget.messageId).collection("kaisetu").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});
    if (item.length == 0){
      setState(() {   item = [];   });
    }
  }
  Future<void> send() async {
    var aa = randomString(20);
    await FirebaseFirestore.instance
        .collection('SCard').doc("kaisetu")// コレクションID指定
        .collection(uid).doc(widget.name).collection(widget.messageId).doc(widget.messageId)// ドキュメントID自動生成
        .set({
      "Atext" : _bodyController.text,
    });
    await FirebaseFirestore.instance
        .collection('SCard').doc("kaisetuAll")// コレクションID指定
        .collection(widget.name).doc(widget.messageId).collection("kaisetu").doc(aa)// ドキュメントID自動生成
        .set({
      "Atext" : _bodyController.text,
      "messageId":aa,
    });
    setState(() {
      _loadData();
     // _bodyController.dispose();
    });
    _bodyController.clear();
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

}