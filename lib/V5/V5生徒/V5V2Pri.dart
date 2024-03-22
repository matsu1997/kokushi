
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../V4/Anki.dart';



class V5Pri extends StatefulWidget {
  V5Pri(this.schoolId,this.Id);
  String schoolId;String Id;
  @override
  State<V5Pri> createState() => _V5PriState();
}
class _V5PriState extends State<V5Pri> {
  var item = [];
  void initState() {
    super.initState();
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
            padding: EdgeInsets.all(4.0),
            crossAxisCount: 3,
            crossAxisSpacing: 10.0, // 縦
            mainAxisSpacing: 10.0, // 横
            childAspectRatio: 1, // 高さ
            shrinkWrap: true,
            children: List.generate(item.length, (index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => V5V2Pri(widget.schoolId, widget.Id,item[index]["ファイルId"],item[index]["ファイル名"])),);
                  },
                  child:Container(alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),
                      boxShadow: [new BoxShadow(color: Colors.grey,  offset: new Offset(1.0, 1.0), blurRadius: 3.0,)],
                    ),
                    child: Column(children: <Widget>[
                      Expanded(child: Container(margin:EdgeInsets.all(10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
                        child: FittedBox(child:  Image(image: AssetImage("images/education.png"),), fit: BoxFit.cover),)) ,
                      Container(margin: EdgeInsets.all(5.0), child: FittedBox(fit: BoxFit.fitWidth,
                          child:Text(item[index]["ファイル名"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                      ),),
                    ]
                    ),));})));
  }
  void _loadData()  {item = [];
  FirebaseFirestore.instance.collection('学校').doc(widget.schoolId).collection("プリント").doc(widget.Id).collection("ファイル").get().then((QuerySnapshot snapshot) {
    snapshot.docs.forEach((doc) {setState(() {item.add(doc);;});});});
  }
}

class V5V2Pri extends StatefulWidget {
  V5V2Pri(this.schoolId,this.Id,this.FId,this.name);
  String schoolId;String Id;String FId;String name;
  @override
  State<V5V2Pri> createState() => _V5V2PriState();
}

class _V5V2PriState extends State<V5V2Pri> {

  @override
  bool aka = true;
  var co = 0;
  var colorbid = 0.01;
  var color = Colors.red;
  var item = [];
  var item1 = [];
  String imgPathUse="";
  void initState() {
    super.initState();
    loadData();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: () {loadData();},
                icon: Icon(Icons.refresh_rounded))
          ],),
        body: GridView.count(
            padding: EdgeInsets.all(4.0),
            crossAxisCount: 2,
            crossAxisSpacing: 10.0, // 縦
            mainAxisSpacing: 10.0, // 横
            childAspectRatio: 0.7, // 高さ
            shrinkWrap: true,
            children: List.generate(item.length, (index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      offset: new Offset(5.0, 5.0),
                      blurRadius: 10.0,
                    )
                  ],
                ),
                child:Column(
                    children: <Widget>[
                      Expanded(
                        child:MaterialButton(
                          padding: EdgeInsets.all(3.0),
                          textColor: Colors.black,
                          elevation: 8.0,
                          child: Image.network(item[index][2]),
                          onPressed: () {Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Anki(item[index][0],item[index][2],item[index][1],"0","復習に追加")),
                          );},),),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        child: Text(item[index][0]
                        ),),]),);})));
  }
  void loadData()  {
    item = [];item1 = [];
    FirebaseFirestore.instance.collection('学校').doc(widget.schoolId).collection("プリント").doc(widget.Id).collection("ファイル").doc(widget.FId).collection("問題").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        item.add([doc["text"],doc["messageId"],doc["ImgId"]]);
        setState(() { });;});});}
  void getImgs(String imgPathRemote) async{
    if ((imgPathRemote != "") && (imgPathRemote != null)) {
      try {
        imgPathUse = await FirebaseStorage.instance.ref().
        child("images").child(imgPathRemote).getDownloadURL();
        item1.add(imgPathUse);
      } catch (FirebaseException) {}} else{}
    bb();
  }
  void aa (){for (var i = 0; i < item.length ; i++) {getImgs(item[i][1]);}}
  void bb (){for (var i = 0; i < item.length ; i++) {item[i].add(item1[i]);setState(() { });}}
}


