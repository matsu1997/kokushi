import 'dart:math';

//import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../main.dart';

class V8ShopLogin extends StatefulWidget {
  @override
  _V8ShopLoginState createState() => _V8ShopLoginState();
}

class _V8ShopLoginState extends State<V8ShopLogin> {
  String text = '';
  var password = '';
  var ID = "";

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
        iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
        leading: IconButton(onPressed: () { Navigator.pop(context);Navigator.pop(context); },
        icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(margin: EdgeInsets.only(top: 100, bottom: 30,), child: Text("店舗Login", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40)),),
              Container(width: double.infinity, margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: TextFormField(decoration: InputDecoration(labelText: 'ID',
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey, width: 3),)),
                  onChanged: (String value) {setState(() {ID = value;});},),),
              Container(width: double.infinity, margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: TextFormField(decoration: InputDecoration(labelText: 'Password',
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey, width: 3),)),
                  onChanged: (String value) {setState(() {password = value;});},),),
              Container(padding: EdgeInsets.all(8), child: Text(text,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.center,)),
              Container(margin: EdgeInsets.only(top: 20,bottom: 30),width: 100,
                child: ElevatedButton(child:Text('Login'), style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.orange, shape: const StadiumBorder(),),
                  onPressed: () {login();},),),
            ],),),),);
  }
  void login () async {
    FirebaseFirestore.instance.collection('店舗').where("ID", isEqualTo:ID ).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) async {
        if (password == doc["pass"]){
          SharedPreferences prefs = await SharedPreferences.getInstance();prefs.setString("店舗ID", ID);
          Navigator.pop(context); Navigator.pop(context);
        }else{}});});
    setState(() {text = "IDかPasswordが違います";});}
}