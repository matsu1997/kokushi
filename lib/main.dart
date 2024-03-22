
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:kokushi/%E7%B7%A8%E9%9B%86/90900.dart';
import 'package:kokushi/V7/V7.dart';
import 'package:kokushi/test.dart';
import 'V1/V1.dart';
import 'V2/V2Firest.dart';
import 'V3/V3.dart';
import 'V4/V4.dart';
import 'V5/V5生徒/V5.dart';
import 'V6/V6.dart';
import 'V8/V8.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //ここ！
 await Firebase.initializeApp(); //ここ！
  runApp(MyApp());
  //initializeDateFormatting().then((_) =>runApp(MyApp()));

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'BottomNav',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: MyHomePage(),
    );
  }
}
// @override



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // ページインデックス保存用
  int _screen = 0;

  // 表示する Widget の一覧
  static List<Widget> _pageList = [
    V1(),
    V2First(),V7(),
    V8(),
    // App(),
    // MyApp1()
    //TangoQA1()
  ];

  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.border_color),
        label: '問題集',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bookmark_border),
        label: '単語帳',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.store_mall_directory_outlined),
        label: '写真',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.store_mall_directory_outlined),
        label: '企業情報',
      ),

      // BottomNavigationBarItem(
      //   icon: Icon(Icons.store_mall_directory_outlined),
      //   label: '写真',
      // ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[900],
      //   title: Text(
      //     '国試plus',
      //     style: TextStyle(fontSize: 16),
      //   ),
      // ),
      // ページビュー
      body: _pageList[_screen],
      // ページ下部のナビゲーションメニュー
      bottomNavigationBar: BottomNavigationBar(
        // 現在のページインデックス
        currentIndex: _screen,
        type: BottomNavigationBarType.fixed,
        // onTapでナビゲーションメニューがタップされた時の処理を定義
        onTap: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;
          });
        },
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
      ),

    );

  }
}
