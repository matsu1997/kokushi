import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kokushi/V5/V5%E3%82%AB%E3%83%AC%E3%83%B3%E3%83%80%E3%83%BC/V5Carender.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../V5SignUp.dart';
import 'V5V2Pri.dart';
import 'V5V2QA.dart';
import 'V5V2Video.dart';

class V5V2 extends StatefulWidget {
  V5V2(this.schoolId,this.Id,this.name);
  String schoolId; String Id;String name;
  @override
  State<V5V2> createState() => _V5V2State();
}
class _V5V2State extends State<V5V2> {
  @override
  var uid = "";
  var count = 0;
  String date = "";
  var item = [];
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title:Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            actions: [],
            bottom: const TabBar(
              tabs: [
                Tab(child: Text("問題集",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("プリント",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("動画",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
              ],
            ),
          ),
          body: TabBarView(children: [V5V2QA(widget.schoolId,widget.Id), V5Pri(widget.schoolId,widget.Id),V5V2Video(widget.schoolId,widget.Id)],),
        ),),);
  }}

