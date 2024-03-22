import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kokushi/V8/V8ShopLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../V3/V3.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

import '../アカウント/SignUp.dart';
import 'V8Create.dart';
import 'V8Shop.dart';
import 'V8V2.dart';

class V8 extends StatefulWidget {
  @override
  State<V8> createState() => _V8State();
}

class _V8State extends State<V8> {
  @override

  var item = [];
  var visible = false;
  void initState() {
    super.initState();sign();}

  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar:AppBar(
            backgroundColor: Colors.white,elevation: 0,
            title:Text("企業を知る",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blueGrey[900],fontSize: 15),),
            iconTheme: IconThemeData(color: Colors.black), centerTitle: true,
             actions: [IconButton(onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Shop()))  }, icon: Icon(Icons.login, color: Colors.blueGrey[800],)),],
            leading: Visibility(visible:visible,child:IconButton(onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Create()))  }, icon: Icon(Icons.create_outlined, color: Colors.blueGrey[800],)),),
            bottom: TabBar(indicatorColor: Colors.green,
              tabs: [
                Tab(child: Text("店舗紹介",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("セミナー",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("限定メニュー",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
              ],),
          ),
          body: TabBarView(children: [V8A(item), V8B(item), V8C(item)],
          ),),));
  }

  Future<void> loadData()  async {
    FirebaseFirestore.instance.collection("店舗").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {setState(() {item.add(doc);});});});}
 // snapshot.docs.forEach((doc) {setState(() {item.add({"基本情報":doc["基本情報"],"セミナー情報":doc["セミナー情報"],"クーポン情報":doc["クーポン情報"],"トップ":doc["トップ"],"ID":doc["ID"]});});});});}

  void sign() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString("アカウント") ?? "";if (uid == "8HM3xABPl95C6oZc3b2v"){setState(() {visible = true;});}
    if (uid == "") {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));}else{loadData();}
  }

}


class V8A extends StatefulWidget {
  V8A(this.item);
  List item;
  @override
  State<V8A> createState() => _V8AState();
}
class _V8AState extends State<V8A> {


 var item = [];
 var item2 = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"];
 @override
  void initState() {
    super.initState();set();
  }

 // Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top(map,map2,map3,["","","","",""],ID )));

Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(backgroundColor:Colors.green,child: Icon(Icons.search), onPressed: (){book(item2);},),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
                  Container(margin: EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
                    itemCount: item.length, itemBuilder: (context, index) {
                      return GestureDetector(onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8V2(item[index]["基本情報"],item[index]["セミナー情報"],item[index]["クーポン情報"],item[index]["トップ"],item[index]["ID"],)));},
                      child:Card(elevation: 0,color:Colors.grey[100],child:
                      Container(height:100,child:Row(children: [
                       Container(margin:EdgeInsets.only(top:5,left: 10),width:80,height:80,child: Image(image: NetworkImage(item[index]["基本情報"]["写真"]),),),
                       Expanded(child: Column(children: [
                        Container(margin:EdgeInsets.only(top:10,left: 30),width: double.infinity,child: Text(item[index]["基本情報"]["店舗名"],style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.blueGrey[800],overflow: TextOverflow.ellipsis),),),
                         Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text(item[index]["基本情報"]["店舗タイプ"] + "  　　　   " + item[index]["基本情報"]["市区町村"],style: TextStyle(fontSize:10,color: Colors.blueGrey[900])),),
                         Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text(item[index]["基本情報"]["強み"],style: TextStyle(fontSize:10,color: Colors.blueGrey[500],overflow: TextOverflow.ellipsis,),maxLines: 2,),),

                       ],) )],))));},),),])));
  }

  void set (){setState(() {item = widget.item;});}

  void search(name){item = [];
    for (int i = 0; i < widget.item.length; i++) {
      setState(() { if ( widget.item[i]["基本情報"]["都道府県"]== name){item.add(widget.item[i]);}});
    }}

 void book(item) {
   showModalBottomSheet(context: context,backgroundColor: Colors.white,
     shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
     builder: (context) { return StatefulBuilder(
         builder: (context, StateSetter setState) {
           return Container(color:Colors.transparent,height: 600,child: ListView.builder(itemCount: item.length, itemBuilder: (context, index) {
             return Card(elevation:0,color:Colors.transparent,child:
             Container(height:50,margin: EdgeInsets.all(0),width:double.infinity,color: Colors.transparent,
                 child:Container(width: double.infinity,color:Colors.transparent,height: 50, child:
                 TextButton(child:Text(item[index], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey[900],),),
                     onPressed: () async {setState(() {
                       search(item[index]);
                     });}),))
             );},),);});}, ).whenComplete(() {setState(() {});});}

}


class V8B extends StatefulWidget {
  V8B(this.item);
  List item;
  @override
  State<V8B> createState() => _V8BState();
}
class _V8BState extends State<V8B> {

  var itemAll = [];
  var item = [];
  var myFormat = DateFormat('yyyy/MM/dd ');
  var item2 = ["オンライン","北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"];

