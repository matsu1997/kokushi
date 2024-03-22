

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kokushi/V2/TangoQA.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../アカウント/SignUp.dart';

class V2 extends StatefulWidget {
  V2(this.name);
  String name;
  @override
  State<V2> createState() => _V2State();
}

class _V2State extends State<V2> {
  var item = [];
  var item1 = []; var item11 = [];
  var co = -1;
  var kamoku = "";
  var uid = "";
  var messageId = "";
  var name = "";
  var kamokuL = "";
  var Firelist = [];
  void initState() {
    super.initState();
    aa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,elevation: 0,
        actions: <Widget>[],
      ),
        body:Container(margin: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: item.length,
            itemBuilder: (context, index,) {
              return GestureDetector(
                onTap: ()  {Navigator.of(context).push(MaterialPageRoute(builder: (context) => TangoQA(item[index]["uid"], item[index]["name"])),).then((value) {set();});},
                child:Card(elevation: 0,color:Colors.grey[100],
                    child:Container(margin: EdgeInsets.all(10),child: Row(children: [
                      Expanded(child:Container(margin:EdgeInsets.only(top:5,bottom: 5,left: 20),child: Text(item[index]["name"],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15)))),
                      Container(child:item1[index] == "全問正解" ?
                      Container(alignment:Alignment.centerRight,child: Icon(Icons.star,color: Colors.blueGrey[900],),):
                      Container(child: item1[index] == "" ? Container():
                      Container(alignment:Alignment.centerRight,child: Icon(Icons.star_half,color: Colors.blueGrey[900],),))
                      )
                    ],),)),);},),),);
  }
  // void set11()  {
  //   FirebaseFirestore.instance.collection('SCard').doc(item[co]["uid"]).collection("単語帳名").doc(item[co]["name"]).collection("問題")
  //       .get().then((QuerySnapshot snapshot) {
  //     snapshot.docs.forEach((doc) {
  //       print(["(11)" +"1"+ "(11)","(11)" +doc["Qtext"]+ "(11)","(11)" +doc["Atext"]+ "(11)","(11)" +"(11)","(11)" +"(11)","(11)" +"(11)","(11)" +"(11)","(11)" +doc["kamoku"]+ "(11)"]);
  //       ;});});}
  //

  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('Search').doc("All").collection("問題集名").where('kamoku', isEqualTo: widget.name).get().then((QuerySnapshot snapshot) {
     snapshot.docs.forEach((doc) {setState(() {item.add(doc);set();});});});
    }
  void _loadData1()  {
    widget.name = kamokuL;
    item = [];
    FirebaseFirestore.instance.collection('Search').doc("All").collection("問題集名").where('kamoku', isEqualTo: kamokuL).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {item.add(doc);set();});});});//print(item);
    if (item.length == 0){setState(() {   item = [];   });}
  }
  void aa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("アカウント") ?? "";
    if (uid == "") {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));}else{_loadData();}
  }

  _showCupertinoActionSheet(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text("科目を選択"),
            actions: <Widget>[
              CupertinoActionSheetAction(child: Text("全体(リセット)",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);_loadData(); }, isDestructiveAction: true,),
           //   CupertinoActionSheetAction(child: Text("医療概論",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () async { Navigator.pop(context);kamokuL = "医療概論";_loadData1();},),
              CupertinoActionSheetAction(child: Text("衛生学",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () async { Navigator.pop(context); kamokuL = "衛生学";_loadData1();}, ),
              CupertinoActionSheetAction(child: Text("関係法規",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "関係法規";_loadData1();}, ),
              CupertinoActionSheetAction(child: Text("解剖学",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context); kamokuL = "解剖学";_loadData1();}, ),
              CupertinoActionSheetAction(child: Text("生理学",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context); kamokuL = "生理学";_loadData1();}, ),
              CupertinoActionSheetAction(child: Text("病理",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "病理"; _loadData1();}, ),
              CupertinoActionSheetAction(child: Text("臨床医学総論",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context); kamokuL = "臨床医学総論";_loadData1();}, ),
              CupertinoActionSheetAction(child: Text("臨床医学各論",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "臨床医学各論";_loadData1(); }, ),
              CupertinoActionSheetAction(child: Text("リハビリテーション医学",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "リハビリテーション医学";_loadData1(); },),
              CupertinoActionSheetAction(child: Text("東洋医学概論",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context); kamokuL = "東洋医学概論";_loadData1();},),
             // CupertinoActionSheetAction(child: Text("東洋医学各論(症状別)",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "東洋医学臨床論(症状別)";_loadData1(); }, ),
              //CupertinoActionSheetAction(child: Text("東洋医学各論(質問別)",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "東洋医学臨床論(質問別)";_loadData1(); },),
              CupertinoActionSheetAction(child: Text("経絡経穴概論",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "経絡経穴概論";_loadData1(); }),
              CupertinoActionSheetAction(child: Text("あん摩マッサージ指圧理論",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "あん摩マッサージ指圧理論";_loadData1(); },),
              CupertinoActionSheetAction(child: Text("鍼灸理論",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "鍼灸理論";_loadData1(); }),
              CupertinoActionSheetAction(child: Text("運動学(柔整師)",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "運動学柔整師";_loadData1(); },),
              CupertinoActionSheetAction(child: Text("関係法規(柔整師)",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "関係法規柔整師";_loadData1(); }, ),
              CupertinoActionSheetAction(child: Text("外科(柔整師)",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context); kamokuL = "外科柔整師";_loadData1();}),
              CupertinoActionSheetAction(child: Text("整形(柔整師)",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context); kamokuL = "整形柔整師";_loadData1();},),
              CupertinoActionSheetAction(child: Text("柔整理論(柔整師)",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context);kamokuL = "柔整理論柔整師";_loadData1(); }),
             // CupertinoActionSheetAction(child: Text("その他",style: TextStyle(fontWeight: FontWeight.bold)), onPressed: () { Navigator.pop(context); kamokuL = "その他";_loadData1();}),
            ],
            cancelButton: CupertinoActionSheetAction(child: Text("Cancel"), onPressed: () { Navigator.pop(context); },),
          );
        }
    );
  }
  Future<void> set () async {item1 = [];
 SharedPreferences prefs = await SharedPreferences.getInstance();
  for(int i = 0; i< item.length; i++)
    setState(() { item1.add(prefs.getString(item[i]["name"])?? "" );});
  }
}


