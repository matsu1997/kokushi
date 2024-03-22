import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Slider1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Slider1> {
  var _sliderValue = 0.0;
  var _labelText = 'Select value';
  var text = "";
  var text1 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text("テキストサイズをかえる", style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[],
      ),
      body: Center(
       // padding: EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(24),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  child: Text("A",
                      style: TextStyle(fontSize: _sliderValue)),
                ),
                Container(
                  height: 20,
                  child: Text(
                    _labelText,
                    // style: TextStyle(fontSize: 20)
                  ),
                ),
                Container(
                  height: 50,
                  child: Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    onChanged: (double value) {
                      setState(() {
                        _sliderValue = value.roundToDouble();
                        _labelText = 'TextSize  $_sliderValue';
                      });
                    },
                  ),
                ),
                Container(width: 100,
                  margin: EdgeInsets.all(50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                      onPressed: () {
                        _setCounterValue();
                      },
                      child: Text('保存', style: TextStyle(fontWeight: FontWeight.bold),),
                    )
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: Text("初期値:20.0", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                    margin: EdgeInsets.all(20),
                      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: Text(text1, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                ),
              ],
            ),
        ),
      ),
    );
  }
  void _setCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble("size", _sliderValue);
    setState(() {text = "保存しました！";text1 = "テキストサイズには限界があります";});
  }
}

class Slider2 extends StatefulWidget {
  Slider2(this.name);
  String name;
  @override
  State<StatefulWidget> createState() {
    return _Slider2State();
  }
}

class _Slider2State extends State<Slider2> {
  var _sliderValue = 0.0;
  var _labelText = 'Select value';
  var text = "";
  var text1 = "";
  var light = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('明るさを変えますか？'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(24),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.name),
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(light),
                      BlendMode.lighten,
                    ), ),),
              ),
              Container(
                height: 20,
                child: Text(
                  _labelText,
                  // style: TextStyle(fontSize: 20)
                ),
              ),
              Container(
                height: 50,
                child: Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 10,
                  divisions: 10 ,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value.roundToDouble();
                      _labelText = 'TextSize  $_sliderValue';
                      light = _sliderValue / 10;
                    });
                  },
                ),
              ),
              Container(
                  margin: EdgeInsets.all(40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () {
                      _setCounterValue();
                    },
                    child: Text('保存', style: TextStyle(fontWeight: FontWeight.bold),),
                  )
              ),
              Container(
                margin: EdgeInsets.all(0),
                child: Text("初期値:3.0", style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _setCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble("light", _sliderValue / 10);
    setState(() {text = "保存しました！";});
  }
}