  @override
  void initState() {
    super.initState();set();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(backgroundColor:Colors.green,child: Icon(Icons.search), onPressed: (){book(item2);},),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
                  Container(margin: EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
                    itemCount:item.length, itemBuilder: (context, index) {
                    return GestureDetector(onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8V2(item[index]["基本情報"],item[index]["セミナー情報"],item[index]["クーポン情報"],item[index]["トップ"],item[index]["ID"],)));},
                      child:Card(elevation: 0,color:Colors.grey[100],child:
                      Container(height:100,child:Row(children: [
                        Container(margin:EdgeInsets.only(top:5,left: 10),width:80,height:80,child: Image(image: NetworkImage(item[index]["セミナー情報"]["写真"]),),),
                        Expanded(child: Column(children: [
                          Container(margin:EdgeInsets.only(top:10,left: 30),width: double.infinity,child: Text(item[index]["基本情報"]["店舗名"],style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.blueGrey[800]),),),
                          Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text( item[index]["セミナー情報"]["セミナー名"],style: TextStyle(fontSize:12,fontWeight: FontWeight.bold,color: Colors.blueGrey[800])),),
                          Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text("会場: " +item[index]["セミナー情報"]["会場都道府県"] + "     " + "開催日: " + myFormat.format(item[index]["セミナー情報"]["開催日"].toDate()),style: TextStyle(fontSize:10,color: Colors.blueGrey[500],overflow: TextOverflow.ellipsis,),maxLines: 2,),),
                        //  Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text("参加条件: " +item[index]["セミナー情報"]["参加条件"],style: TextStyle(fontSize:10,color: Colors.blueGrey[500],overflow: TextOverflow.ellipsis,),maxLines: 2,),),
                        ],) )],))));},),),])));
  }

  void set () {
    widget.item.shuffle();
    for (int i = 0; i < widget.item.length; i++) {
         if(widget.item[i]["セミナー情報"]["セミナー有無"] == "公開"){
           setState(() { itemAll.add(widget.item[i]);item.add(widget.item[i]);
           if (i  + 1 == widget.item.length){item.sort((a,b) => a["セミナー情報"]['開催日'].compareTo(b["セミナー情報"]['開催日']));}
           });
         }}}

  void search(name){item = [];
    for (int i = 0; i < itemAll.length; i++) {
      setState(() { if ( itemAll[i]["セミナー情報"]["会場都道府県"]== name){item.add(itemAll[i]);}});
    }}

  void book(item) {
    showModalBottomSheet(context: context,backgroundColor: Colors.white,
      shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Container(color:Colors.transparent,height: 600,child: ListView.builder(itemCount: item.length, itemBuilder: (context, index) {
              return Card(elevation:0,color:Colors.transparent,child:
              Container(height:50,margin: EdgeInsets.all(0),width:double.infinity,color: Colors.transparent,
                  child:Container(width: double.infinity,color:Colors.transparent,height: 50, child:
                  TextButton(child:Text(item[index], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey[900],),),
                      onPressed: () async {setState(() {
                        search(item[index]);
                      });}),))
              );},),);});}, ).whenComplete(() {setState(() {});});}


}

class V8C extends StatefulWidget {
  V8C(this.item);
  List item;
  @override
  State<V8C> createState() => _V8CState();
}
class _V8CState extends State<V8C> {

  var item = [];
  var itemAll = [];
  var item2 = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"];

  @override
  void initState() {
    super.initState();set();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(backgroundColor:Colors.green,child: Icon(Icons.search), onPressed: (){book(item2);},),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
                  Container(margin: EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
                    itemCount: item.length, itemBuilder: (context, index) {
                      return GestureDetector(onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8V2(item[index]["基本情報"],item[index]["セミナー情報"],item[index]["クーポン情報"],item[index]["トップ"],item[index]["ID"],)));},
                      child: Card(elevation: 0,color:Colors.grey[100],child:
                      Container(height:100,child:Row(children: [
                        Container(margin:EdgeInsets.only(top:5,left: 10),width:80,height:80,child: Image(image: NetworkImage(item[index]["クーポン情報"]["写真"]),),),
                        Expanded(child: Column(children: [
                          Container(margin:EdgeInsets.only(top:10,left: 30),width: double.infinity,child: Text(item[index]["基本情報"]["店舗名"],style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.blueGrey[800]),),),
                          Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text(item[index]["クーポン情報"]["クーポン名"],style: TextStyle(fontSize:12,fontWeight: FontWeight.bold,color: Colors.blueGrey[800])),),
                          Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text(item[index]["基本情報"]["店舗タイプ"] + "  　　　   " + item[index]["基本情報"]["市区町村"],style: TextStyle(fontSize:10,color: Colors.blueGrey[500])),),
                        ],) )],))));},),),])));
  }

  void set () {
    for (int i = 0; i < widget.item.length; i++) {
      if(widget.item[i]["クーポン情報"]["クーポン有無"] == "公開"){
        setState(() { itemAll.add(widget.item[i]);item.add(widget.item[i]);
        if (i  + 1 == widget.item.length){ item.sort((a,b) => a["クーポン情報"]['クーポン使用期限'].compareTo(b["クーポン情報"]['クーポン使用期限']));}});
      }}}


  void search(name){item = [];
  for (int i = 0; i < itemAll.length; i++) {
    setState(() { if ( itemAll[i]["基本情報"]["都道府県"]== name){item.add(itemAll[i]);}});
  }}

  void book(item) {
    showModalBottomSheet(context: context,backgroundColor: Colors.white,
      shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Container(color:Colors.transparent,height: 600,child: ListView.builder(itemCount: item.length, itemBuilder: (context, index) {
              return Card(elevation:0,color:Colors.transparent,child:
              Container(height:50,margin: EdgeInsets.all(0),width:double.infinity,color: Colors.transparent,
                  child:Container(width: double.infinity,color:Colors.transparent,height: 50, child:
                  TextButton(child:Text(item[index], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey[900],),),
                      onPressed: () async {setState(() {
                        search(item[index]);
                      });}),))
              );},),);});}, ).whenComplete(() {setState(() {});});}

}


