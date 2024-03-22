import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:kokushi/V8/V8ShopLogin.dart';
import 'dart:io' as io;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'URL.dart';
import 'V8Create.dart';

class V8Shop extends StatefulWidget {
  V8Shop();

  @override
  State<V8Shop> createState() => _V8ShopState();
}

class _V8ShopState extends State<V8Shop> {

  var ID = "";var name = "";
  var top  = [];
  var map1 = {}; var map2 = {}; var map3 = {};
  @override
  void initState() {
    super.initState();sign();}

  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(length: 3,
          child: Scaffold(
            appBar:AppBar(
              backgroundColor: Colors.white,elevation: 0,
              title:Text(name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
              iconTheme: IconThemeData(color: Colors.black), centerTitle: true,
              //  actions: [IconButton(onPressed: () => {}, icon: Column(children: [Icon(Icons.access_alarm, color: Colors.green,), Text('復習', style: TextStyle(color: Colors.green,fontSize: 10),),],)),],
              bottom: const TabBar(indicatorColor: Colors.green,
                tabs: [
                  Tab(child: Text("企業紹介",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                  Tab(child: Text("セミナー",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                  Tab(child: Text("限定メニュー",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                ],
              ),),
            body: TabBarView(
              children: [V8ShopA(map1,top,ID),V8ShopB(map2,ID,map1),V8ShopC(map3,ID,map1)],
            ),),));
  }

  void sign() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();ID = prefs.getString("店舗ID") ?? "";print(ID);
    if (ID == "") {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8ShopLogin())).then((value) => loadData());}else{loadData();}
  }
  Future<void> loadData()  async {
    FirebaseFirestore.instance.collection("店舗").where("ID",isEqualTo: ID).get().then((QuerySnapshot snapshot) {
      // snapshot.docs.forEach((doc) {setState(() {item.add(doc);});});});}
      snapshot.docs.forEach((doc) {setState(() {name =doc["基本情報"]["店舗名"]; map1 = doc["基本情報"];map2 = doc["セミナー情報"];map3 = doc["クーポン情報"];top = doc["トップ"];});});});}


}


class V8ShopA extends StatefulWidget {
  V8ShopA(this.map,this.item,this.ID);
  Map map; List item; String ID;

  @override
  State<V8ShopA> createState() => _V8ShopAState();
}
class _V8ShopAState extends State<V8ShopA> {
  var item = ["あり","なし"];
  var item2 = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"];
  var item3 = ["鍼灸師","あんまマッサージ指圧師","柔道整復師","理学療法士"];
  var item4 = ["鍼灸院","鍼灸整骨院","整骨院・接骨院","女性専用鍼灸院","整体院"];
  var item5 = ["メール","URL","写真(QRコードなど)"];
  var item6 = ["公開","非公開"];
  var _NameCon = TextEditingController(); var _NameCon1 = TextEditingController();var _NameCon2 = TextEditingController();var _NameCon3 = TextEditingController();var _NameCon4 = TextEditingController();var _NameCon5 = TextEditingController();var _NameCon6 = TextEditingController();var _NameCon7 = TextEditingController();var _NameCon8 = TextEditingController();var _NameCon9 = TextEditingController();var _NameCon10 = TextEditingController();
  var _NameCon11 = TextEditingController();var _NameCon12 = TextEditingController();var _NameCon13 = TextEditingController();var _NameCon14 = TextEditingController();var _NameCon15 = TextEditingController();var _NameCon16 = TextEditingController();var _NameCon17 = TextEditingController();var _NameCon18 = TextEditingController();var _NameCon19 = TextEditingController();var _NameCon20 = TextEditingController();
  var _NameCon21 = TextEditingController();var _NameCon22 = TextEditingController();var _NameCon23 = TextEditingController();var _NameCon24 = TextEditingController();var _NameCon25 = TextEditingController();var _NameCon26 = TextEditingController();var _NameCon27 = TextEditingController();var _NameCon28 = TextEditingController();var _NameCon29 = TextEditingController();
  final _pageController = PageController(viewportFraction: 0.877);
  double currentPage = 0;

  @override
  void initState() {
    super.initState();_pageController.addListener(() {currentPage = _pageController.page!.toDouble();});
    set (); }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(backgroundColor:Colors.green,child: Icon(Icons.remove_red_eye_outlined), onPressed: (){start();},),
        body: GestureDetector( onTap: () => FocusScope.of(context).unfocus(),
    child:SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(margin: EdgeInsets.only(top: 10.0), height: 200, child: PageView(physics: BouncingScrollPhysics(), controller: _pageController, scrollDirection: Axis.horizontal,
                children: [
                  Container(child:widget.item[0] != "" ?Container(margin: EdgeInsets.only(right: 15), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                    child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                      child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.item[0]), fit: BoxFit.cover,),),
                        child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},{},widget.item,0,widget.ID,4))).then((value) {if (value != null) {widget.item[0] = value; setState(() {});}});},),)
                   : Container(margin: EdgeInsets.only(top: 20,bottom: 30),
                     child: ElevatedButton(child:Text('写真を追加'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                     onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},{},widget.item,0,widget.ID,4))).then((value) {if (value != null) {widget.item[0] = value; setState(() {});}});;},),)),
                    Container(child:widget.item[1] != "" ?Container(margin: EdgeInsets.only(right: 15), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                    child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                      child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.item[1]), fit: BoxFit.cover,),),
                        child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},{},widget.item,1,widget.ID,4))).then((value) {if (value != null) {widget.item[1] = value; setState(() {});}});}),)
                    : Container(margin: EdgeInsets.only(top: 20,bottom: 30),
                     child: ElevatedButton(child:Text('写真を追加'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},{},widget.item,1,widget.ID,4))).then((value) {if (value != null) {widget.item[1] = value; setState(() {});}});;},),)),
                      Container(child:widget.item[2] != "" ? Container(margin: EdgeInsets.only(right: 15), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                    child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                      child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.item[2]), fit: BoxFit.cover,),),
                        child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},{},widget.item,2,widget.ID,4))).then((value) {if (value != null) {widget.item[2] = value; setState(() {});}});},),)
                     : Container(margin: EdgeInsets.only(top: 20,bottom: 30),
                      child: ElevatedButton(child:Text('写真を追加'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},{},widget.item,2,widget.ID,4))).then((value) {if (value != null) {widget.item[2] = value; setState(() {});}});;},),)),

                      Container(child:widget.item[3] != "" ?Container(margin: EdgeInsets.only(right: 15), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                        child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                      child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.item[3]), fit: BoxFit.cover,),),
                        child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},{},widget.item,3,widget.ID,4))).then((value) {if (value != null) {widget.item[3] = value; setState(() {});}});},),)
        : Container(margin: EdgeInsets.only(top: 20,bottom: 30),
    child: ElevatedButton(child:Text('写真を追加'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},{},widget.item,3,widget.ID,4))).then((value) {if (value != null) {widget.item[3] = value; setState(() {});}});;},),)),

                    Container(child:widget.item[4] != "" ? Container(margin: EdgeInsets.only(right: 15), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                    child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                      child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.item[4]), fit: BoxFit.cover,),),
                        child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
                      onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},{},widget.item,4,widget.ID,4))).then((value){if (value != null) {widget.item[4] = value; setState(() {});}});},),)
        : Container(margin: EdgeInsets.only(top: 20,bottom: 30),
    child: ElevatedButton(child:Text('写真を追加'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
    onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},{},widget.item,4,widget.ID,4))).then((value) {if (value != null) {widget.item[4] = value; setState(() {});}});;},),)),
    ],),),


          Container(width:double.infinity,margin: EdgeInsets.only(top:10),child: Text("アイコン",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
          Container(child:widget.map["写真"] != "" ? Container(margin: EdgeInsets.only(top:10), width: 100, height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                  child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.map["写真"]), fit: BoxFit.cover,),),
                    child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,{},{},[],0,widget.ID,1))).then((value) {if (value != null) {widget.map["写真"] = value; setState(() {});}});},),)
                  : Container(margin: EdgeInsets.only(top: 20,bottom: 0),
                   child: ElevatedButton(child:Text('アイコンを追加'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                 onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,{},{},[],0,widget.ID,1))).then((value) {if (value != null) {widget.map["写真"] = value; setState(() {});}});;},),)),

    Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: SelectableText("",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 20),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("店舗タイプ",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:
              ElevatedButton(child:  Text(widget.map["店舗タイプ"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                onPressed: () {book(item4,0);},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("店舗名",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "店舗名",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon ,onChanged: (String value) {setState(() {widget.map["店舗名"] = value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("都道府県",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:
              ElevatedButton(child:  Text(widget.map["都道府県"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                onPressed: () {book(item2,1);},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("市区町村",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "市区町村",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon1 ,onChanged: (String value) {setState(() {widget.map["市区町村"] = value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("住所",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "住所",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon2 ,onChanged: (String value) {setState(() {widget.map["住所"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("最寄駅",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "最寄駅",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon3 ,onChanged: (String value) {setState(() {widget.map["最寄駅"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("営業時間",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "営業時間",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon9 ,onChanged: (String value) {setState(() {widget.map["営業時間"] = value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("定休日",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "休日",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon10 ,onChanged: (String value) {setState(() {widget.map["定休日"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("当院のご紹介",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "院紹介",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon5 ,onChanged: (String value) {setState(() {widget.map["院紹介"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("当院の強みは?",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText :"強み",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon6 ,onChanged: (String value) {setState(() {widget.map["強み"] = value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("どんな患者さんが多い?",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "客層",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon11 ,onChanged: (String value) {setState(() {widget.map["客層"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("どんな治療法・設備を使っている?",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "治療法設備",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon19 ,onChanged: (String value) {setState(() {widget.map["治療法設備"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("スタッフが持っている資格は?",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "在籍スタッフ資格",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon4 ,onChanged: (String value) {setState(() {widget.map["在籍スタッフ資格"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("スタッフの構成・どんな人がいる?",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "スタッフ構成",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon12 ,onChanged: (String value) {setState(() {widget.map["スタッフ構成"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("どんな研修をする?",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "研修内容",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon7 ,onChanged: (String value) {setState(() {widget.map["研修内容"] = value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("スタッフの1日",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "スタッフの1日",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon8 ,onChanged: (String value) {setState(() {widget.map["スタッフの1日"] = value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("店舗URL",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "店舗URL",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon13 ,onChanged: (String value) {setState(() {widget.map["店舗URL"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("採用URL",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "採用URL",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon14 ,onChanged: (String value) {setState(() {widget.map["採用URL"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("見学方法",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "見学方法",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon15 ,onChanged: (String value) {setState(() {widget.map["見学方法"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("見学方法パターン",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: ElevatedButton(child: Text(widget.map["見学方法パターン"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                onPressed: () {book(item5,3);},),),
              Container(child: widget.map["見学方法パターン"] != "写真(QRコードなど)"?Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("見学URL",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),):Container()),
                  Container(child: widget.map["見学方法パターン"] != "写真(QRコードなど)"?Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "見学URL",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon16 ,onChanged: (String value) {setState(() {widget.map["見学URL"] =  value; });},),):Container()),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10),child: Text("見学用写真",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(child:widget.map["見学用写真"] != "" ? Container(margin: EdgeInsets.only(top:10), width: 200, height: 200, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                  child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.map["見学用写真"]), fit: BoxFit.cover,),),
                    child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,{},{},[],0,widget.ID,5))).then((value) {if (value != null) {widget.map["見学用写真"] = value; setState(() {});}});},),)
                  : Container(margin: EdgeInsets.only(top: 20,bottom: 0),
                child: ElevatedButton(child:Text('見学用写真を追加'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,{},{},[],0,widget.ID,5))).then((value) {if (value != null) {widget.map["見学用写真"] = value; setState(() {});}});;},),)),

              Container(margin: EdgeInsets.only(top: 20,bottom: 30),
                child: ElevatedButton(child:Text('アップデート'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                  onPressed: () {update();},),),
            ]))));}



  void start() {
    showModalBottomSheet(context: context,backgroundColor: Colors.white,isScrollControlled: true,useRootNavigator: true,
        shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(20.0),),),
        builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return  Container(height:600,child:SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(margin:EdgeInsets.only(top:20,left: 20,right: 10),width: double.infinity,child: Text("検索画面",style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Divider(height: 20, thickness: 3, indent: 20, endIndent: 20, color: Colors.black,),
                  Container(height:100,child:Row(children: [
                    Container(margin:EdgeInsets.only(top:5,left: 10),width:80,height:80,child: Image(image: NetworkImage(widget.map["写真"]),),),
                    Expanded(child: Column(children: [
                      Container(margin:EdgeInsets.only(top:10,left: 30),width: double.infinity,child: Text(widget.map["店舗名"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[800],overflow: TextOverflow.ellipsis),),),
                      Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text(widget.map["店舗タイプ"] + "  　　　   " + widget.map["市区町村"],style: TextStyle(fontSize:10,color: Colors.blueGrey[900])),),
                      Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text(widget.map["強み"],style: TextStyle(fontSize:10,color: Colors.blueGrey[500],overflow: TextOverflow.ellipsis,),maxLines: 2,),),

                    ],) )],)),
                  Container(margin:EdgeInsets.only(top:20,left: 20,right: 10),width: double.infinity,child: Text("詳細画面",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Divider(height: 20, thickness: 3, indent: 20, endIndent: 20, color: Colors.black,),
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
                  Container(child: widget.map["見学方法パターン"] != "写真(QRコードなど)"?Container(margin: EdgeInsets.only(top: 0,left: 30,),width: double.infinity, child:widget.map["見学URL"] != ""? TextButton(child:Text(widget.map["見学URL"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800], decoration: TextDecoration.underline,)), onPressed: () {send ();},):Container()):Container()),
                  Container(margin:EdgeInsets.all(10),child: widget.map["見学用写真"] != "" ?Image(image: NetworkImage(widget.map["見学用写真"]),):Container(),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("WEBサイト",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
                  Container(margin: EdgeInsets.only(top: 0,left: 20,),width: double.infinity, child: TextButton(child:Text(widget.map["店舗URL"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800], decoration: TextDecoration.underline,)),
                    onPressed: () {if (widget.map["店舗URL"] != ""){Navigator.of(context).push(MaterialPageRoute(builder: (context) => URL(widget.map["店舗URL"])));}},),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("採用サイト",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
                  Container(margin: EdgeInsets.only(top: 0,left: 20,bottom: 30),width: double.infinity, child: TextButton(child:Text(widget.map["店舗URL"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800], decoration: TextDecoration.underline,)),
                    onPressed: () {if (widget.map["採用URL"] != ""){Navigator.of(context).push(MaterialPageRoute(builder: (context) => URL(widget.map["採用URL"])));}},),),

                ])));});}, );}

  void book(item,index1) {
    showModalBottomSheet(context: context,backgroundColor: Colors.white,
      shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Container(color:Colors.transparent,height: 600,child: ListView.builder(itemCount: item.length, itemBuilder: (context, index) {
              return Card(elevation:0,color:Colors.transparent,child:
              Container(height:60,margin: EdgeInsets.all(5),width:double.infinity,color: Colors.transparent,
                  child:Container(width: double.infinity,color:Colors.transparent,height: 60, child:
                  TextButton(child:Text(item[index], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey[900],),),
                      onPressed: () async {setState(() {
                        switch (index1) {
                          case 0:print(index);widget.map["店舗タイプ"] = item[index];Navigator.pop(context);setState(() {});break;
                          case 1:print(index);widget.map["都道府県"] = item[index];Navigator.pop(context);setState(() {});break;
                          case 2:print(index);widget.map["在籍スタッフ資格"] = item[index];setState(() {});Navigator.pop(context);break;
                          case 3:print(index);widget.map["見学方法パターン"] = item[index];setState(() {});Navigator.pop(context);break;
                         }});}),))
              );},),);});}, ).whenComplete(() {setState(() {});});}

  void set (){setState(() {
    _NameCon.text =  widget.map["店舗名"];
    _NameCon1.text =  widget.map["市区町村"];
    _NameCon2.text =  widget.map["住所"];
    _NameCon3.text =  widget.map["最寄駅"];
    _NameCon4.text =  widget.map["在籍スタッフ資格"];
    _NameCon5.text =  widget.map["院紹介"];
    _NameCon6.text =  widget.map["強み"];
    _NameCon7.text =  widget.map["研修内容"];
    _NameCon8.text =  widget.map["スタッフの1日"];
    _NameCon9.text =  widget.map["営業時間"];
    _NameCon10.text =  widget.map["定休日"];
    _NameCon11.text =  widget.map["客層"];
    _NameCon12.text =  widget.map["スタッフ構成"];
    _NameCon13.text =  widget.map["店舗URL"];
    _NameCon14.text =  widget.map["採用URL"];
    _NameCon15.text =  widget.map["見学方法"];
    _NameCon16.text =  widget.map["見学URL"];
    _NameCon19.text =  widget.map["治療法設備"];
  });}

  Future<void> send () async {
    if (widget.map["見学URL"] != ""){
      switch (widget.map["見学方法パターン"]){
        case "URL":Navigator.of(context).push(MaterialPageRoute(builder: (context) => URL(widget.map["見学URL"])));break;
        case "メール":final url = Uri(scheme: 'mailto', path: widget.map["見学URL"], query: 'subject=&body=',);if (await canLaunchUrl(url)) {launchUrl(url);} else {print("Can't launch $url");}break;
      }}}
  void update (){FirebaseFirestore.instance.collection('店舗').doc(widget.ID).update({'基本情報': widget.map});}

}

class V8ShopB extends StatefulWidget {
  V8ShopB(this.map,this.ID,this.map0);
  Map map; String ID;Map map0;

  @override
  State<V8ShopB> createState() => _V8ShopBState();
}
class _V8ShopBState extends State<V8ShopB> {
  var item3 = ["オンライン","北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"];
  var item5 = ["メール","URL","写真(QRコードなど)"];
  var item6 = ["公開","非公開"];
  var _NameCon22 = TextEditingController();var _NameCon23 = TextEditingController();var _NameCon24 = TextEditingController();var _NameCon25 = TextEditingController();var _NameCon26 = TextEditingController();var _NameCon27 = TextEditingController();var _NameCon28 = TextEditingController();var _NameCon29 = TextEditingController();var _NameCon30 = TextEditingController();
  var _NameCon31 = TextEditingController();
  var myFormat = DateFormat('yyyy/MM/dd ');
  var co = 0;
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day), firstDate: DateTime(DateTime.now().year, DateTime.now().month), lastDate: DateTime(DateTime.now().year + 5, DateTime.now().month));
    if (picked != null && picked != selectedDate) {
      setState(() {selectedDate = picked;
      if (co == 0){widget.map["クーポン使用期限"] = Timestamp.fromDate(selectedDate);}
      else{widget.map["開催日"] = Timestamp.fromDate(selectedDate);}

      //controller.text = selectedDate.year.toString() +"年"+ selectedDate.month.toString()+"月"+selectedDate.day.toString()+"日";
          ;});
    }}
  @override
  void initState() {
    super.initState();set();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(backgroundColor:Colors.green,child: Icon(Icons.remove_red_eye_outlined), onPressed: (){start();},),
        body: GestureDetector( onTap: () => FocusScope.of(context).unfocus(),
        child:SingleChildScrollView(
            child: Column(children: <Widget>[

              Container(child:widget.map["写真"] != "" ? Container(margin: EdgeInsets.only(), width: 200, height: 200, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                  child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.map["写真"]), fit: BoxFit.cover,),),
                    child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},widget.map,[],0,widget.ID,3))).then((value) {if (value != null) {widget.map["写真"] = value; setState(() {});}});},),)
                  : Container(margin: EdgeInsets.only(top: 20,bottom: 0),
                child: ElevatedButton(child:Text('写真を追加'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},widget.map,[],0,widget.ID,3))).then((value) {if (value != null) {widget.map["写真"] = value; setState(() {});}});;},),)),

              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("セミナー公開",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: ElevatedButton(child: Text(widget.map["セミナー有無"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                onPressed: () {book(item6,5);},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("参加条件",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "参加条件",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon22 ,onChanged: (String value) {setState(() {widget.map["参加条件"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("会場都道府県",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: ElevatedButton(child: Text(widget.map["会場都道府県"]), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                onPressed: () {book(item3,4);},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("会場住所",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "会場住所",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon24 ,onChanged: (String value) {setState(() {widget.map["会場住所"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("セミナー費用",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "セミナー費用",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon25 ,onChanged: (String value) {setState(() {widget.map["セミナー費用"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("定員",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "定員",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon26 ,onChanged: (String value) {setState(() {widget.map["定員"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("セミナー説明",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "セミナー説明",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon27 ,onChanged: (String value) {setState(() {widget.map["セミナー説明"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("開催日",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(margin: EdgeInsets.only(top: 0,bottom: 30),width: double.infinity, child: TextButton(child:Text(myFormat.format(widget.map["開催日"].toDate()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800])), onPressed: () {co = 1;_selectDate(context);},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("時間",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "時間",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon28 ,onChanged: (String value) {setState(() {widget.map["時間"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("申し込み方法",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "申し込み方法",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon29 ,onChanged: (String value) {setState(() {widget.map["申し込み方法"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("申し込み方法パターン",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: ElevatedButton(child: Text(widget.map["申し込み方法パターン"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                onPressed: () {book(item5,6);},),),
              Container(child: widget.map["申し込み方法パターン"] != "写真(QRコードなど)"?Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("申し込みURL",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),):Container()),
              Container(child: widget.map["申し込み方法パターン"] != "写真(QRコードなど)"?Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "申し込みURL",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon30 ,onChanged: (String value) {setState(() {widget.map["申し込みURL"] =  value; });},),):Container()),

              Container(child:widget.map["申し込み用写真"] != "" ? Container(margin: EdgeInsets.only(), width: 200, height: 200, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                  child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.map["申し込み用写真"]), fit: BoxFit.cover,),),
                    child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},widget.map,[],0,widget.ID,6))).then((value) {if (value != null) {widget.map["申し込み用写真"] = value; setState(() {});}});},),)
                  : Container(margin: EdgeInsets.only(top: 20,bottom: 0),
                child: ElevatedButton(child:Text('申し込み用写真を追加'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},{},widget.map,[],0,widget.ID,6))).then((value) {if (value != null) {widget.map["申し込み用写真"] = value; setState(() {});}});;},),)),

              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("その他",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "その他",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon31 ,onChanged: (String value) {setState(() {widget.map["その他"] =  value; });},),),
              Container(margin: EdgeInsets.only(top: 20,bottom: 30),

                child: ElevatedButton(child:Text('アップデート'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                  onPressed: () {update();},),),
            ]))));}

  void start() {
    showModalBottomSheet(context: context,backgroundColor: Colors.white,isScrollControlled: true,useRootNavigator: true,
        shape:   RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(20.0),),),
        builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return  Container(height:600,child:widget.map["セミナー有無"] == "公開" ?SingleChildScrollView(
                child:Column(children: <Widget>[
                  Container(margin:EdgeInsets.only(top:20,left: 20,right: 10),width: double.infinity,child: Text("検索画面",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Divider(height: 20, thickness: 3, indent: 20, endIndent: 20, color: Colors.black,),
                  Container(height:100,child:Row(children: [
                    Container(margin:EdgeInsets.only(top:5,left: 10),width:80,height:80,child: Image(image: NetworkImage(widget.map["写真"]),),),
                    Expanded(child: Column(children: [
                      Container(margin:EdgeInsets.only(top:10,left: 30),width: double.infinity,child: Text(widget.map0["店舗名"],style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.blueGrey[800]),),),
                      Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text( widget.map["セミナー名"],style: TextStyle(fontSize:12,fontWeight: FontWeight.bold,color: Colors.blueGrey[800])),),
                      Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text("会場: " +widget.map["会場都道府県"] + "     " + "開催日: " + myFormat.format(widget.map["開催日"].toDate()),style: TextStyle(fontSize:10,color: Colors.blueGrey[500],overflow: TextOverflow.ellipsis,),maxLines: 2,),),
                      Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text("参加条件: " + widget.map["参加条件"],style: TextStyle(fontSize:10,color: Colors.blueGrey[500],overflow: TextOverflow.ellipsis,),maxLines: 2,),),
                    ],) )],)),
                  Container(margin:EdgeInsets.only(top:20,left: 20,right: 10),width: double.infinity,child: Text("詳細画面",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Divider(height: 20, thickness: 3, indent: 20, endIndent: 20, color: Colors.black,),
                  Container(margin:EdgeInsets.all(10),child: widget.map["写真"] != "" ?Image(image: NetworkImage(widget.map["写真"]),):Container(),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["セミナー名"],style: TextStyle(fontSize:24,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("開催日",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(myFormat.format(widget.map["開催日"].toDate()),style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Container(margin:EdgeInsets.only(top:3,left: 20,right: 10),width: double.infinity,child: Text(widget.map["時間"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("開催住所",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
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
                  Container(margin: EdgeInsets.only(top: 0,),width: double.infinity, child:widget.map["申し込みURL"] != ""? TextButton(child:Text('こちらから申し込み',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800], decoration: TextDecoration.underline,)), onPressed: () {send ();},):Container()),
                  Container(margin:EdgeInsets.all(10),child: widget.map["申し込み用写真"] != "" ? Image(image: NetworkImage(widget.map["申し込み用写真"]),):Container(),),

                  Container(child: widget.map["申し込み方法パターン"] != "写真(QRコードなど)"?Container(margin: EdgeInsets.only(top: 20,bottom: 30),width: 100, child: ElevatedButton(child:Text('申し込む'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                    onPressed: () {send ();},),):Container())
                ])):Center(child: Container(margin:EdgeInsets.only(),width: double.infinity,child: Text("現在セミナー情報はありません",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),textAlign: TextAlign.center,),),));}, );});}


  void book(item,index1) {
    showModalBottomSheet(context: context,backgroundColor: Colors.white,
      shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Container(color:Colors.transparent,height: 600,child: ListView.builder(itemCount: item.length, itemBuilder: (context, index) {
              return Card(elevation:0,color:Colors.transparent,child:
              Container(height:60,margin: EdgeInsets.all(5),width:double.infinity,color: Colors.transparent,
                  child:Container(width: double.infinity,color:Colors.transparent,height: 60, child:
                  TextButton(child:Text(item[index], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey[900],),),
                      onPressed: () async {setState(() {
                        switch (index1) {
                          case 4:widget.map["会場都道府県"] = item[index];setState(() {});Navigator.pop(context);break;
                          case 5:widget.map["セミナー有無"] = item[index];setState(() {});Navigator.pop(context);break;
                          case 6:widget.map["申し込み方法パターン"] = item[index];setState(() {});Navigator.pop(context);break;
                        }});}),))
              );},),);});}, ).whenComplete(() {setState(() {});});}

  void update (){FirebaseFirestore.instance.collection('店舗').doc(widget.ID).update({'セミナー情報': widget.map});}

  void set (){setState(() {
    _NameCon22.text =  widget.map["参加条件"];
    _NameCon24.text =  widget.map["会場住所"];
    _NameCon25.text =  widget.map["セミナー費用"];
    _NameCon26.text =  widget.map["定員"];
    _NameCon27.text =  widget.map["セミナー説明"];
    _NameCon28.text =  widget.map["申し込み方法"];
    _NameCon29.text =  widget.map["申し込みURL"];
    _NameCon30.text =  widget.map["その他"];
  });}

  Future<void> send () async {
    if (widget.map["申し込み方法URL"] != ""){
      switch (widget.map["申し込み方法パターン"]){//
        case "URL":Navigator.of(context).push(MaterialPageRoute(builder: (context) => URL(widget.map["申し込みURL"])));break;
        case "メール":final url = Uri(scheme: 'mailto', path: widget.map["申し込みURL"], query: 'subject=&body=',);if (await canLaunchUrl(url)) {launchUrl(url);} else {print("Can't launch $url");}break;
        case "写真(QRコードなど)":
      }}}


}


// case 0:widget.map["店舗タイプ"] = item[index];Navigator.pop(context);setState(() {});break;
// case 1:widget.map["都道府県"] = item[index];Navigator.pop(context);setState(() {});break;
// case 2:widget.map["在籍スタッフ資格"] = item[index];setState(() {});Navigator.pop(context);break;
// case 3:widget.map["見学方法パターン"] = item[index];setState(() {});Navigator.pop(context);break;
// case 4:widget.map2["クーポン有無"] = item[index];setState(() {});Navigator.pop(context);break;

class V8ShopC extends StatefulWidget {
  V8ShopC(this.map,this.ID,this.map0);
  Map map; String ID;Map map0;

  @override
  State<V8ShopC> createState() => _V8ShopCState();
}
class _V8ShopCState extends State<V8ShopC> {

  var item6 = ["公開","非公開"];
  var _NameCon = TextEditingController(); var _NameCon1 = TextEditingController();var _NameCon2 = TextEditingController();var _NameCon3 = TextEditingController();var _NameCon4 = TextEditingController();var _NameCon5 = TextEditingController();var _NameCon6 = TextEditingController();var _NameCon7 = TextEditingController();var _NameCon8 = TextEditingController();var _NameCon9 = TextEditingController();var _NameCon10 = TextEditingController();
  var _NameCon11 = TextEditingController();var _NameCon12 = TextEditingController();var _NameCon13 = TextEditingController();var _NameCon14 = TextEditingController();var _NameCon15 = TextEditingController();var _NameCon16 = TextEditingController();var _NameCon17 = TextEditingController();var _NameCon18 = TextEditingController();var _NameCon19 = TextEditingController();var _NameCon20 = TextEditingController();
  var _NameCon21 = TextEditingController();var _NameCon22 = TextEditingController();var _NameCon23 = TextEditingController();var _NameCon24 = TextEditingController();var _NameCon25 = TextEditingController();var _NameCon26 = TextEditingController();var _NameCon27 = TextEditingController();var _NameCon28 = TextEditingController();var _NameCon29 = TextEditingController();

  var co = 0;
  var myFormat = DateFormat('yyyy/MM/dd ');
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day), firstDate: DateTime(DateTime.now().year, DateTime.now().month), lastDate: DateTime(DateTime.now().year + 5, DateTime.now().month));
    if (picked != null && picked != selectedDate) {
      setState(() {selectedDate = picked;
      if (co == 0){widget.map["クーポン使用期限"] = Timestamp.fromDate(selectedDate);}
      else{widget.map["開催日"] = Timestamp.fromDate(selectedDate);}

      //controller.text = selectedDate.year.toString() +"年"+ selectedDate.month.toString()+"月"+selectedDate.day.toString()+"日";
          ;});
    }}
  @override
  void initState() {
    super.initState();set();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(backgroundColor:Colors.green,child: Icon(Icons.remove_red_eye_outlined), onPressed: (){start();},),
        body: GestureDetector( onTap: () => FocusScope.of(context).unfocus(),
        child:SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(child:widget.map["写真"] != "" ? Container(margin: EdgeInsets.only(), width: 200, height: 200, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey.shade50),),
                child:MaterialButton(padding: EdgeInsets.all(0.0), textColor: Colors.black, elevation: 8.0,
                  child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: NetworkImage(widget.map["写真"]), fit: BoxFit.cover,),),
                    child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},widget.map,{},[],0,widget.ID,2))).then((value) {if (value != null) {widget.map["写真"] = value; setState(() {});}});},),)
                  : Container(margin: EdgeInsets.only(top: 20,bottom: 0),
                child: ElevatedButton(child:Text('写真を追加'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1({},widget.map,{},[],0,widget.ID,2))).then((value) {if (value != null) {widget.map["写真"] = value; setState(() {});}});;},),)),

               Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("メニュー公開",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: ElevatedButton(child: Text(widget.map["クーポン有無"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                onPressed: () {book(item6,1);},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("メニュー名",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "クーポン名",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon17 ,onChanged: (String value) {setState(() {widget.map["クーポン名"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("メニュー説明",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "クーポン説明",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon18 ,onChanged: (String value) {setState(() {widget.map["クーポン説明"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("メニュー使用条件",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "クーポン使用条件",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon19 ,onChanged: (String value) {setState(() {widget.map["クーポン使用条件"] =  value; });},),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("メニュー使用期限",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:
              // TextField(decoration: InputDecoration(hintText : "クーポン使用期限",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
              //   maxLines: null, controller:_NameCon20 ,onChanged: (String value) {setState(() {map2["クーポン使用期限"] =  value; });},),
              Container(margin: EdgeInsets.only(top: 0,bottom: 30),width: double.infinity, child: TextButton(child:Text(myFormat.format(widget.map["クーポン使用期限"].toDate()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800])), onPressed: () {co = 0;_selectDate(context);},),),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("その他",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
              Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "その他",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                maxLines: null, controller:_NameCon21 ,onChanged: (String value) {setState(() {widget.map["その他"] =  value; });},),),

              Container(margin: EdgeInsets.only(top: 20,bottom: 30),
                child: ElevatedButton(child:Text('アップデート'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                  onPressed: () {update();},),),
            ]))));}

  void start() {
    showModalBottomSheet(context: context,backgroundColor: Colors.white,isScrollControlled: true,useRootNavigator: true,
        shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(20.0),),),
        builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return  Container(height:600,child:widget.map["クーポン有無"] == "公開" ?SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(margin:EdgeInsets.only(top:20,left: 20,right: 10),width: double.infinity,child: Text("検索画面",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Divider(height: 20, thickness: 3, indent: 20, endIndent: 20, color: Colors.black,),
                  Container(height:100,child:Row(children: [
                    Container(margin:EdgeInsets.only(top:5,left: 10),width:80,height:80,child: Image(image: NetworkImage(widget.map["写真"]),),),
                    Expanded(child: Column(children: [
                      Container(margin:EdgeInsets.only(top:10,left: 30),width: double.infinity,child: Text(widget.map0["店舗名"],style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.blueGrey[800]),),),
                      Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text(widget.map["クーポン名"],style: TextStyle(fontSize:12,fontWeight: FontWeight.bold,color: Colors.blueGrey[800])),),
                      Container(margin:EdgeInsets.only(top:5,left: 30),width: double.infinity,child: Text(widget.map0["店舗タイプ"] + "  　　　   " + widget.map0["市区町村"],style: TextStyle(fontSize:10,color: Colors.blueGrey[500])),),
                    ],) )],)),
                  Container(margin:EdgeInsets.only(top:20,left: 20,right: 10),width: double.infinity,child: Text("詳細画面",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Divider(height: 20, thickness: 3, indent: 20, endIndent: 20, color: Colors.black,),
                  Container(margin:EdgeInsets.all(10),child: widget.map["写真"] != "" ?Image(image: NetworkImage(widget.map["写真"]),):Container(),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["クーポン名"],style: TextStyle(fontSize:24,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("内容",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["クーポン説明"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("使用条件",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["クーポン使用条件"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("使用期限",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(myFormat.format(widget.map["クーポン使用期限"].toDate()),style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text("その他",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.green),),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),width: double.infinity,child: Text(widget.map["その他"],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),),),
                  // Container(margin: EdgeInsets.only(top: 20,bottom: 30),width: 100, child: ElevatedButton(child:Text('使う'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[800], shape: const StadiumBorder(),),
                  //   onPressed: () {},),),
                ])):Center(child: Container(margin:EdgeInsets.only(),width: double.infinity,child: Text("現在メニュー情報はありません",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.blueGrey[900]),textAlign: TextAlign.center,),),));}, );});}

  void book(item,index1) {
    showModalBottomSheet(context: context,backgroundColor: Colors.white,
      shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Container(color:Colors.transparent,height: 600,child: ListView.builder(itemCount: item.length, itemBuilder: (context, index) {
              return Card(elevation:0,color:Colors.transparent,child:
              Container(height:60,margin: EdgeInsets.all(5),width:double.infinity,color: Colors.transparent,
                  child:Container(width: double.infinity,color:Colors.transparent,height: 60, child:
                  TextButton(child:Text(item[index], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey[900],),),
                      onPressed: () async {setState(() {
                        switch (index1) {
                        case 1:widget.map["クーポン有無"] = item[index];setState(() {});Navigator.pop(context);break;    }});}),))
              );},),);});}, ).whenComplete(() {setState(() {});});}

  void update (){FirebaseFirestore.instance.collection('店舗').doc(widget.ID).update({'クーポン情報': widget.map});}

  void set (){setState(() {
    _NameCon17.text =  widget.map["クーポン名"];
    _NameCon18.text =  widget.map["クーポン説明"];
    _NameCon19.text =  widget.map["クーポン使用条件"];
    _NameCon21.text =  widget.map["その他"];
  });}

}

