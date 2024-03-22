import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class V5B2Show extends StatefulWidget {
  V5B2Show(this.seleTag,this.seleCou,this.seleKamoku,this.Kamoku,this.Jikan,this.uid,this.syuList);
  String seleTag ;
  int seleCou;
  String seleKamoku;String uid;
  List Kamoku;List Jikan;List<String> syuList;
  @override
  State<StatefulWidget> createState() {
    return _V5B2Showtate();
  }
}

class _V5B2Showtate extends State<V5B2Show> {
  int _currentValue = 30;
  var A1 = 0;var A3 = 0;var A2 = 0;var A4 = 0;var tani = "";
  var list = []; List<String> syuList = [];

  void initState() {
    super.initState();
    syuList = widget.syuList;
    tani = syuList[4];//getButton();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.seleTag+  "曜日" + widget.seleCou.toString()+ "限",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20)),
        centerTitle: true, backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black),elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Container(margin: EdgeInsets.only(top:10,bottom:10),child: Row(children: [
      Container(margin: EdgeInsets.only(top:5),width: 110, child: ElevatedButton(child:  Text('科目を選択'),
        style: ElevatedButton.styleFrom(foregroundColor: Colors.yellow[800], backgroundColor: Colors.white, shape: const StadiumBorder(),), onPressed: () {showPicker();},)),
      Container(margin: EdgeInsets.only(top:5,bottom: 5,left: 10,right: 10), child: Text("科目：",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),),
      Container(margin: EdgeInsets.only(top:5,bottom: 5,left: 0,right: 10), child: Text(widget.seleKamoku,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),),
      Container(margin: EdgeInsets.only(top:5,bottom: 5,left: 10,right: 10), child: Text("単位数：",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),),
      Container(margin: EdgeInsets.only(top:5,bottom: 5,left: 0,), child: Text(tani.toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),),
      // Expanded(child: Container())
    ],),),
    Divider(color: Colors.blueGrey,thickness: 3,),
   // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
    Column(children: [Container(margin: EdgeInsets.only(top:10),child:Text("出席",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.green),)),
    Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      Container(child:TextButton(child: Text("ー",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.blueGrey),),onPressed: (){setState(() {var a = int.parse(syuList[0]) - 1;syuList[0] = a.toString();setButton();;});},)),
      Container(width: 50,height: 50, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,border: Border.all(width: 3,color: Colors.green)),child:Container(alignment:Alignment.center,child:Text(syuList[0],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)))),
      Container(child:TextButton(child: Text("＋",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey),),onPressed: (){setState(() {var a = int.parse(syuList[0]) + 1;syuList[0] = a.toString();setButton();;});},)),
    ],)
    ],),
    Column(children: [Container(margin: EdgeInsets.only(top:10),child:Text("欠席",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.orange),)),
    Row(mainAxisAlignment: MainAxisAlignment.center,children: [
    Container(child:TextButton(child: Text("ー",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey),),onPressed: (){setState(() {var a = int.parse(syuList[1]) - 1;syuList[1] = a.toString();setButton();;});},)),
    Container(width: 50,height: 50, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,border: Border.all(width:  3,color: Colors.orange)),child:Container(alignment:Alignment.center,child:Text(syuList[1],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)))),
    Container(child:TextButton(child: Text("＋",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey),),onPressed: (){setState(() {var a = int.parse(syuList[1]) + 1;syuList[1] = a.toString();setButton();;});},)),
    ],)
    ],),//],),
   // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
    Column(children: [Container(child:Text("遅刻",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.red),)),
    Row(mainAxisAlignment: MainAxisAlignment.center,children: [
    Container(child:TextButton(child: Text("ー",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey),),onPressed: (){setState(() {var a = int.parse(syuList[2]) - 1;syuList[2] = a.toString();setButton();});},)),
    Container(width: 50,height: 50, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,border: Border.all(width:  3,color: Colors.red)),child:Container(alignment:Alignment.center,child:Text(syuList[2],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)))),
    Container(child:TextButton(child: Text("＋",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey),),onPressed: (){setState(() {var a = int.parse(syuList[2]) + 1;syuList[2] = a.toString();setButton();});},)),
    ],)
    ],),
    Column(children: [Container(child:Text("休講",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.blue),)),
    Row(mainAxisAlignment: MainAxisAlignment.center,children: [
    Container(child:TextButton(child: Text("ー",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey),),onPressed: (){setState(() {var a = int.parse(syuList[3]) - 1;syuList[3] = a.toString();setButton();});},)),
    Container(width: 50,height: 50, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,border: Border.all(width:  3,color: Colors.blue)),child:Container(alignment:Alignment.center,child:Text(syuList[3],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)))),
    Container(child:TextButton(child: Text("＋",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey),),onPressed: (){setState(() {var a = int.parse(syuList[3]) + 1;syuList[3] = a.toString();setButton();});},)),
    ],)
    ],),//],),
    ],


    )));
  }
  Future<void> setButton() async {syuList[4] = tani;SharedPreferences prefs = await SharedPreferences.getInstance();prefs.setStringList(widget.seleKamoku,syuList)!;}
   void update() {
   FirebaseFirestore.instance.collection('users').doc(widget.uid).collection("時間割").doc("時間").update({
      widget.seleTag:list,});}

  Future<void> getButton() async {print(syuList);
    SharedPreferences prefs = await SharedPreferences.getInstance();setState(()  {
      syuList= prefs.getStringList(widget.seleKamoku)?? [];
      if (syuList.length == 0){syuList = ["0","0","0","0","0"];tani = syuList[4];}else{;
        tani = syuList[4];A1 = syuList[0] as int;A2 = syuList[1] as int;A3 = syuList[2] as int;A4 = syuList[3] as int;;print(syuList);
      }});
  }
  void showPicker() {
    var itemA =[];var itemB = [];
    for(int i = 0; i<widget.Kamoku.length; i++){itemA.add(widget.Kamoku[i]["科目"]);itemB.add(widget.Kamoku[i]["単位"]);}
    final _pickerItems = itemA.map((item) => Text(item)).toList();
    var selectedIndex = 0;
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(height: 216,
                child: GestureDetector(
                  onTap: () {Navigator.pop(context);},
                  child: CupertinoPicker(backgroundColor: Colors.white,
                    itemExtent: 32,
                    children: _pickerItems,
                    onSelectedItemChanged: (int index) {
                      selectedIndex = index;
                    },),),);},).then((_) {
      if (selectedIndex != null) {setState(()  {widget.seleKamoku = itemA[selectedIndex];tani = itemB[selectedIndex].toString(); syuList[4] = tani.toString();print(syuList);
      });}
     if (selectedIndex != null) {setState(()  async {
       SharedPreferences prefs = await SharedPreferences.getInstance();setState(()  {
       syuList= prefs.getStringList(widget.seleKamoku)?? [];
       if (syuList.length == 0){syuList = ["0","0","0","0","0"];tani = syuList[4];}else{
       A1 = int.parse(syuList[0]);A2 = int.parse(syuList[1]);A3 = int.parse(syuList[2]);A4 = int.parse(syuList[3]);
       }});list = widget.Jikan[0][widget.seleTag] as List;list[widget.seleCou - 1] = widget.seleKamoku;update();setButton();
     });}
      list = widget.Jikan[0][widget.seleTag] as List;list[widget.seleCou - 1] = widget.seleKamoku;update();setButton();

      if (selectedIndex != null) {}

      });}
}



