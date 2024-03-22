// import 'dart:math';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:kokushi/V4/AnkiRe.dart';
// import 'package:kokushi/V4/AnkiUse.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../V4/FriendV1.dart';
// import '../アカウント/SignUp.dart';
// import 'V2.dart';
// import '../V4/V4Add.dart';
// import '../V4/V4V2.dart';
//
// class V2First extends StatefulWidget {
//   @override
//   State<V2First> createState() => _V2FirstState();
// }
//
// class _V2FirstState extends State<V2First> {
//
//   @override
//   var item = ['衛生学', '解剖学', '生理学','病理','臨床医学総論','臨床医学各論','リハビリテーション医学',"関係法規","東洋医学概論","経絡経穴概論","あん摩マッサージ指圧理論","鍼灸理論","運動学柔整師","関係法規柔整師","外科柔整師","整形柔整師","柔整理論柔整師"];
//   void initState() {
//     super.initState();
//   }
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text("単語帳",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
//           iconTheme: IconThemeData(color: Colors.black),
//           centerTitle: true,elevation: 0,
//        ),
//         body: GridView.count(
//             padding: EdgeInsets.all(4.0),
//             crossAxisCount: 3,
//             crossAxisSpacing: 10.0, // 縦
//             mainAxisSpacing: 10.0, // 横
//             childAspectRatio: 1, // 高さ
//             shrinkWrap: true,
//             children: List.generate(item.length, (index) {
//               return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                           builder: (context) => V2(item[index])));
//                     },
//                   child:Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           new BoxShadow(
//                             color: Colors.grey,
//                               offset: new Offset(1.0, 1.0),
//                               blurRadius: 3.0,spreadRadius: 1
//                           )],),
//                       child: Column(children: <Widget>[
//                         Expanded(
//                             child: Container(
//                               margin:EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: FittedBox(
//                                   child:Icon(Icons.architecture,color:Colors.blue[900],),
//                                   fit: BoxFit.fill),
//                             )) ,
//                         Container(
//                           margin: EdgeInsets.only(left:3,right: 3,bottom: 20.0),
//                           child: FittedBox(
//                               fit: BoxFit.fitWidth,
//                               child:Text(item[index],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
//                           ),),
//                       ])));})));
//   }
//
// }


import 'dart:math';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kokushi/%E7%B5%8C%E7%A9%B4/Keiketu.dart';
import 'package:kokushi/%E7%AD%8B%E8%82%89/Kinniku.dart';
import 'package:kokushi/%E3%82%A2%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88/SignUp.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../V3/V3.dart';
import '../V3/V3V2.dart';
import '../アカウント/Acount.dart';
import '../アカウント/delete.dart';
import '../その他/mail.dart';
import 'V2.dart';


class V2First extends StatefulWidget {
  @override
  State<V2First> createState() => _V2FirstState();
}
enum Menu {Edit,request,message }
class _V2FirstState extends State<V2First> {
  @override
  var uid = "";
  var count = 0;
  String date = "";
  var item = [];
  // InterstitialAd? _interstitialAd;
  // AdInterstitial adInterstitial = new AdInterstitial();
  void initState() {
    super.initState();sign();}

  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar:AppBar(
            backgroundColor: Colors.white,elevation: 0,
            title:Text("単語帳",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blueGrey[900],fontSize: 15),),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            bottom: const TabBar(indicatorColor: Colors.orange,
              tabs: [
                Tab(child: Text("共通",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("鍼灸/マ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("柔整",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(backgroundColor: Colors.orange,child: Text("復習"), onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V3V2()));},),
          body: TabBarView(
            children: [
              V2First1(),
              V2First2(),
              V2First3()
            ],
          ),
        ),
      ),
    );
  }

  void sign() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("アカウント") ?? "";
    if (uid == "") {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));}else{}
  }

  Future<void> _requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
  void popupMenuSelected(Menu selectedMenu){
    switch(selectedMenu) {
      case Menu.Edit:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Acount()));
        break;
      case Menu.request: _requestReview();
      break;
      case Menu.message:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => mail("")));
        break;
      default:
        break;
    }}


}

class V2First1 extends StatefulWidget {
  @override
  State<V2First1> createState() => _V2First1State();
}
class _V2First1State extends State<V2First1> {
  @override
  var uid = "";
  var count = 0;
  String date = "";
  var item = [];
  // InterstitialAd? _interstitialAd;
  // AdInterstitial adInterstitial = new AdInterstitial();
  final List<String> _todoList = ["衛生学","解剖学","生理学","病理","臨床医学総論","臨床医学各論","リハビリテーション医学","筋肉暗記"];
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(margin: EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
                    itemCount: _todoList.length, itemBuilder: (context, index) {
                      return Card(elevation: 0,color:Colors.grey[100],child: ListTile(
                        title: Text(_todoList[index],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
                        onTap: (){if(_todoList[index] == "筋肉暗記"){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Kinniku()));}else {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => V2(_todoList[index])));}}   ),);},),),
        )
    );
  }

  EdgeInsets createPadding() {
    return EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0
    );
  }




}

class V2First2 extends StatefulWidget {
  @override
  State<V2First2> createState() => _V2First2State();
}
class _V2First2State extends State<V2First2> {
  @override
  var uid = "";
  var count = 0;
  String date = "";
  var item = [];
  // InterstitialAd? _interstitialAd;
  // AdInterstitial adInterstitial = new AdInterstitial();
  final List<String> _todoList =["関係法規","東洋医学概論","経絡経穴概論","あん摩マッサージ指圧理論","鍼灸理論","経穴暗記"];
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Container(margin: EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
                    itemCount: _todoList.length, itemBuilder: (context, index) {
                      return Card(elevation: 0,color:Colors.grey[100],child: ListTile(
                        title: Text(_todoList[index],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
                        onTap: (){if(_todoList[index] == "経穴暗記"){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Keiketu()));}else {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => V2(_todoList[index])));}
                          },
                      ),);},),),
                ])
        )
    );
  }

  EdgeInsets createPadding() {
    return EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0
    );
  }


}
class V2First3 extends StatefulWidget {
  @override
  State<V2First3> createState() => _V2First3State();
}
class _V2First3State extends State<V2First3> {
  @override
  var uid = "";
  var count = 0;
  String date = "";
  var item = [];
  // InterstitialAd? _interstitialAd;
  // AdInterstitial adInterstitial = new AdInterstitial();
  final List<String> _todoList =  ["運動学柔整師","関係法規柔整師","外科柔整師","整形柔整師","柔整理論柔整師"];
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Container(margin: EdgeInsets.all(10),child: ListView.builder(shrinkWrap: true, physics:  NeverScrollableScrollPhysics(),
                    itemCount: _todoList.length, itemBuilder: (context, index) {
                      return Card(elevation: 0,color:Colors.grey[100],child: ListTile(
                        title: Text(_todoList[index],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
                        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => V2(_todoList[index])));},
                      ),);},),),
                ])
        )
    );
  }

  EdgeInsets createPadding() {
    return EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0
    );
  }



}
