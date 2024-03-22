
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class V6Review extends StatefulWidget {

  @override
  State<V6Review> createState() => _V6ReviewState();
}

class _V6ReviewState extends State<V6Review> {

  final _tab = <Tab> [
    Tab( text:'覚えた', icon: Icon(Icons.thumb_up,color: Colors.green,)),
    Tab( text:'まだ', icon: Icon(Icons.thumb_down,color: Colors.red,)),
    Tab( text:'保存', icon: Icon(Icons.bookmark_rounded,color: Colors.orange)),
    Tab( text:'必要ない', icon: Icon(Icons.highlight_off,color: Colors.purpleAccent)),
  ];
  var item1 = [];
  var item2 = [];
  var item3 = [];
  var item4 = [];
  var item11 = [];
  var item22 = [];
  var item33 = [];
  var item44 = [];

  var All = [];
  void initState() {
    super.initState();
   // All1 ();
    set ();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(backgroundColor:Colors.black.withOpacity(0.7),
          leading: IconButton(icon:  Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () {Navigator.pop(context);},),
          title:  Text('足跡'),
          bottom: TabBar(tabs: _tab),
        ),
        body: TabBarView(
            children: <Widget> [V6Review1(item11,0),V6Review1(item22,1),V6Review1(item33,2),V6Review1(item44,3)]
        ),
      ),
    );
  }
  Future<void> set () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    item1 =  prefs.getStringList("V5覚えた")??[];print(item1);
    item2 =  prefs.getStringList("V5まだ")??[];
    item3 =  prefs.getStringList("V5保存")??[];
    item4 =  prefs.getStringList("V5必要ない")??[];
    set2 ();
  }
  void set2 (){
    setState(() {
      for(int i = 0; i<All.length; i++) {
        for (int ii = 0; ii < item1.length; ii++) {
          if (All[i][0] == item1[ii]) {
            item11.add(All[i]);
          }
        }

        for (int ii = 0; ii < item2.length; ii++) {
          if (All[i][0] == item2[ii]) {
            item22.add(All[i]);
          }
        }

        for (int ii = 0; ii < item3.length; ii++) {
          if (All[i][0] == item3[ii]) {
            item33.add(All[i]);
          }
        }

        for (int ii = 0; ii < item4.length; ii++) {
          if (All[i][0] == item4[ii]) {
            item44.add(All[i]);
          }
        }
      } });}}


class V6Review1 extends StatefulWidget {
  @override
  V6Review1(this.item,this.count);
  List item; int count;
  @override
  State<V6Review1> createState() => _V6Review1State();
}

class _V6Review1State extends State<V6Review1> {
  var co = 0;var name = "";var item0 = [];var item = [];
  void initState() {
    super.initState();
    item0 = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => false,
        child: Scaffold(backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(backgroundColor: Colors.black, child: const Icon(Icons.search),
            onPressed: () {SearchShow();},),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(margin: EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
                  itemCount: widget.item.length, itemBuilder: (context, index) {
                    return Card(elevation: 0,color:Colors.grey[200],child:
                    ListTile(
                      title: Text(widget.item[index][0],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
                      subtitle:Text(widget.item[index][3],style: TextStyle(color: Colors.blueGrey[700],fontWeight: FontWeight.bold,fontSize: 10), textAlign: TextAlign.center),
                      onTap: (){co = index;Edite();},),
                    );},),),

              ],),),));

  }
  void SearchShow() {
    showModalBottomSheet(isScrollControlled: true,context: context,backgroundColor: Colors.white,
      shape:  const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) { return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Container(child:SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () { name = "英単語";search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("英単語",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {name = "漢字";search ();},
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("漢字",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {name = "古文";search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("古文",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {name = "世界史";search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("世界史",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {name = "日本史";search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("日本史",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {name = "漢文単語";search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("漢文単語",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                  Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {name = "生物";search (); },
                    child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("生物",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),

                  //   Container(margin: EdgeInsets.all(10),child:GestureDetector(onTap: () {name = "リセット";setState(() {widget.item = item0;}); },
                  //     child: Container(margin: EdgeInsets.all(10),width:double.infinity,child:Text("リセット",style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center),),),),
                ],)),);});}, );}

  void search (){item = [];widget.item = item0;
  for (int ii = 0; ii < widget.item.length; ii++) {
    if (widget.item[ii][3] == name) {
      setState(() {  item.add(widget.item[ii]);});
    }}
  if (item.length == 0){ setState(() { widget.item = [];});}
  widget.item = item;
  Navigator.pop(context);
  }
  Future<void> Edite() async {
    showDialog(context: context, builder: (context) => WillPopScope(
        child:  AlertDialog(content: Container(child:
        SingleChildScrollView(child:Column(children: [
          Container(margin: EdgeInsets.all(10),child: Text(widget.item[co][1],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 20), textAlign: TextAlign.center), ),
          Container(margin: EdgeInsets.only(top:0), child:IconButton(icon:Icon(Icons.delete_forever,color: Colors.blueGrey[700],size: 20,), onPressed: () {delete ();  setState(() {});Navigator.pop(context);  },)),],)),),
        ),onWillPop: () async {setState(() {});return true;}),);}

  Future<void> delete () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch(widget.count){
      case 0: var aa =  prefs.getStringList("V5覚えた")??[];aa.remove(widget.item[co][0]);widget.item.removeAt(co);prefs.setStringList("V5覚えた", aa);break;
      case 1:var aa =  prefs.getStringList("V5まだ")??[];aa.remove(widget.item[co][0]);widget.item.removeAt(co);prefs.setStringList("V5まだ", aa);
      var bb =  prefs.getStringList("V5覚えた")??[];bb.add(widget.item[co][0]);if(prefs.getStringList("V5覚えた")?.contains(widget.item[co][0]) == false){prefs.setStringList("V5覚えた",bb );}break;
      case 2:var aa =  prefs.getStringList("V5保存")??[];aa.remove(widget.item[co][0]);widget.item.removeAt(co);prefs.setStringList("V5保存", aa);break;
      case 3:var aa =  prefs.getStringList("V5必要ない")??[];aa.remove(widget.item[co][0]);widget.item.removeAt(co);prefs.setStringList("V5必要ない", aa);break;
    }}
}