class V5B2ShowV extends StatefulWidget {
  V5B2ShowV(this.uid);
  String uid;
  @override
  State<V5B2ShowV> createState() => _V5B2ShowVState();
}
class _V5B2ShowVState extends State<V5B2ShowV> {
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar:  TabBar(
            tabs: [
              Tab(child: Text("履歴",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
              Tab(child: Text("メモ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
              Tab(child: Text("ToDo",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
            ],),
          body: TabBarView(children: [],
          ),),),);}
}

class V5B2ShowV1 extends StatefulWidget {
  V5B2ShowV1(this.uid);
  String uid;
  @override
  State<V5B2ShowV1> createState() => _V5B2ShowV1State();
}
class _V5B2ShowV1State extends State<V5B2ShowV1> {
  var item = []; var home = "";var TEL = "";var Line="";var site ="";
  @override
  void initState() {
    super.initState();
    _loadData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
           Expanded(
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return Card(shadowColor: Colors.grey[100], elevation: 0, clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(child:Text(item[index],style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.grey))),
                     ])));},),),
        ],));}
  Future<void> _loadData()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();var uid = prefs.getString("uidA")?? "";
    item = [];
    FirebaseFirestore.instance.collection('施術者').doc(uid).collection("メニュー").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {if (doc["Co"]== "方法"){home =doc["ホームページ"];TEL=doc["TEL"];Line=doc["Line"];site=doc["サイト"];}else{item.add(doc);}
        ;});});});}
}

