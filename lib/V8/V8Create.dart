
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kokushi/V8/V8ShopLogin.dart';
import '../V3/V3.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;




class V8Create extends StatefulWidget {
  @override
  State<V8Create> createState() => _V8CreateState();
}
class _V8CreateState extends State<V8Create> {
  var item = ["あり","なし"];
  var item2 = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"];
  var item3 = ["鍼灸師","あんまマッサージ指圧師","柔道整復師","理学療法士"];
  var item4 = ["鍼灸院","鍼灸整骨院","整骨院・接骨院","女性専用鍼灸院","整体院"];
  var item5 = ["メール","URL","写真(QRコードなど)"];
  var item6 = ["公開","非公開"];
  var item7 = ["オンライン","北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"];

  var aa = [];

  final _pageController = PageController(viewportFraction: 0.877);
  double currentPage = 0;
  var _NameCon = TextEditingController(); var _NameCon1 = TextEditingController();var _NameCon2 = TextEditingController();var _NameCon3 = TextEditingController();var _NameCon4 = TextEditingController();var _NameCon5 = TextEditingController();var _NameCon6 = TextEditingController();var _NameCon7 = TextEditingController();var _NameCon7B = TextEditingController();var _NameCon8 = TextEditingController();var _NameCon9 = TextEditingController();var _NameCon10 = TextEditingController();
  var _NameCon11 = TextEditingController();var _NameCon12 = TextEditingController();var _NameCon13 = TextEditingController();var _NameCon14 = TextEditingController();var _NameCon15 = TextEditingController();var _NameCon16 = TextEditingController();var _NameCon17 = TextEditingController();var _NameCon18 = TextEditingController();var _NameCon19 = TextEditingController();var _NameCon20 = TextEditingController();
  var _NameCon21 = TextEditingController();var _NameCon22 = TextEditingController();var _NameCon23 = TextEditingController();var _NameCon24 = TextEditingController();var _NameCon25 = TextEditingController();var _NameCon26 = TextEditingController();var _NameCon27 = TextEditingController();var _NameCon28 = TextEditingController();var _NameCon29 = TextEditingController();var _NameCon30 = TextEditingController();
  var _NameCon31 = TextEditingController();
  var ID = "";
  var name = '';
  var comment = '';
  var image1 = "";var image2 = "";var image3 = "";var image4 = "";var image5 = "";
  var staff = "選択";

  var map = {
    "写真":"",
    "店舗タイプ":"",
    "店舗名":"",
    "都道府県":"",
    "市区町村":"",
    "住所":"",
    "アクセス":"",
    "最寄駅":"",
    "在籍スタッフ資格":"",
    "院紹介":"",
    "スタッフの1日":"",
    "強み":"",
    "研修内容":"",
    "営業時間":"",
    "定休日":"",
    "電話番号":"",
    "客層":"",
    "スタッフ構成":"",
    "店舗URL":"",
    "採用URL":"",
    "見学方法":"",
    "見学方法パターン":"",
    "見学URL":"",
    "見学用写真":"",
    "治療法設備":"",
    "SNS":[],
  };
  var map2 = {
    "写真":"",
    "クーポン有無":"",
    "クーポン名":"",
    "クーポン説明":"",
    "クーポン使用条件":"",
    "クーポン使用期限":Timestamp.now(),
    "その他":"",
  };

  var map3 = {
    "写真":"",
    "セミナー名":"",
    "セミナー説明":"",
    "開催日":Timestamp.now(),
    "時間":"",
    "セミナー有無":"",
    "参加条件":"",
    "定員":"",
    "会場都道府県":"",
    "会場住所":"",
    "セミナー費用":"",
    "申し込み方法":"",
    "申し込み方法パターン":"",
    "申し込みURL":"",
    "申し込み用写真":"",
    "その他":"",};

  void initState() {
    super.initState();_pageController.addListener(() {currentPage = _pageController.page!.toDouble();});
  }

