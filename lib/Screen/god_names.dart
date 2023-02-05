import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism/glassmorphism.dart';
class god_names extends StatefulWidget {

  @override
  State<god_names> createState() => _god_namesState();
}

class _god_namesState extends State<god_names> {

  List list = [
     "الله",
    "الرّحمن",
    "الرّحيم",
    "الملك",
    "القدّوس",
    "السّلام",
    "المؤمن",
    "المهيمن",
    "العزيز",
    "الجبّار",
    "المتكبّر",
    "الخالق",
    "البارئ",
    "المصوّر",
    "الغفّار",
    "القهّار",
    "الوهّاب",
    "الرّزّاق",
    "الفتّاح",
    "العليم",
    "القابض",
    "الباسط",
    "الخافض",
    "الرّافع",
    "المعزّ",
    "المذلّ",
    "السّميع",
    "البصير",
    "الحكم",
    "العدل",
    "اللّطيف",
    "الخبير",
    "الحليم",
    "العظيم",
    "الغفور",
    "الشّكور",
    "العليّ",
    "الكبير",
    "الحفيظ",
    "المقيت",
    "الحسيب",
    "الجليل",
    "الكريم",
    "الرّقيب",
    "المجيب",
    "الواسع",
    "الحكيم",
    "الودود",
    "المجيد",
    "الباعث",
    "الشّهيد",
    "الحقّ",
    "الوكيل",
    "القويّ",
    "المتين",
    "الوليّ",
    "الحميد",
    "المحصي",
    "المبدئ",
    "المعيد",
   "المحيي",
    "المميت",
        "الحيّ",
        "القيومّ",
        "الواجد",
        "الماجد",
        "الواحد",
        "الصّمد",
        "القادر",
        "المقتدر",
        "المقدّم",
        "المؤخرّ",
        "الأوّل",
        "الآخر",
        "الظّاهر",
        "الباطن",
        "الوالي",
        "المتعالي",
        "البَرّ",
        "التّواب",
        "المنتقم",
        "العفوّ",
        "الرّؤوف",
        "مالك",
        "الملك",
        "ذو الجلال والإكرام",
        "المقسط",
        "الجامع",
        "الغنيّ",
        "المغني",
        "المانع",
        "الضّار",
        "النّافع",
        "النّور",
        "الهادي",
        "البديع",
        "الباقي",
        "الوارث",
        "الرّشيد",
         "الصّبور",


  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(list.length);

  }
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Themes theme = Themes();
    final theme2 = GetStorage();

    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      appBar: AppBar(
        leading: IconButton(
          splashRadius: size.getWidth()*5,
          //     highlightColor: Colors.transparent,
          //     splashColor: Colors.transparent,
          icon: Icon(Icons.arrow_back, size: size.getWidth()*8,color: Color(theme.getColor("iconsColor")),),
          onPressed: () {
            Navigator.pop(context);
          },),
        title: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,

              children: [

                Center(
                  child: Text("اسماء الله الحسنى",style: TextStyle(fontSize:size.getWidth()*7,color: Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold),),
                ),
                /*
                SizedBox(width: size.getWidth()*28,),
                InkWell(
                  highlightColor:Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: (){
                    _ziez_text_miens();
                  },
                  child: Center(
                    child: Text("ت",style: TextStyle(fontSize:size.getWidth()*5,color: Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(width: size.getWidth()*5,),
                InkWell(
                  highlightColor:Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: (){
                    _ziez_text();
                  },
                  child:Center(
                    child: Text("ت",style: TextStyle(fontSize:size.getWidth()*7,color: Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold),),
                  ),
                ),

                 */
              ],
            ),

          ],
        ),
        elevation: 0,
        backgroundColor: Color(theme.getColor("backgrouund")),

      ),
      body: GridView.builder(
          physics:BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing:4,crossAxisSpacing:5,
          ),
          itemCount:  list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size.getWidth()*2),
              ),
              color:theme2.read('Theme')==1?Color(theme.getColor("contentColor")):Color.fromRGBO(118, 214, 104, 1),
              child: Center(
                child: Text(
                  list[index],
                  style: TextStyle(fontFamily: "Abd", fontSize:size.getWidth()*6,color: Color(theme.getColor("iconsColor"))),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
      ),
    );
  }

}
