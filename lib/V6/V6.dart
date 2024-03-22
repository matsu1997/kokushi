import 'dart:convert';
import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart' as ja;
import 'package:shared_preferences/shared_preferences.dart';

import 'V6Range.dart';
import 'V6Review.dart';



class V6 extends StatefulWidget {
  get co => 0;

  @override

  State<V6> createState() => _V6State();
}

class _V6State extends State<V6>with TickerProviderStateMixin , WidgetsBindingObserver  {
  //  var item1 = [];var item2 = [];var item3 = ["自作","英単語", "漢字", "古文", "世界史", "日本史", "地理", "生物", "物理", "化学",];List<List<dynamic>> item4 = []; List<String> ia  = [];
  var item01 = [];List<String> item01B = [];var item02 = [];var item03 = [];var item04 = [];
  var item11 = []; var item11B = [];var item22 = [];var item33 = [];var item44 = [];
  List<String> itemDate00 = [];var itemDate01 = []; var itemDate07 = []; var itemDate030 = [];
  var itemDate0 = [];var itemDate1 = []; var itemDate7 = []; var itemDate30 = [];
  var text = "";var text2 = "";var ID = "";
  var date = ""; var date1 = ""; var date7 = ""; var date30 = "";
  var map = {};
  var count = 0;var itemco = 0;var time = 1;var co = 0;var firstco = 0;var A = 0.0;
  var ankertco = 0;
  var YesB = false;var NoB = false;var SaveB = false;var DeleteB = false;
  ///icon bookmark    Thumb Up   Thumb down
  Color color  = Colors.red;
  FlutterTts flutterTts = FlutterTts();
  final _player = ja.AudioPlayer(handleInterruptions: false, androidApplyAudioAttributes: false, handleAudioSessionActivation: false,);

  List<List<dynamic>>  item = [];


