import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../Constants/azkar_text.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get_storage/get_storage.dart';
class azkar_2 extends StatefulWidget {
  late String name;
  late int index_text;
  azkar_2(this.name,this.index_text);

  @override
  State<azkar_2> createState() => _azkar_State(name,index_text);
}
// Text(azkar.azkar_index_text(index,2)),
class _azkar_State extends State<azkar_2> {
  late String name;
  late int index_text;
  _azkar_State(this.name,this.index_text);
  late bool play=true;
  ScrollController _scrollController = ScrollController();
  late Timer _timer;
  var newsList=azkar_text();
  double _itemExtent = 280;
  Duration _scrollDuration = Duration(milliseconds: 500);
  Curve _scrollCurve = Curves.easeInOut;

  int _autoScrollIncrement = 1;
  int _currentScrollIndex = 0;



  void play_(){
    play==true?_timer = Timer.periodic(Duration(seconds: 2), (_) async {
      _autoScrollIncrement = _currentScrollIndex == 0
          ? 1
          : _currentScrollIndex == newsList.azkar_length(2) - 1
          ? -1
          : _autoScrollIncrement;
      _currentScrollIndex += _autoScrollIncrement;
      _animateToIndex(_currentScrollIndex);
      setState(() {});
    }):null;

  }
  void _animateToIndex(int index) {
    _scrollController.animateTo(
      index * _itemExtent,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }




  bool _ziez_text_=false;
  final size_ = GetStorage();
  late double ziez_text=6.5;
  int number=10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ziez_text=size_.read('size');


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
        size_.write('size', ziez_text);

      }


    });
  }
  List<int> selectedIndexList =[];

  int aaa=10;

  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    var azkar=azkar_text();
    azkar.azkar_texts(index_text);
    //  print(index_text);

    Themes theme = Themes();
    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          //     highlightColor: Colors.transparent,
          //     splashColor: Colors.transparent,
          icon: Icon(Icons.arrow_back, size: 30,color: Color(theme.getColor("iconsColor")),),
          onPressed: () {
            Navigator.pop(context);
          },),
        title: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisSize:MainAxisSize.max,

              children: [
                Center(
                  child: Text(name,style: TextStyle(fontSize:size.getWidth()*7,color: Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold),),
                ),
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
              ],
            ),

          ],
        ),
        elevation: 0,
        backgroundColor: Color(theme.getColor("backgrouund")),

      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          itemCount: azkar.azkar_length(index_text),
          itemBuilder: (_,index){
            return Column(
              children: [

                Container(
                  // color: Colors.orange,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {




                            if (!selectedIndexList.contains(index)) {
                              selectedIndexList.add(index);

                            }

                          });
                        },
                        child: Container(
                          width: size.getWidth()*100,
                          margin: EdgeInsets.only(top:size.getHeight()*2,left: size.getWidth()*3,right:  size.getWidth()*3,bottom: size.getHeight()*3),
                          decoration: BoxDecoration(
                            color:  selectedIndexList.contains(index)==false?Color(theme.getColor("backgrouund")):Colors.grey.shade500.withOpacity(1),
                            borderRadius: BorderRadius.all(Radius.circular(size.getWidth()*2),),
                            border: Border.all(
                              width: 1,
                              color: Color(theme.getColor("iconsColor")),
                            ),
                          ),

                          child:Container(
                            margin: EdgeInsets.only(left: size.getWidth()*3,right:size.getWidth()*3,bottom:size.getHeight()*2),
                            child:Container(
                              margin: EdgeInsets.only(left: size.getWidth()*3,right:size.getWidth()*3,bottom:size.getHeight()*2.5,top: size.getHeight()*2.5),
                              child: Text(azkar.azkar_index_text(index,0,index_text),style: TextStyle(fontSize:_ziez_text_==true?size.getWidth()*ziez_text:size.getWidth()*size_.read('size'),color: Color(theme.getColor("iconsColor")),),textAlign: TextAlign.center,),
                            ),
                          ),

                        ),
                      ),

                      Container(
                        height: size.getHeight()*7,
                        margin:EdgeInsets.only(left:size.getWidth()*10,right:size.getWidth()*10,),
                        decoration: BoxDecoration(
                          color:selectedIndexList.contains(index)==false?Color(theme.getColor("backgrouund")):Colors.grey.shade500.withOpacity(1),
                          borderRadius: BorderRadius.all(Radius.circular(size.getWidth()*2),),
                          border: Border.all(
                            width: 1,
                            color: Color(theme.getColor("iconsColor")),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){
                              ///  share(azkar.azkar_index_text(index,0,index_text2));
                              },
                              child: Container(
                                width:  size.getWidth()*9,
                                height: size.getHeight()*9,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1,
                                    color: Color(theme.getColor("iconsColor")),
                                  ),
                                ),
                                margin: EdgeInsets.only(right:size.getWidth()*3),
                                child:Center(
                                  child:Icon(Icons.share,color: Color(theme.getColor("iconsColor")),size: size.getWidth()*6,),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right:size.getWidth()*0.5),
                              child:Text("مشاركة",style: TextStyle( color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*5,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: size.getWidth()*15,
                              height: size.getHeight()*4,
                              child:VerticalDivider(
                                color:Color(theme.getColor("iconsColor")),
                                thickness:2,
                              ),
                            ),
                            Container(
                              width:  size.getWidth()*9,
                              height: size.getHeight()*9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: Color(theme.getColor("iconsColor")),
                                ),
                              ),
                              margin: EdgeInsets.only(right:size.getWidth()*3),
                              child:sss(number),
                            ),
                            Container(
                              margin: EdgeInsets.only(right:size.getWidth()*7),
                              child:Text("التكرار",style: TextStyle( color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*5,fontWeight: FontWeight.bold),),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                SizedBox(height: size.getHeight()*2,),

              ],
            );
          }),
    );
  }
  Widget sss(s){
    var size = mediaQuery(context);
    Themes theme = Themes();
    // print(number);
    return InkWell(
      onTap: (){
        setState(() {

          if(s>1){
            s--;
          }
          print(s);
        });
      },
      child:Center(
        child:Text(number.toString(),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*4,fontWeight: FontWeight.bold),),
      ),
    );
  }

}


class zzzzz extends StatefulWidget {
  late int number;
  zzzzz(this.number);

  @override
  State<zzzzz> createState() => _zzzzzState(number);
}

class _zzzzzState extends State<zzzzz> {
  late int number;
  _zzzzzState(this.number);
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Themes theme = Themes();
   // print(number);
    return InkWell(
      onTap: (){
        setState(() {

          if(number>1){
            number--;
          }
          print(number);
        });
      },
      child:Center(
        child:Text(number.toString(),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*4,fontWeight: FontWeight.bold),),
      ),
    );
  }
}







