import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:get_storage/get_storage.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
class alkahf extends StatefulWidget {


  @override
  State<alkahf> createState() => _State();
}

class _State extends State<alkahf> {
  bool _ziez_text_=false;
  late double ziez_text=6.5;
  final size_ = GetStorage();
  late double ziez_text_number=4.0;
  final size_nuber = GetStorage();
  final size_basm = GetStorage();
  late double ziez_text_basm=8;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(size_.read('size')==null){
      size_.write("size", ziez_text);
    }
    ziez_text=size_.read('size');

    if(size_nuber.read('size_number')==null){
      size_nuber.write("size_number", ziez_text_number);
    }
    ziez_text_number=size_nuber.read('size_number');

    if(size_basm.read('size_basm')==null){
      size_basm.write("size_basm", ziez_text_basm);
    }
    ziez_text_basm=size_basm.read('size_basm');
    print(size_basm.read('size_basm'));
  }
  void _ziez_text(){
    setState(() {
      _ziez_text_=true;
      if(ziez_text<15){
        ziez_text+=1;
        size_.write('size', ziez_text);
      }
    });
  }

  void _ziez_text_miens()  {
    setState(() {
      _ziez_text_=true;
      if(ziez_text>6.6){
        ziez_text-=1;
        size_.write('size',ziez_text);
      }


    });
  }

  void ziez_text_numbers_miens(){
    setState(() {
      _ziez_text_=true;
      if(ziez_text_number>4.0){
        ziez_text_number-=1;
        size_nuber.write('size_number',ziez_text_number);
      }
    });
  }
  void ziez_text_numbers_plas(){
    setState(() {
      _ziez_text_=true;
      if(ziez_text_number<8.0){
        ziez_text_number+=1;
        size_nuber.write('size_number',ziez_text_number);
      }
    });
  }
  //بسم الله
  void ziez_text_basm_plas(){
    setState(() {
      _ziez_text_=true;
      if(ziez_text_basm<10){
        ziez_text_basm+=1;
        size_basm.write('size_basm',ziez_text_basm);
      }
    });
  }
  void ziez_text_basm_mins(){
    setState(() {
      _ziez_text_=true;
      if(ziez_text_basm>8){
        ziez_text_basm-=1;
        size_basm.write('size_basm',ziez_text_basm);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Themes theme = Themes();
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(theme.getColor("backgrouund")),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(theme.getColor("backgrouund")),
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
                    child: Text("سورة الكهف",style: TextStyle(fontSize:size.getWidth()*7,color: Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(width: size.getWidth()*25,),
                  InkWell(
                    highlightColor:Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      _ziez_text_miens();
                      ziez_text_numbers_miens();
                      ziez_text_basm_mins();
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
                      ziez_text_numbers_plas();
                      ziez_text_basm_plas();
                    },
                    child:Center(
                      child: Text("ت",style: TextStyle(fontSize:size.getWidth()*7,color: Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
        body: SafeArea(
          minimum: EdgeInsets.only(left: size.getWidth()*5,right: size.getWidth()*5),
          child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.all(size.getWidth()*1),
                  child: header(),
                ),
                SizedBox(
                  height: size.getHeight()*1,
                ),
                RichText(

                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      for (var i = 1; i <= quran.getVerseCount(18); i++) ...{
                        TextSpan(
                          text: ' ' +
                              quran.getVerse(18, i, verseEndSymbol: false) +
                              ' ',
                          style: TextStyle(
                            fontFamily: 'Abd',
                            fontSize:_ziez_text_==true?size.getWidth()*ziez_text:size.getWidth()*size_.read('size'),
                            color:Color(theme.getColor("iconsColor")),
                          ),
                        ),

                        WidgetSpan(

                            alignment: PlaceholderAlignment.middle,
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Text(
                                '$i',
                                textAlign: TextAlign.center,
                                textScaleFactor: i.toString().length <= 2 ? 1 : .8,
                                style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400,fontSize:_ziez_text_==true?size.getWidth()*ziez_text_number:size.getWidth()*size_.read('size_number'),),
                              ),
                              radius:_ziez_text_==true?size.getWidth()*ziez_text_number:size.getWidth()*size_.read('size_number'),
                            )),
                      }
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
  Widget header() {
    Themes theme = Themes();
    var size = mediaQuery(context);
    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ' ' + quran.basmala + ' ',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color:Color(theme.getColor("iconsColor")),
                fontFamily: 'Abd',
                fontSize:_ziez_text_==true?size.getWidth()*ziez_text_basm:size.getWidth()*size_basm.read('size_basm'),
              ),
            ),
          ],
        ));
  }
}

