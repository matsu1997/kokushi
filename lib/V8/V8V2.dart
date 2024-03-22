import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../V3/V3.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' as io;

import 'URL.dart';

class V8V2 extends StatefulWidget {
  V8V2(this.map,this.map2,this.map3,this.item,this.ID);
  Map map;Map map2;Map map3;List item;String ID;
  @override
  State<V8V2> createState() => _V8V2State();
}

class _V8V2State extends State<V8V2> {
  @override

  void initState() {
    super.initState();}

  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(length: 3,
          child: Scaffold(
            appBar:AppBar(
              backgroundColor: Colors.white,elevation: 0,
              title:Text(widget.map["店舗名"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
              iconTheme: IconThemeData(color: Colors.black), centerTitle: true,
              //  actions: [IconButton(onPressed: () => {}, icon: Column(children: [Icon(Icons.access_alarm, color: Colors.green,), Text('復習', style: TextStyle(color: Colors.green,fontSize: 10),),],)),],
              bottom:  TabBar(indicatorColor: Colors.green,
                tabs: [
                  Tab(child: Text("店舗紹介",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                  Tab(child: Text("セミナー",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                  Tab(child: Text("限定メニュー",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                ],
              ),),
            body: TabBarView(
              children: [V8V2A(widget.map,widget.item,widget.ID),V8V2B(widget.map2,widget.ID),V8V2C(widget.map3,widget.ID)],
            ),),));
  }

}


class V8V2A extends StatefulWidget {
  V8V2A(this.map,this.item,this.ID);
  Map map; List item;String ID;

  @override
  State<V8V2A> createState() => _V8V2AState();
}
class _V8V2AState extends State<V8V2A> {

  final _pageController = PageController(viewportFraction: 0.877);
  double currentPage = 0;

  @override
  void initState() {
    super.initState();_pageController.addListener(() {currentPage = _pageController.page!.toDouble();});
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
               Container(margin: EdgeInsets.only(top: 10.0), height: 200, child: PageView(physics: BouncingScrollPhysics(), controller: _pageController, scrollDirection: Axis.horizontal,
                children: [
                  Container(margin: EdgeInsets.only(right: 15), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                    child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                      child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.item[0]), fit: BoxFit.cover,),),
                        child: Padding(padding: EdgeInsets.all(8.0), child: Text(""),),),
                      onPressed: () {},),),
                  Container(margin: EdgeInsets.only(right: 15), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                    child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                      child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.item[1]), fit: BoxFit.cover,),),
                        child: Padding(padding: EdgeInsets.all(8.0), child: Text(""),),),
                      onPressed: () {},),),
                  Container(margin: EdgeInsets.only(right: 15), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                    child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                      child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.item[2]), fit: BoxFit.cover,),),
                        child: Padding(padding: EdgeInsets.all(8.0), child: Text(""),),),
                      onPressed: () {},),),
                  Container(margin: EdgeInsets.only(right: 15), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                    child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                      child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.item[3]), fit: BoxFit.cover,),),
                        child: Padding(padding: EdgeInsets.all(8.0), child: Text(""),),),
                      onPressed: () {},),),
                  Container(margin: EdgeInsets.only(right: 15), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                    child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                      child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.item[4]), fit: BoxFit.cover,),),
                        child: Padding(padding: EdgeInsets.all(8.0), child: Text(""),),),
                      onPressed: () {},),),
                   ],),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("基本情報",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["店舗タイプ"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:5,left: 20,right: 10),width: double.infinity,child: Text("[営業時間]\n" +widget.map["営業時間"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:5,left: 20,right: 10),width: double.infinity,child: Text("[定休日]\n" +widget.map["定休日"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:5,left: 20,right: 10),width: double.infinity,child: Text("[住所]\n" +widget.map["住所"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:5,left: 20,right: 10),width: double.infinity,child: Text(widget.map["アクセス"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("当院のご紹介",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["院紹介"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("当院の強みは?",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["強み"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("どんな患者さんが多い?",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["客層"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("どんな治療法・設備を使っている?",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["治療法設備"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("スタッフが持っている資格は?",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["在籍スタッフ資格"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("どんな研修をする?",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["研修内容"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("スタッフの1日",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["スタッフの1日"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("見学の方法は?",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["見学方法"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(child: widget.map["見学方法パターン"] != "写真(QRコードなど)"? Container(margin: EdgeInsets.only(top: 0,left: 30,),width: double.infinity, child:widget.map["見学URL"] != ""? TextButton(child:Text(widget.map["見学URL"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800], decoration: TextDecoration.underline,)), onPressed: () {send ();},):Container()):Container()),
              Container(margin:EdgeInsets.all(10),child: widget.map["見学用写真"] != "" ?Image(image: NetworkImage(widget.map["見学用写真"]),):Container(),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("WEBサイト",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin: EdgeInsets.only(top: 0,left: 20,),width: double.infinity, child: TextButton(child:Text(widget.map["店舗URL"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800], decoration: TextDecoration.underline,)),
                onPressed: () {if (widget.map["店舗URL"] != ""){Navigator.of(context).push(MaterialPageRoute(builder: (context) => URL(widget.map["店舗URL"])));}},),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("採用サイト",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin: EdgeInsets.only(top: 0,left: 20,bottom: 30),width: double.infinity, child: TextButton(child:Text(widget.map["採用URL"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800], decoration: TextDecoration.underline,)),
                onPressed: () {if (widget.map["採用URL"] != ""){Navigator.of(context).push(MaterialPageRoute(builder: (context) => URL(widget.map["採用URL"])));}},),),

            ])));}

  Future<void> send () async {
    if (widget.map["見学URL"] != ""){
    switch (widget.map["見学方法パターン"]){
      case "URL":Navigator.of(context).push(MaterialPageRoute(builder: (context) => URL(widget.map["見学URL"])));break;
      case "メール":final url = Uri(scheme: 'mailto', path: widget.map["見学URL"], query: 'subject=&body=',);if (await canLaunchUrl(url)) {launchUrl(url);} else {print("Can't launch $url");}break;
    }}}

}

class V8V2B extends StatefulWidget {
  V8V2B(this.map,this.ID);
  Map map; String ID;

  @override
  State<V8V2B> createState() => _V8V2BState();
}
class _V8V2BState extends State<V8V2B> {

  var myFormat = DateFormat('yyyy/MM/dd ');
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body: Container(child:widget.map["セミナー有無"] == "公開" ?SingleChildScrollView(
            child:Column(children: <Widget>[
              Container(margin:EdgeInsets.all(10),child: widget.map["写真"] != "" ?Image(image: NetworkImage(widget.map["写真"]),):Container(),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["セミナー名"],style: TextStyle(fontSize:24,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("開催日",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(myFormat.format(widget.map["開催日"].toDate()),style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:3,left: 20,right: 10),width: double.infinity,child: Text(widget.map["時間"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("開催場所",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["会場住所"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("内容",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["セミナー説明"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("参加費用",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["セミナー費用"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("定員",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["定員"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("参加条件",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["参加条件"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("その他",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["その他"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("申し込み方法",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["申し込み方法"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.all(10),child: widget.map["申し込み用写真"] != "" ?Image(image: NetworkImage(widget.map["申し込み用写真"]),):Container(),),
             Container(child: widget.map["申し込み方法パターン"] != "写真(QRコードなど)"? Container(margin: EdgeInsets.only(top: 20,bottom: 30),width: 100, child: ElevatedButton(child:Text('申し込む'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                  onPressed: () {send ();},)):Container()),
            ])):Center(child: Container(margin:EdgeInsets.only(),width: double.infinity,child: Text("現在セミナー情報はありません",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),textAlign: TextAlign.center,),),)));}

  Future<void> send () async {
    if (widget.map["申し込み方法URL"] != ""){
    switch (widget.map["申し込み方法パターン"]){
      case "URL":Navigator.of(context).push(MaterialPageRoute(builder: (context) => URL(widget.map["申し込みURL"])));break;
      case "メール":final url = Uri(scheme: 'mailto', path: widget.map["申し込みURL"], query: 'subject=&body=',);if (await canLaunchUrl(url)) {launchUrl(url);} else {print("Can't launch $url");}break;
    }}}
}


class V8V2C extends StatefulWidget {
  V8V2C(this.map,this.ID);
  Map map; String ID;

  @override
  State<V8V2C> createState() => _V8V2CState();
}
class _V8V2CState extends State<V8V2C> {

  var myFormat = DateFormat('yyyy/MM/dd ');
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body: Container(child: widget.map["クーポン有無"] == "公開" ?SingleChildScrollView(
            child:Column(children: <Widget>[
              Container(margin:EdgeInsets.all(10),child: widget.map["写真"] != "" ?Image(image: NetworkImage(widget.map["写真"]),):Container(),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["クーポン名"],style: TextStyle(fontSize:24,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("内容",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["クーポン説明"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("使用条件",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["クーポン使用条件"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("使用期限",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(myFormat.format(widget.map["クーポン使用期限"].toDate()),style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("その他",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
              Container(margin:EdgeInsets.only(top:10,left: 20,right: 10,bottom: 30),width: double.infinity,child: Text(widget.map["その他"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
              // Container(margin: EdgeInsets.only(top: 20,bottom: 30),width: 100, child: ElevatedButton(child:Text('使う'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
              //   onPressed: () {},),),
            ])):Center(child: Container(margin:EdgeInsets.only(),width: double.infinity,child: Text("現在メニュー情報はありません",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),textAlign: TextAlign.center,),),)));}


}

