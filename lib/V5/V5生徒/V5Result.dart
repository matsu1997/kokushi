


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class V5Result extends StatefulWidget {
  V5Result(this.item);
  List item;
  @override
  State<V5Result> createState() => _V5ResultState();
}

class _V5ResultState extends State<V5Result> {
  var uid = "";
  var user = "";
  var co = 0;
  get onEng => null;

  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: widget.item.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Container(child: widget.item[index]["タイプ"] == "4択" ?
                      ListTile(
                        title: Text("[問題]" + widget.item[index]["text"]),
                        subtitle: Text("[1] ${widget.item[index]["f1"]}\n[2] ${widget.item[index]["f2"]}\n[3] ${widget.item[index]["f3"]}\n[4] ${widget.item[index]["f4"]}"),
                        onTap: () {showDialog(context: context, builder: (context) =>
                                  AlertDialog(
                                    title: Text("答え:" + widget.item[index]["f5"] + "番\n"+ widget.item[index]["f" + widget.item[index]["f5"]]+"\n[解説]" + widget.item[index]["kaisetu"] ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),));},):
                      ListTile(title: Text(widget.item[index]["Qtext"]),
                        onTap: () {showDialog(context: context, builder: (context) =>
                                  AlertDialog(title: Text(widget.item[index]["Atext"]+"\n[解説]" + widget.item[index]["kaisetu"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),));
                        } ),
                      ));},),),
            Container(margin: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              child: ElevatedButton(
                onPressed: () {int count = 0;Navigator.popUntil(context, (_) => count++ >= 2);},
                child: Text('閉じる', style: TextStyle(fontWeight: FontWeight.bold),),),)
          ],),),);}


}