  var co = 0;
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context, initialDate: DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day), firstDate: DateTime(DateTime.now().year, DateTime.now().month), lastDate: DateTime(DateTime.now().year + 5, DateTime.now().month));
    if (picked != null && picked != selectedDate) {
      setState(() {selectedDate = picked;
        if (co == 0){map2["クーポン使用期限"] = selectedDate;}
        else{map3["開催日"] = selectedDate;}

        //controller.text = selectedDate.year.toString() +"年"+ selectedDate.month.toString()+"月"+selectedDate.day.toString()+"日";
          ;});
    }}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,elevation: 0,
          title: Text("店舗登録",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,
          //actions: [IconButton(onPressed: (){start();}, icon: Icon(Icons.remove_red_eye_outlined))],
        ),
        body: GestureDetector( onTap: () => FocusScope.of(context).unfocus(),
            child:SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: SelectableText("",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 20),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("店舗タイプ",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:
                  ElevatedButton(child:  Text(map["店舗タイプ"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                    onPressed: () {book(item4,0);},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("店舗名",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "店舗名",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon ,onChanged: (String value) {setState(() {map["店舗名"] = value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("都道府県",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:
                  ElevatedButton(child:  Text(map["都道府県"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                    onPressed: () {book(item2,1);},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("市区町村",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "市区町村",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon1 ,onChanged: (String value) {setState(() {map["市区町村"] = value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("住所",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "住所",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon2 ,onChanged: (String value) {setState(() {map["住所"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("最寄駅",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "最寄駅",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon3 ,onChanged: (String value) {setState(() {map["最寄駅"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("在籍スタッフ資格",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "在籍スタッフ資格",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon4 ,onChanged: (String value) {setState(() {map["在籍スタッフ資格"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("院紹介",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "院紹介",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon5 ,onChanged: (String value) {setState(() {map["院紹介"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("強み",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText :"強み",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon6 ,onChanged: (String value) {setState(() {map["強み"] = value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("研修内容",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "研修内容",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon7 ,onChanged: (String value) {setState(() {map["研修内容"] = value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("治療法設備",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "治療法設備",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon7B ,onChanged: (String value) {setState(() {map["治療法設備"] = value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("スタッフの1日",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "スタッフの1日",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon8 ,onChanged: (String value) {setState(() {map["スタッフの1日"] = value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("営業時間",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "営業時間",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon9 ,onChanged: (String value) {setState(() {map["営業時間"] = value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("定休日",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "休日",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon10 ,onChanged: (String value) {setState(() {map["定休日"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("客層",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "客層",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon11 ,onChanged: (String value) {setState(() {map["客層"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("スタッフ構成",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "スタッフ構成",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon12 ,onChanged: (String value) {setState(() {map["スタッフ構成"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("店舗URL",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "店舗URL",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon13 ,onChanged: (String value) {setState(() {map["店舗URL"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("採用URL",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "採用URL",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon14 ,onChanged: (String value) {setState(() {map["採用URL"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("見学方法",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "見学方法",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon15 ,onChanged: (String value) {setState(() {map["見学方法"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("見学方法パターン",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: ElevatedButton(child: Text(map["見学方法パターン"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                    onPressed: () {book(item5,3);},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("見学URL",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "見学URL",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon16 ,onChanged: (String value) {setState(() {map["見学URL"] =  value; });},),),


                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("クーポン有無",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: ElevatedButton(child: Text(map2["クーポン有無"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                    onPressed: () {book(item6,4);},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("クーポン名",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "クーポン名",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon17 ,onChanged: (String value) {setState(() {map2["クーポン名"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("クーポン説明",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "クーポン説明",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon18 ,onChanged: (String value) {setState(() {map2["クーポン説明"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("クーポン使用条件",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "クーポン使用条件",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon19 ,onChanged: (String value) {setState(() {map2["クーポン使用条件"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("クーポン使用期限",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:
                  // TextField(decoration: InputDecoration(hintText : "クーポン使用期限",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                  //   maxLines: null, controller:_NameCon20 ,onChanged: (String value) {setState(() {map2["クーポン使用期限"] =  value; });},),
                  Container(margin: EdgeInsets.only(top: 0,bottom: 30),width: double.infinity, child: TextButton(child:Text(map2["クーポン使用期限"].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800])), onPressed: () {co = 0;_selectDate(context);},),),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("その他",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "その他",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon21 ,onChanged: (String value) {setState(() {map2["その他"] =  value; });},),),


                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("セミナー有無",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: ElevatedButton(child: Text(map3["セミナー有無"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                    onPressed: () {book(item6,5);},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("参加条件",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "参加条件",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon22 ,onChanged: (String value) {setState(() {map3["参加条件"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("会場都道府県",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "会場都道府県",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon23 ,onChanged: (String value) {setState(() {map3["会場都道府県"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("会場住所",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "会場住所",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon24 ,onChanged: (String value) {setState(() {map3["会場住所"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("セミナー費用",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "セミナー費用",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon25 ,onChanged: (String value) {setState(() {map3["セミナー費用"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("定員",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "定員",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon26 ,onChanged: (String value) {setState(() {map3["定員"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("セミナー説明",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "セミナー説明",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon27 ,onChanged: (String value) {setState(() {map3["セミナー説明"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("開催日",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(margin: EdgeInsets.only(top: 0,bottom: 30),width: double.infinity, child: TextButton(child:Text(map3["開催日"].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[800])), onPressed: () {co = 1;_selectDate(context);},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("時間",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "セミナー時間",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon28 ,onChanged: (String value) {setState(() {map3["時間"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("申し込み方法",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "申し込み方法",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon29 ,onChanged: (String value) {setState(() {map3["申し込み方法"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("申し込み方法パターン",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,height: 60,margin: EdgeInsets.only(top:10,left: 20,right: 20),child: ElevatedButton(child: Text(map3["申し込み方法パターン"].toString()), style: ElevatedButton.styleFrom(foregroundColor: Colors.grey[600], backgroundColor: Colors.grey.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                    onPressed: () {book(item5,6);},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("申し込みURL",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "申し込みURL",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon30 ,onChanged: (String value) {setState(() {map3["申し込みURL"] =  value; });},),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("その他",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
                  Container(width:double.infinity,margin: EdgeInsets.only(top:10,left: 20,right: 20),child:TextField(decoration: InputDecoration(hintText : "その他",filled: true, fillColor: Colors.grey.shade200, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none,)),
                    maxLines: null, controller:_NameCon31 ,onChanged: (String value) {setState(() {map3["その他"] =  value; });},),),

                  Container(width:150,margin: EdgeInsets.only(top:50,bottom: 20),child:ElevatedButton(child: const Text('保存'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey, shape: const StadiumBorder(),),
                    onPressed: () { add();},),),
                ]))));
  }
  void start() {
    showModalBottomSheet(context: context,backgroundColor: Colors.white,isScrollControlled: true,useRootNavigator: true,
        shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(20.0),),),
        builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return  Container(height:600,child:Column(children: [
              Row(children: [
                Container(margin:EdgeInsets.only(top:5),child: Text("国試plus治療院",style: TextStyle(fontSize:10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
                Container(margin:EdgeInsets.only(top:5,left: 10),child: Text("鍼灸師/柔道整復師/あんまマッサージ指圧師",style: TextStyle(fontSize:10,fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.center,),),
                Expanded(child:Container(margin:EdgeInsets.only(top:5,right: 10),alignment:Alignment.centerRight,child: Icon(Icons.bookmark_border))),
              ],),
              Row(children: [
                Container(margin:EdgeInsets.only(top:5),width:60,height:60,child: Image(image: NetworkImage(""),),),
                Expanded(child:Container(margin:EdgeInsets.only(top:5,left: 10),child: Text("鍼灸師/柔道整復師/あんまマッサージ指圧師",style: TextStyle(fontSize:10,fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.center,),),),
              ],)
            ]));}, );});}

  void start2(index) {
    showModalBottomSheet(context: context,backgroundColor: Colors.white,isScrollControlled: true,useRootNavigator: true,
        shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(20.0),),),
        builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return  Container(height:600,child:SingleChildScrollView(child:Column(children: [])));}, );});}

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
                          case 0:print(index);map["店舗タイプ"] = item[index];Navigator.pop(context);setState(() {});break;
                          case 1:print(index);map["都道府県"] = item[index];Navigator.pop(context);setState(() {});break;
                          case 2:print(index);map["在籍スタッフ資格"] = item[index];setState(() {});Navigator.pop(context);break;
                          case 3:print(index);map["見学方法パターン"] = item[index];setState(() {});Navigator.pop(context);break;
                          case 4:print(index);map2["クーポン有無"] = item[index];setState(() {});Navigator.pop(context);break;
                          case 5:print(index);map3["セミナー有無"] = item[index];setState(() {});Navigator.pop(context);break;
                          case 6:print(index);map3["申し込み方法パターン"] = item[index];setState(() {});Navigator.pop(context);break;
                        }});}),))
              );},),);});}, ).whenComplete(() {setState(() {});});}

  String randomString(int length) {
    const _randomChars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },);
    return new String.fromCharCodes(codeUnits);}



  Future<void> add() async {ID = randomString(20);
  FirebaseFirestore.instance.collection('店舗').doc(ID).set({
    "トップ":["","","","",""],
    "基本情報":map,
    "クーポン情報":map2,
    "セミナー情報":map3,
    "ID":ID,
    "pass":randomString(6),
  });
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top(map,map2,map3,["","","","",""],ID ))); }

}


class V8Top extends StatefulWidget {
  V8Top(this.map,this.map2,this.map3,this.item,this.ID);
  Map map;Map map2;Map map3;List item;String ID;

  @override
  State<V8Top> createState() => _V8TopState();
}
class _V8TopState extends State<V8Top> {
  var photo1 = "";
  var photo2 = "";
  var photo3 = "";
  var photo4 = "";
  var photo5 = "";
  @override
  void initState() {
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("スライド編集", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize:15,),),
          centerTitle: true, iconTheme: IconThemeData(color: Colors.black),elevation: 0,
          actions: <Widget>[
            IconButton(onPressed: () {  Navigator.pop(context); }, icon:Icon(Icons.done))
          ],
        ),
        body: SingleChildScrollView(child: Column(children: <Widget>[
          Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("基本情報写真",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
          Container(margin: EdgeInsets.only(right: 0), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey),),
            child:MaterialButton(padding: EdgeInsets.all(10.0), textColor: Colors.black, elevation: 8.0,
              child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(photo1), fit: BoxFit.cover,),),
                child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,widget.map2,widget.map3,widget.item,0,widget.ID,1))).then((value) => loadData());},
            ),),
          Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("クーポン情報写真",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
          Container(margin: EdgeInsets.only(right: 0), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey),),
            child:MaterialButton(padding: EdgeInsets.all(10.0), textColor: Colors.black, elevation: 8.0,
              child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(photo2), fit: BoxFit.cover,),),
                child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,widget.map2,widget.map3,widget.item,0,widget.ID,2))).then((value) => loadData());},
            ),),
          Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("セミナー情報写真",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
          Container(margin: EdgeInsets.only(right: 0), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey),),
            child:MaterialButton(padding: EdgeInsets.all(10.0), textColor: Colors.black, elevation: 8.0,
              child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(photo3), fit: BoxFit.cover,),),
                child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,widget.map2,widget.map3,widget.item,0,widget.ID,3))).then((value) => loadData());},
            ),),
          Container(child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),itemCount: widget.item.length, itemBuilder: (context, index) {
            return GestureDetector(onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,widget.map2,widget.map3,widget.item,index,widget.ID,4))).then((value) => loadData());},
                child:Card(shadowColor: Colors.grey[100], elevation: 8, clipBehavior: Clip.antiAlias, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),),
                    child: Container(margin: EdgeInsets.all(10.0), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey),),
                      child:MaterialButton(padding: EdgeInsets.all(10.0), textColor: Colors.black, elevation: 8.0,
                        child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.item[index]), fit: BoxFit.cover,),),
                          child: Padding(padding: const EdgeInsets.all(8.0), child: Text(index.toString()),),),
                        onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,widget.map2,widget.map3,widget.item,index,widget.ID,4))).then((value) => loadData());},
                      ),)));},),),

          Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("見学用写真",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
          Container(margin: EdgeInsets.only(right: 0), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey),),
            child:MaterialButton(padding: EdgeInsets.all(10.0), textColor: Colors.black, elevation: 8.0,
              child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(photo4), fit: BoxFit.cover,),),
                child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,widget.map2,widget.map3,widget.item,0,widget.ID,5))).then((value) => loadData());},
            ),),

          Container(width:double.infinity,margin: EdgeInsets.only(top:20,left: 10,right: 5),child: Text("セミナー申し込み用写真",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.blueGrey[800]),textAlign: TextAlign.center,),),
          Container(margin: EdgeInsets.only(right: 0), width: 350, height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  border: Border.all(color: Colors.grey),),
            child:MaterialButton(padding: EdgeInsets.all(10.0), textColor: Colors.black, elevation: 8.0,
              child: Container(width:double.infinity,height:double.infinity,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(photo5), fit: BoxFit.cover,),),
                child: Padding(padding: const EdgeInsets.all(8.0), child: Text(""),),),
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V8Top1(widget.map,widget.map2,widget.map3,widget.item,0,widget.ID,6))).then((value) => loadData());},
            ),),
        ])));
  }

  Future<void> loadData()  async {
    FirebaseFirestore.instance.collection("店舗").where("ID" ,isEqualTo: widget.ID).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {setState(() {widget.map = doc["基本情報"];widget.map2 = doc["クーポン情報"];widget.map3 = doc["セミナー情報"];widget.item = doc["トップ"];photo1 = doc["基本情報"]["写真"];photo2 = doc["クーポン情報"]["写真"];photo3 = doc["セミナー情報"]["写真"];});});});}

}



class V8Top1 extends StatefulWidget {
  V8Top1(this.map,this.map2,this.map3,this.item,this.index,this.ID,this.co);
  Map map;Map map2;Map map3;List item;int index;String ID; int co;

  @override
  State<V8Top1> createState() => _V8Top1State();
}
class _V8Top1State extends State<V8Top1> {

  void initState() {
    super.initState();
    ID = randomString(20);
    if(widget.co == 1){photo = widget.map["写真"];}
    if(widget.co == 2){photo = widget.map2["写真"];}
    if(widget.co == 3){photo = widget.map3["写真"];}
    if(widget.co == 4){photo = widget.item[widget.index];}
    if(widget.co == 5){photo = widget.map["見学用写真"];}
    if(widget.co == 6){photo = widget.map3["申し込み用写真"];}
  }
  var photo = "";
  File? get nil => null;
  String imgPathUse="";
  File? _image;
  bool _B = true;
  final imagePicker = ImagePicker();
  var ID = "";

  Future getImageFromCamera() async {
    _B = true;
    final pickedFile = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {if (pickedFile != null) {_image = File(pickedFile.path);}});}
  PickedFile? pickedFile;
  Future getImageFromGarally() async {
    _B = true;
    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {_image = File(pickedFile!.path);}});
  }
  Future<void> uploadFile(String sourcePath, String uploadFileName) async {
    showProgressDialog();
    final FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("images"); //保存するフォルダ
    io.File file = io.File(sourcePath);
    UploadTask task = ref.child(uploadFileName).putFile(file);
    try {
      var snapshot = await task;
    } catch (FirebaseException) {}
    //addFilePath(uid, pickedFile!.path);
    getImgs(ID);
    // addFilePath(widget.uid, pickedFile!.path);
    // Navigator.of(context).pop();
  }

  Future<void> addFilePath(String id, String path) async {
    if(widget.co == 1){widget.map["写真"] = imgPathUse;FirebaseFirestore.instance.collection('店舗').doc(widget.ID).update({'基本情報': widget.map}, );}
    if(widget.co == 2){widget.map2["写真"] = imgPathUse;FirebaseFirestore.instance.collection('店舗').doc(widget.ID).update({'クーポン情報': widget.map2}, );}
    if(widget.co == 3){widget.map3["写真"] = imgPathUse;FirebaseFirestore.instance.collection('店舗').doc(widget.ID).update({'セミナー情報': widget.map3}, );}
    if(widget.co == 4){widget.item[widget.index] = imgPathUse;FirebaseFirestore.instance.collection('店舗').doc(widget.ID).update({'トップ': widget.item,}, );}
    if(widget.co == 5){widget.map["見学用写真"] = imgPathUse;FirebaseFirestore.instance.collection('店舗').doc(widget.ID).update({'基本情報': widget.map}, );}
    if(widget.co == 6){widget.map3["申し込み用写真"] = imgPathUse;FirebaseFirestore.instance.collection('店舗').doc(widget.ID).update({'セミナー情報': widget.map3}, );}

    Navigator.pop(context, imgPathUse);Navigator.of(context, rootNavigator: true).pop();
    setState(() {});
  }
  void getImgs(String imgPathRemote) async{
    //  if ((imgPathRemote != "") && (imgPathRemote != null)) {
    try {
      imgPathUse = await FirebaseStorage.instance.ref().child("images").child(imgPathRemote).getDownloadURL();
      addFilePath(ID, pickedFile!.path);
    }
    catch (FirebaseException) {}  //} else{}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,elevation: 0,
          title: Text("編集",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize:15,),),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(child: Container(alignment: Alignment.center,
                  child: _image == null ? Image.network(photo)
                      : Image.file(_image!)),),
              Container(margin: EdgeInsets.only(top:20,bottom: 20),
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    FloatingActionButton(backgroundColor: Colors.blueGrey,onPressed: getImageFromGarally, child: Icon(Icons.photo_album))
                  ])),
              Container(width:150,margin: EdgeInsets.only(top:20,bottom: 20),child:ElevatedButton(child: const Text('保存'), style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, foregroundColor: Colors.white, shape: const StadiumBorder(),),
                onPressed: () {uploadFile(pickedFile!.path,ID);
                setState(() {FocusScope.of(context).unfocus(); });},),)
            ])));
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

  String randomString(int length) {
    const _randomChars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },);
    return new String.fromCharCodes(codeUnits);}

}