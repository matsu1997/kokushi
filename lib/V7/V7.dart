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
import '../アカウント/Acount.dart';
import '../アカウント/delete.dart';
import '../その他/mail.dart';
import 'V7V2.dart';
class V7 extends StatefulWidget {
  @override
  State<V7> createState() => _V7State();
}
enum Menu {Edit,request,message }
class _V7State extends State<V7> {
  @override
  var uid = "";
  var count = 0;
  String date = "";
  var item = [];
  // InterstitialAd? _interstitialAd;
  // AdInterstitial adInterstitial = new AdInterstitial();
  final List<String> _todoList = ['衛生学', '解剖学', '生理学','病理','臨床医学総論(一般臨床)','臨床医学各論(一般臨床)','リハビリテーション医学',"医療概論","関係法規","東洋医学概論","東洋医学臨床論(症状別)","東洋医学臨床論(質問別)","経絡経穴概論","あん摩マッサージ指圧理論","鍼灸理論","運動学(柔整師)","関係法規(柔整師)","外科(柔整師)","整形(柔整師)","柔整理論(柔整師)"];
  void initState() {
    super.initState();sign();}

  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar:AppBar(
            backgroundColor: Colors.white,elevation: 0,
            title:Text("プリント",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            //  actions: [IconButton(onPressed: () => {}, icon: Column(children: [Icon(Icons.access_alarm, color: Colors.green,), Text('復習', style: TextStyle(color: Colors.green,fontSize: 10),),],)),],
            bottom: const TabBar(indicatorColor: Colors.pink,
              tabs: [
                Tab(child: Text("共通",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("鍼灸/マ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("柔整",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(backgroundColor: Colors.pink,child: Text("復習"), onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V3()));},),
          body: TabBarView(
            children: [
              V71(),
              V72(),
              V73()
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

class V71 extends StatefulWidget {
  @override
  State<V71> createState() => _V71State();
}
class _V71State extends State<V71> {
  @override
  var uid = "";
  var count = 0;
  String date = "";
  var item = [];
  // InterstitialAd? _interstitialAd;
  // AdInterstitial adInterstitial = new AdInterstitial();
  final List<String> _todoList = ["衛生学","解剖学","生理学","病理","臨床医学総論(一般臨床)","臨床医学各論(一般臨床)","リハビリテーション医学"];
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
                      return Card(elevation: 0,color:Colors.grey[100],child:
                      ListTile(
                          title: Text(_todoList[index],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15), textAlign: TextAlign.center),
                          onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => V7V2(_todoList[index])));} ),

                      );},),),
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

class V72 extends StatefulWidget {
  @override
  State<V72> createState() => _V72State();
}
class _V72State extends State<V72> {
  @override
  var uid = "";
  var count = 0;
  String date = "";
  var item = [];
  // InterstitialAd? _interstitialAd;
  // AdInterstitial adInterstitial = new AdInterstitial();
  final List<String> _todoList =["医療概論","関係法規","東洋医学概論","東洋医学臨床論(症状別)","東洋医学臨床論(質問別)","経絡経穴概論","あん摩マッサージ指圧理論","鍼灸理論"];
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
                          onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => V7V2(_todoList[index])));} ),);},),),

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
class V73 extends StatefulWidget {
  @override
  State<V73> createState() => _V73State();
}
class _V73State extends State<V73> {
  @override
  var uid = "";
  var count = 0;
  String date = "";
  var item = [];
  // InterstitialAd? _interstitialAd;
  // AdInterstitial adInterstitial = new AdInterstitial();
  final List<String> _todoList =  ["運動学(柔整師)","関係法規(柔整師)","外科(柔整師)","整形(柔整師)","柔整理論(柔整師)"];
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
                          onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => V7V2(_todoList[index])));} ),);},),),
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
