  bool isPlaying = true;
  late AnimationController controller;
  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }
  double progress = 1.0;
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();//getID();main();itemSet ();
    Future.delayed(Duration(seconds: 3), () {ankertco = 0;firstco = 1;});
    co = item.length;
    super.initState();V5First();//first();
    // initAudioService();
    // AudioSession.instance.then((audioSession) async {
    //   await audioSession.configure(AudioSessionConfiguration.speech());
    //   _handleInterruptions(audioSession);
    // });
  }
  void notify() {if (countText == '0:00:00') {setState(() {color = Colors.white;}) ;} }


  Widget pageWidget(index) => Center(
      child: Row(children: <Widget>[
        Expanded(child: Column(children: <Widget>[
          Container(child: Column(children: <Widget>[
            // Container(child: Visibility(visible: _visible, child: Column(children: <Widget>[
            //   Container(width: double.infinity,margin:EdgeInsets.only(top: 20),child:Text(startTime.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 50), textAlign: TextAlign.center,),)
            // ]))),
            Row(children: [Expanded(child: Container()),],),
            Column(children: [
              Container(margin: EdgeInsets.only(top: 20,left: 30),width: double.infinity, child:item[index][3]! == "英単語"? Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(top: 0), child:Icon(Icons.format_color_text_outlined,color: Colors.white,size: 50,)):
              Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(top: 0),  child:item[index][3]! == "漢字"?Icon(Icons.edit_outlined,color: Colors.white,size: 50,):
              Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(top: 0),  child:item[index][3]! == "古文"?Icon(Icons.receipt_long,color: Colors.white,size: 50,):
              Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(top: 0), child:item[index][3]! == "世界史"?Icon(Icons.language_outlined,color: Colors.white,size: 50,):
              Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(top: 0), child:item[index][3]! == "漢文単語"?Icon(Icons.edit_note,color: Colors.white,size: 50,):
              Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(top: 0), child:item[index][3]! == "生物"?Icon(Icons.coronavirus_outlined,color: Colors.white,size: 50,):
              Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(top: 0), child:Icon(Icons.history_edu,color: Colors.white,size: 50,))//日本史
              )))))),
              Row(children: [Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(top: 0,left:30), child:Text(item[index][3],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
                Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(top: 3,left:0),child:TextButton(child: RichText(text: TextSpan(style: Theme.of(context).textTheme.bodyText2,
                    children:  [
                      TextSpan(text: A.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                      TextSpan(text: " 秒", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                    ]),), onPressed: () {},
                ),)],),],),
            Container(margin: EdgeInsets.only(top: 0,bottom: 5, left: 20, right: 20), child:Text("問題",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
            Container(margin: EdgeInsets.only(top: 3, left: 20, right: 20), width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Colors.white,),
                child: Column(children: <Widget>[
                  Container(margin: EdgeInsets.only(top: 40, left: 10, right: 10,bottom:40),width:double.infinity,alignment: Alignment.center, child: Text(item[index][0],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20), textAlign: TextAlign.center,),),
                ])),
            Container(margin: EdgeInsets.only(top:20,bottom: 5, left: 20, right: 20), child:Text('答え',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
            Container(margin: EdgeInsets.only(top: 3, left: 20, right: 20), width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: color,),
                child: Column(children: <Widget>[
                  Container(margin: EdgeInsets.only(top: 40, left: 10, right: 10,bottom:40),width:double.infinity,alignment: Alignment.center, child: Text(item[index][1],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red,fontSize: 20), textAlign: TextAlign.center,),),
                ])),


          ],)),])),
        Container(width:60,child: Column(children: <Widget>[
          Expanded(child: Container()),
          // Container(child:Icon(Icons.format_color_text_outlined,color: Colors.white,size: 30,),),
          // Container(margin: EdgeInsets.only(top:0,), child:Text('英単語',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),),
          Container(margin:EdgeInsets.only(top: 20),child:YesB == false ?IconButton(icon:  Icon(Icons.thumb_up,color: Colors.white,size: 30,), onPressed: () {setState(() {
            if(item01B.contains(item[index][0]) == false){item01B.add(item[index][0]);setDate01B();}
            print(item.length);Yes();YesB = true;});},):
          IconButton(icon:  Icon(Icons.thumb_up,color: Colors.green,size: 30,), onPressed: () {setState(() {Yes2();YesB = false;});},)),
          Container(margin: EdgeInsets.only(top:0,), child:Text('覚えた',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),),

          Container(margin:EdgeInsets.only(top: 20),child:NoB == false ?IconButton(icon:  Icon(Icons.thumb_down,color: Colors.white,size: 30,), onPressed: () {setState(() {
            if(itemDate00.contains(item[index][0]) == false){itemDate00.add(item[index][0]);setDate00();}item.insert(index + 5,item[index]);  No();NoB = true;});},):
          IconButton(icon:  Icon(Icons.thumb_down,color: Colors.red,size: 30,), onPressed: () {setState(() {No2();NoB = false;});},),),
          Container(margin: EdgeInsets.only(top:0,), child:Text('まだ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),),

          Container(margin:EdgeInsets.only(top: 20),child:SaveB == false ?IconButton(icon:  Icon(Icons.bookmark_rounded,color: Colors.white,size: 30,), onPressed: () {setState(() {save();SaveB = true;});},):
          IconButton(icon:  Icon(Icons.bookmark_rounded,color: Colors.orange,size: 30,), onPressed: () {setState(() {save2();SaveB = false;});},)),
          Container(margin: EdgeInsets.only(top:0,), child:Text('保存',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),),

          Container(margin:EdgeInsets.only(top: 20),child:DeleteB == false ?IconButton(icon:  Icon(Icons.highlight_off,color: Colors.white,size: 30,), onPressed: () {setState(() {delete();DeleteB = true;});},):
          IconButton(icon:  Icon(Icons.highlight_off,color: Colors.purpleAccent,size: 30,), onPressed: () {setState(() {delete2();DeleteB = false;});},)),
          Container(margin: EdgeInsets.only(top:0,bottom: 50), child:Text('まだ\n必要ない',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),),
        ]))

      ]) );

  @override
  Widget build(BuildContext context) {
    return   Scaffold(backgroundColor:Colors.black.withOpacity(0.7),
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(60.0),
        child: AppBar(backgroundColor:Colors.black.withOpacity(0.7),
          actions: [Row(children: [
            Container(height:90,width:100,child: Column(children: [IconButton(icon:Icon(Icons.compare_arrows,color: Colors.white,size: 30,), onPressed: () { }),//Navigator.of(context).push(MaterialPageRoute(builder: (context) => V6Range())).then((value) => first()); },),
              //  Container(child:Text('範囲',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),),
            ],)),
            Container(height:90,width:50, child:Column(children: [ IconButton(icon:Icon(Icons.access_time_outlined,color: Colors.white,size: 30,), onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V6Review())); },),
              //   Container( child:Text('足跡',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),),
            ],)),
          ],)],
        ),
      ),
      body: Swiper(itemBuilder: (context, index) => pageWidget(index), itemCount: item.length, scrollDirection: Axis.vertical,
        onIndexChanged:(index) {flutterTts.stop();YesB = false;NoB = false;SaveB = false;DeleteB = false;itemco = index;ankertco = ankertco + 1;print(ankertco); print(firstco);if(firstco == 1){ if(ankertco == 10){ankertco = 0;ankert(); };}set ();},
      ),);}


  Future<void> V5First() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var first = prefs.getString("V5first") ?? "";
    if (first != "1") { prefs.setString("V5first","1");showModalBottomSheet(isScrollControlled: true, context: context,backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
        builder: (context) {return Container(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(margin :EdgeInsets.only(top:30,bottom: 0,right: 20),width: 150,height: 150, child:Image(image: AssetImage("images/brain.png"),),),
                  Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("分散・シャッフル学習「short」",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,)),
                  Container(width:double.infinity,margin :EdgeInsets.only(top: 30),child:Text("短時間で多くの問題に触れる",style: TextStyle(color: Colors.blueGrey[800],fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
                  Container(width:double.infinity,margin :EdgeInsets.only(top: 10,bottom:50,left: 20,right: 20),child:Text("あなたが覚えてない、解いてない問題・復習すべき問題をチョイスして表示されます。画面右上のアイコンより範囲を選択し、学習を始めましょう。忘却曲線を元に復習問題が表示されます。なるべく毎日使うようにしましょう!",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 15,height: 3),textAlign: TextAlign.center,)),
                ])));});
    }}

  void set (){setState(() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (item.length != 0){
      A =  prefs.getDouble("CountTime" + item[itemco][3])?? 3.0;
      color = Colors.red;
      controller = AnimationController(vsync: this, duration: Duration(seconds: A.toInt() + 1),);
      controller.addListener(() {notify();
      if (controller.isAnimating) {setState(() {progress = controller.value;});} else {setState(() {progress = 1.0;isPlaying = true;});}
      });
      controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
      setState(() {isPlaying = true;});


      if(widget.co == 0){ text = item[itemco][0];text2 = item[itemco][1];}else{text = item[itemco][1];text2 = item[itemco][0];}
      _speak();//Future.delayed(Duration(seconds:A.toInt()), () {setState(() {color = Colors.white;});});
    }else{}
  });}

  Future<void> _speak() async {
    if (item[0][3] == "英単語" && widget.co ==0){await flutterTts.setLanguage("en-US");} else{flutterTts.setLanguage("ja-JP");}
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(1.0);
    if (item[0][3] == "漢字" ||item[0][3] == "漢文単語"||item[0][3] == "世界史"||item[0][3] == "日本史"||item[0][3] == "生物" ){ await flutterTts.speak("");} else{await flutterTts.speak(text);}
  }

  Future<void> Yes () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var aa =  prefs.getStringList("V5覚えた")??[];aa.add(item[itemco][0]);
    prefs.setStringList("V5覚えた", aa);
  }
  Future<void> No () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var aa =  prefs.getStringList("V5まだ")??[];aa.add(item[itemco][0]);
    prefs.setStringList("V5まだ", aa);
  }
  Future<void> save () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var aa =  prefs.getStringList("V5保存")??[];aa.add(item[itemco][0]);
    prefs.setStringList("V5保存", aa);
  }
  Future<void> delete () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var aa =  prefs.getStringList("V5必要ない")??[];aa.add(item[itemco][0]);
    prefs.setStringList("V5必要ない", aa);
  }

  Future<void> Yes2 () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var aa =  prefs.getStringList("V5覚えた")??[];aa.remove(item[itemco][0]);
    prefs.setStringList("V5覚えた", aa);
  }
  Future<void> No2 () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var aa =  prefs.getStringList("V5まだ")??[];aa.remove(item[itemco][0]);
    prefs.setStringList("V5まだ", aa);
  }
  Future<void> save2 () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var aa =  prefs.getStringList("V5保存")??[];aa.remove(item[itemco][0]);
    prefs.setStringList("V5保存", aa);
  }
  Future<void> delete2 () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var aa =  prefs.getStringList("V5必要ない")??[];aa.remove(item[itemco][0]);
    prefs.setStringList("V5必要ない", aa);
  }

  Future<void> setDate00 () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("V5" + date, itemDate00);
  }
  Future<void> setDate01B () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("V5覚えた" + date, item01B);
  }
  Future<void> set1 () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    item01 =  prefs.getStringList("V5覚えた")??[];
    item01B =  prefs.getStringList("V5覚えた" + date)??[];
    item02 =  prefs.getStringList("V5まだ")??[];
    item03 =  prefs.getStringList("V5保存")??[];
    item04 =  prefs.getStringList("V5必要ない")??[];
    itemDate00 =  prefs.getStringList("V5" + date)??[];
    itemDate01 =  prefs.getStringList("V5" + date1)??[];
    itemDate07 =  prefs.getStringList("V5" + date7)??[];
    itemDate030 =  prefs.getStringList("V5" + date30)??[];
    set2 ();
  }
  void set2 (){item11 = [];item22 = [];item33 = [];item44 = [];itemDate1 = [];itemDate7 = [];itemDate30 = [];item11B = [];
  setState(() {
    for(int i = 0; i<item.length; i++) {
      for (int ii = 0; ii < item01.length; ii++) {
        if (item[i][0] == item01[ii]) {item11.add(item[i]);}}

      for (int ii = 0; ii < item01B.length; ii++) {
        if (item[i][0] == item01B[ii]) {item11B.add(item[i]);}}

      for (int ii = 0; ii < item02.length; ii++) {
        if (item[i][0] == item02[ii]) {item22.add(item[i]);}}

      for (int ii = 0; ii < item03.length; ii++) {
        if (item[i][0] == item03[ii]) {item33.add(item[i]);}}

      for (int ii = 0; ii < item04.length; ii++) {
        if (item[i][0] == item04[ii]) {item44.add(item[i]);}}

      for (int ii = 0; ii < itemDate00.length; ii++) {
        if (item[i][0] == itemDate00[ii]) {itemDate0.add(item[i]);}}

      for (int ii = 0; ii < itemDate01.length; ii++) {
        if (item[i][0] == itemDate01[ii]) {itemDate1.add(item[i]);}}

      for (int ii = 0; ii < itemDate07.length; ii++) {
        if (item[i][0] == itemDate07[ii]) {itemDate7.add(item[i]);}}

      for (int ii = 0; ii < itemDate030.length; ii++) {
        if (item[i][0] == itemDate030[ii]) {itemDate30.add(item[i]);}}

    } });

  set3();}


  void set3 (){
    for (int i = 0; i < item11.length; i++) {
      item.remove(item11[i]);
    }
    for (int i = 0; i < item33.length; i++) {
      item.remove(item33[i]);
    }
    for (int i = 0; i < item44.length; i++) {
      item.remove(item44[i]);
    }
    for (int i = 0; i < item22.length; i++) {
      item.insert(i * 3,item22[i]);
    }

    for (int i = 0; i < itemDate30.length; i++) {
      item.insert(i * 2 ,itemDate30[i]);
    }
    for (int i = 0; i < itemDate7.length; i++) {
      item.insert(i * 3 ,itemDate7[i]);
    }
    for (int i = 0; i < itemDate1.length; i++) {
      item.insert(i * 4 ,itemDate1[i]);
    }
    for (int i = 0; i < itemDate0.length; i++) {
      item.insert(i * 10 ,itemDate0[i]);
    }
    for (int i = 0; i < item11B.length; i++) {
      item.remove(item11B[i]);
    }
  }
  void ankert() {
    DateTime now = DateTime.now();DateFormat outputFormat = DateFormat('yyyy年MM月dd日');date = outputFormat.format(now);
    FirebaseFirestore.instance.collection('result').doc(date).update({"V5": FieldValue.arrayUnion([randomString(5) +"★" + ID ]),});
  }
  String randomString(int length) {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length, (index) {
      final n = rand.nextInt(_charsLength);
      return _randomChars.codeUnitAt(n);
    },);return new String.fromCharCodes(codeUnits);
  }
}
