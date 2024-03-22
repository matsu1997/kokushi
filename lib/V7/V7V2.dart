import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kokushi/V1/V1V2.dart';
import 'package:kokushi/V1/QA.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../アカウント/SignUp.dart';
import 'V7Print.dart';

class V7V2 extends StatefulWidget {

  V7V2(this.name);
  String name;

  @override
  State<V7V2> createState() => _V7V2State();
}

class _V7V2State extends State<V7V2> {
  @override
  List<String> _todoList = [];
  var item = [];
  @override
  void initState() {
    super.initState();
    set();
  }
  Widget build(BuildContext context) {

    switch (widget.name) {
      case "衛生学":
        _todoList = ["衛生学の意義","健康(予防や検査など)","環境問題","職業病と精神障害","母子保健","成人病","感染症1(衛生学)","感染症2(衛生学)","消毒のやり方","疫学研究","保健統計"];
        break;
      case "解剖学":
        _todoList = ["細胞と組織と骨1","細胞と組織と骨2","細胞と組織と骨3","細胞と組織と骨4","循環器1","循環器2","循環器3","循環器4","循環器5","循環器6","循環器7","循環器8","循環器9","呼吸器1","呼吸器2","消化器1","消化器2","消化器3","消化器4","泌尿器1","泌尿器2","生殖器1","生殖器2","内分泌器1","内分泌器2","神経系1","神経系2","神経系3","神経系4","神経系5","感覚器1","感覚器2","骨格1","骨格2","骨格3","関節1","関節2","筋肉1","筋肉2","筋肉3","筋肉4","筋肉5","筋肉6","筋肉7","構成1","構成2","構成3"];
        break;
      case "生理学":
        _todoList = ["生理学基礎問題1","生理学基礎問題2","循環1","循環2","循環3","循環4","循環5","呼吸1","呼吸2","消化1","消化2","代謝1","体温1","排泄1","排泄2","内分泌1","内分泌2","内分泌3","生殖1","神経1","神経2","神経3","神経4","神経5","神経6","筋1","筋2","運動1","運動2","感覚1","感覚2","防御1","協調性"];
        break;
      case "病理":
        _todoList = ["疾病","病因1","病因2","病因3","循環障害1","循環障害2","退行性1","退行性2","進行性1","炎症1","炎症2","腫瘍1","腫瘍2","免疫異常1","先天性異常"];
        break;
      case "臨床医学総論(一般臨床)":
        _todoList = ["診察のやり方1","バイタルサイン1","バイタルサイン2","バイタルサイン3","診察1","診察2","局所診察1","局所診察2","局所診察3","生理反射1","生理反射2","運動検査1","運動検査2","救急措置","検査1","検査2","症状1","症状2","症状3","症状4","症状5","症状6","その他(臨床医学総論)"];
        break;
      case "臨床医学各論(一般臨床)":
        _todoList = ["感染症1","感染症2","消化器の病気1","消化器の病気2","肝臓・胆嚢。膵臓の病気1","肝臓・胆嚢。膵臓の病気2","呼吸の病気1","呼吸の病気2","呼吸の病気3","腎臓の病気1","内分泌の病気１","内分泌の病気２","代謝の病気1","代謝の病気2","整形外科1","整形外科2","整形外科3","整形(筋肉,形態)1","整形(脊椎)1","整形(脊椎)2","整形(外傷)1","整形(外傷)2","循環の病気1","循環の病気2","循環の病気3","血液の病気1","血液の病気2","神経の病気1","神経の病気2","神経の病気3","神経の病気4","神経の病気5","リウマチ1","リウマチ2","その他の病気1","その他の病気2","その他の病気3","その他の病気4","その他の病気5","その他(臨床医学各論)"];
        break;
      case "リハビリテーション医学":
        _todoList = ["リハビリ基礎1","リハビリ基礎2","リハビリ基礎3","リハビリ基礎4","リハビリ基礎5","医学的リハビリ1","医学的リハビリ2","医学的リハビリ3","医学的リハビリ4","脳卒中1","脳卒中2","脳卒中3","脊髄損傷リハ1","脊髄損傷リハ2","切断後1","脳性麻痺1","骨と関節1","骨と関節2","骨と関節3","関節リウマチ1","末梢神経","パーキンソン","呼吸器のリハ","運動学","身体機能1","身体機能2","リハビリ(柔整師)1","リハビリ(柔整師)2","リハビリ(柔整師)3","リハビリ(柔整師)4","リハビリ(柔整師)5","リハビリ(柔整師)6"];
        break;
      case "医療概論":
        _todoList = ["医療の意義","現代の医学と健康","医療従事者の数","医療施設の定義","国民医療費について","医療保険(鍼灸の適応を含む)","介護保険制度","医療の倫理"];
        break;
      case "関係法規":
        _todoList = ["日数・届出問題","免許","罰金と業務と施術所1","罰金と業務と施術所2","関係法規"];
        break;
      case "東洋医学概論":
        _todoList = ["東洋医学の基礎","気血津液1","気血津液2","気血津液3","生理作用1","生理作用2","生理作用3","生理作用4","経絡と病因病機1","経絡と病因病機2","陰陽","五行1","五行2","五行3","四診1","四診2","四診3","四診4","弁証論治とその他"];
        break;
      case "東洋医学臨床論(症状別)":
        _todoList = ["東洋医学臨床論の基礎","頭の症状1","顔面の症状1","顔面の症状2","顔面の症状3","顔面-上半身の症状","上半身の症状1","上半身の症状2","上半身の症状3","上肢の症状1","上肢の症状2","上肢の症状3","腰下肢の症状1","腰下肢の症状2","腰下肢の症状3","その他の症状1","その他の症状2"];
        break;
      case "東洋医学臨床論(質問別)":
        _todoList = ["八綱病証","治療方針","難経六十九難","刺法と配穴1","刺法と配穴2","適応疾患・症状","灸の治療"];
        break;
      case "経絡経穴概論":
        _todoList = ["経絡の基礎1","経絡の基礎2","経絡の基礎3","始まり・終わり","接続と奇経","骨度法・同身寸法1","骨度法・同身寸法2","五要穴1","五要穴2","五要穴3","五兪穴・五行穴1","五兪穴・五行穴2","五兪穴・五行穴3","四総穴八会穴1","四総穴八会穴2","八脈交会穴 交会穴、下合穴","所属経脈1","所属経脈2","胸腹部の経穴1","背腰殿部の経穴1","背腰殿部の経穴2","手関節の経穴","解剖 〔筋・腱〕の経穴1","解剖 〔神経・神経溝・デルマトーム〕の経穴1","解剖 〔動脈・拍動部〕の経穴1","解剖 〔動脈・拍動部〕の経穴2","その他取穴1","その他取穴2","奇穴","組み合わせ穴","経絡・経穴の現代的研究"];
        break;
      case "あん摩マッサージ指圧理論":
        _todoList = ["あマ指の意義1","あマ指の意義2","あマ指の意義3","あマ指の意義4","あマ指の意義5","生体への作用1","生体への作用2","生体への作用3","生体への作用4","生体への作用(運動法)","治療効果","古法あん摩","あマ指の応用","あマ指の注意点"];
        break;
      case "鍼灸理論":
        _todoList = ["鍼の基礎知識","刺鍼の方法1","刺鍼の方法2","刺鍼の方法3","特殊鍼法","灸の基礎1","灸の基礎2","灸の種類1","灸の種類2","灸の種類3","鍼灸の応用1","鍼灸の応用2","施術の注意1","施術の注意2","施術の注意3","施術の注意4","鍼灸治効1","鍼灸治効2","鍼灸治効3","鍼灸治効4","鍼灸治効の基礎(きゅう)1","鍼灸治効の基礎(きゅう)2","鍼灸治効の基礎(きゅう)3","鍼灸治効の基礎(きゅう)4","鍼灸治効の基礎(はり)1","鍼灸治効の基礎(はり)2","鍼灸治効の基礎(はり)3","鍼灸療法の作用1","鍼灸療法の作用2","鍼灸療法の作用3","鍼灸療法の作用4","関連学説(はり)","関連学説(きゅう)"];
        break;
      case "運動学(柔整師)":
        _todoList = ["運動学(柔整師)1","運動学(柔整師)2","運動学(柔整師)3","運動学(柔整師)4","運動学(柔整師)5","運動学(柔整師)6","運動学(柔整師)7","運動学(柔整師)8"];
        break;
      case "関係法規(柔整師)":
        _todoList = ["関係法規(柔整師)1","関係法規(柔整師)2","関係法規(柔整師)3","関係法規(柔整師)4","関係法規(柔整師)5"];
        break;
      case "外科(柔整師)":
        _todoList = ["外科(柔整師)1","外科(柔整師)2","外科(柔整師)3","外科(柔整師)4","外科(柔整師)5"];
        break;
      case "整形(柔整師)":
        _todoList = ["整形(柔整師)1","整形(柔整師)2","整形(柔整師)3","整形(柔整師)4","整形(柔整師)5","整形(柔整師)6","整形(柔整師)7"];
        break;
      case "柔整理論(柔整師)":
        _todoList = ["柔整理論(柔整師)1","柔整理論(柔整師)2","柔整理論(柔整師)3","柔整理論(柔整師)4","柔整理論(柔整師)5","柔整理論(柔整師)6","柔整理論(柔整師)7","柔整理論(柔整師)8","柔整理論(柔整師)9"];
        break;


    }

    return Scaffold( backgroundColor: Colors.white,
      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
        iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
        actions: <Widget>[],
      ),
      body: Container(margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index,) {
            return GestureDetector(
              onTap: ()  { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V7Print("","","","","")),).then((value) {set();});},
              child:Card(elevation: 0,color:Colors.grey[100],
                  child:Container(margin: EdgeInsets.all(10),child: Row(children: [
                    Expanded(child:Container(margin:EdgeInsets.only(top:5,bottom: 5,left: 20),child: Text(_todoList[index],style: TextStyle(color: Colors.blueGrey[900],fontWeight: FontWeight.bold,fontSize: 15)))),
                    Container(child:item[index] == "全問正解" ?
                    Container(alignment:Alignment.centerRight,child: Icon(Icons.star,color: Colors.blueGrey[900],),):
                    Container(child: item[index] == "" ? Container():
                    Container(alignment:Alignment.centerRight,child: Icon(Icons.star_half,color: Colors.blueGrey[900],),))
                    )
                  ],),)),);},),),

    );

  }
  EdgeInsets createPadding(){return EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0);}
  Future<void> set () async {item = [];SharedPreferences prefs = await SharedPreferences.getInstance();
  for(int i = 0; i< _todoList.length; i++)
    setState(() { item.add(prefs.getString(_todoList[i])?? "" );});
  }
}