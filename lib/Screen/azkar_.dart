import 'dart:async';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../Constants/azkar_text.dart';
import '../Constants/oudio_plays_voice.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get_storage/get_storage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:siri_wave/siri_wave.dart';

class azkar_ extends StatefulWidget {
 late String name;
 late int index_text;
 azkar_(this.name,this.index_text);

  @override
  State<azkar_> createState() => _azkar_State(name,index_text);
}
// Text(azkar.azkar_index_text(index,2)),
class _azkar_State extends State<azkar_> {
  late String name;
  late int index_text;
  _azkar_State(this.name,this.index_text);
  late bool play=true;
  ScrollController _scrollController = ScrollController();
  var newsList=azkar_text();

  bool _ziez_text_=false;
  final size_ = GetStorage();
  late double ziez_text=6.5;
  List list=[];
  //move list


  //  //move list

  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
 // String audioasset = "oudio_plays/9999999.mp3";
  List audioasset=["oudio_plays/sleep.mp3",];
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  final _controller = SiriWaveController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    if(size_.read('size')==null){
      size_.write("size", ziez_text);

    }

    ziez_text = size_.read('size');

    Themes theme = Themes();
    _controller.setColor(Color(theme.getColor("iconsColor")),);
    _controller.setAmplitude(1.0);
    _controller.setSpeed(0.05);
    _controller.setFrequency(2.0.toInt());
    print(index_text);
  }

  Future<void> zzz()async{
    var oudio_plays=oudio_plays_voice();

      oudio_plays.azkar_texts(index_text);
     Future.delayed(Duration.zero, () async {

       ByteData bytes = await rootBundle.load(oudio_plays.oudio_plays_voice_sleep_index(index_text,0));
       audiobytes =
           bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
       player.onPlayerCompletion.listen((PlayerCompletion) {
         setState(()async{

           int result = await player.stop();
           if(result == 1) { //stop success
             setState(() {
               isplaying = false;
               audioplayed = false;
               currentpos = 0;
               stop=false;


             });
           }

         });
       });
     });

   }

  AudioPlayer player = AudioPlayer();
  bool stop= false;
  void plays()async{

    stop=true;

    if(!isplaying && !audioplayed){
      int result = await player.playBytes(audiobytes);
      if(result == 1){ //play success
        setState(() {
          isplaying = true;
          audioplayed = true;
        });
      }else{
        print("Error while playing audio.");
      }
    }else if(audioplayed && !isplaying){
      int result = await player.resume();
      if(result == 1){ //resume success
        setState(() {
          isplaying = true;
          audioplayed = true;
        });
      }else{
        print("Error on resume audio.");
      }
    }else{
      int result = await player.pause();
      if(result == 1){ //pause success
        setState(() {
          isplaying = false;
        });
      }else{
        print("Error on pause audio.");
      }
    }
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
  Future<void> share(String name) async {
    await FlutterShare.share(
        title: 'الاذكار',
        text: name,
        linkUrl: '',
        chooserTitle: 'share');
  }
  List<int> selectedIndexList =[];
  List selectedIndex =[];
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
          splashRadius: size.getWidth()*5,
          //     highlightColor: Colors.transparent,
          //     splashColor: Colors.transparent,
          icon: Icon(Icons.arrow_back, size: size.getWidth()*8,color: Color(theme.getColor("iconsColor")),),
          onPressed: ()async{
          Navigator.pop(context);
          int result = await player.stop();
          if(result == 1){ //stop success
            setState(() {
              isplaying = false;
              audioplayed = false;
              currentpos = 0;
            });
          }else{
            print("Error on stop audio.");
          }
        },),
       title: Stack(
         alignment: Alignment.center,
         children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [

               Center(
                 child: Text(name,style: TextStyle(color: Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold),),
               ),
               SizedBox(width:index_text>3?size.getWidth()*18:size.getWidth()*16.5,),
               Visibility(
                 visible:index_text>3?false:true,
                 child: InkWell(
                   highlightColor:Colors.transparent,
                   splashColor: Colors.transparent,
                   onTap: (){
                     setState((){

                       zzz();
                       plays();

                     });


                    if(isplaying){

                      _controller.setSpeed(0.0);

                    }else{
                      _controller.setSpeed(0.05);

                    }

                   },
                   child:Center(
                     child: Icon(isplaying?Icons.pause:Icons.play_arrow,color: Color(theme.getColor("iconsColor"))),
                   ),
                 ),
               ),
               SizedBox(width: size.getWidth()*5,),
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
      body: Stack(
        children: [

          ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              itemCount: azkar.azkar_length(index_text),
              itemBuilder: (_,index){

                //list[index]=azkar.azkar_index_numbers(index_text,index);
                list.add(azkar.azkar_index_numbers(index_text,index));
                return Column(
                  children: [

                    //   list(azkar.azkar_index_numbers(index_text,index),index,index_text),

                    Container(
                      // color: Colors.orange,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [

                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: (){
                              setState(() {
                                //   print(index);
                                ///  azkar.azkar_morning.removeAt(index);
                                if(1<list[index]){
                                  list[index]--;
                                  // plays();
                                }else{
                                  if (!selectedIndexList.contains(index)) {
                                    selectedIndexList.add(index);
                                    //  plays();
                                    //    _animateToIndex(_currentScrollIndex);
                                  }
                                  //     colorsss=1;
                                }

                                //  print(sss);
                              });
                            },
                            child: Container(
                              width: size.getWidth()*100,
                              margin: EdgeInsets.only(top:size.getHeight()*2,left: size.getWidth()*3,right:  size.getWidth()*3,bottom: size.getHeight()*3),
                              decoration: BoxDecoration(
                                color:selectedIndexList.contains(index)?Colors.grey.shade500.withOpacity(1):Color(theme.getColor("backgrouund")),
                                borderRadius: BorderRadius.all(Radius.circular(size.getWidth()*2),),
                                border: Border.all(
                                  width: 1,
                                  color: selectedIndexList.contains(index)?Colors.grey.shade500.withOpacity(1):Color(theme.getColor("iconsColor")),
                                ),
                              ),

                              child:Column(
                                children: [
                                  SizedBox(height:azkar.azkar_index_text_title(index,2,index_text)==""?size.getHeight()*0:size.getHeight()*2),
                                 Visibility(
                                 visible:azkar.azkar_index_text_title(index,2,index_text)==""?false:true,
                                     child:Text(azkar.azkar_index_text_title(index,2,index_text),style: TextStyle(fontFamily: "Abd",
                                       fontSize:_ziez_text_==true?size.getWidth()*ziez_text:size.getWidth()*size_.read('size'),color: Color(theme.getColor("iconsColor"))),textAlign: TextAlign.center,
                                     ),
                                 ),
                                  Container(
                                    margin: EdgeInsets.only(left: size.getWidth()*3,right:size.getWidth()*3,bottom:size.getHeight()*4),
                                    child:Container(
                                      margin: EdgeInsets.only(left: size.getWidth()*3,right:size.getWidth()*3,bottom:size.getHeight()*2.5,top: size.getHeight()*2.5),
                                      child:Text(azkar.azkar_index_text(index,0,index_text),  style: TextStyle(fontFamily: "Abd",
                                        fontSize:_ziez_text_==true?size.getWidth()*ziez_text:size.getWidth()*size_.read('size'),color: Color(theme.getColor("iconsColor")),),textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          ),

                          Container(
                            height: size.getHeight()*7,
                            margin:EdgeInsets.only(left:size.getWidth()*9,right:size.getWidth()*9,),
                            decoration: BoxDecoration(
                              color:selectedIndexList.contains(index)?Colors.grey.shade500.withOpacity(1):Color(theme.getColor("backgrouund")),
                              borderRadius: BorderRadius.all(Radius.circular(size.getWidth()*2),),
                              border: Border.all(
                                width: 1,
                                color:selectedIndexList.contains(index)?Colors.grey.shade500.withOpacity(1):Color(theme.getColor("iconsColor")),
                              ),
                            ),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    share(azkar.azkar_index_text(index,0,index_text));
                                  },
                                  child: Container(
                                    width:  size.getWidth()*9,
                                    height: size.getHeight()*9,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: size.getWidth()*0.3,
                                        color: Color(theme.getColor("iconsColor")),
                                      ),
                                    ),

                                    child:Center(
                                      child:Icon(Icons.share,color: Color(theme.getColor("iconsColor")),size: size.getWidth()*6,),
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.getWidth()*2),
                                Container(
                                  //   margin: EdgeInsets.only(right:size.getWidth()*1.5,left:size.getWidth()*1.5),
                                  child: Text(
                                    "مشاركة",
                                    style: TextStyle(
                                      fontFamily: 'Abd',

                                        color: Color(theme.getColor("iconsColor")),fontSize:size.getWidth()*6,fontWeight: FontWeight.bold,
                                    ),

                                  ),
                                ),
                                Container(
                                  width: size.getWidth()*15,
                                  height: size.getHeight()*4,
                                  child:VerticalDivider(
                                    color:Color(theme.getColor("iconsColor")),
                                    thickness:size.getWidth()*0.3,
                                  ),
                                ),
                                Container(
                                  width:  size.getWidth()*9,
                                  height: size.getHeight()*9,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: size.getWidth()*0.3,
                                      color: Color(theme.getColor("iconsColor")),
                                    ),
                                  ),

                                  child:Center(
                                    child:Text(list[index].toString(),style: GoogleFonts.amiri(
                                      color: Color(theme.getColor("iconsColor"),),fontSize: size.getHeight()*2.4,fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),
                                SizedBox(width: size.getWidth()*2),
                                Container(
                              //    margin: EdgeInsets.only(right:size.getWidth()*1.5,left:size.getWidth()*1.5),
                                  child:Text("التكرار",   style: TextStyle(
                                    fontFamily: 'Abd',

                                    color: Color(theme.getColor("iconsColor")),fontSize:size.getWidth()*6,fontWeight: FontWeight.bold,
                                  ),
                                  ),
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
          Visibility(
            visible:stop,
            child: GlassmorphicContainer(
              width:  double.infinity,
             // margin: EdgeInsets.only(right:size.getWidth()*2,left: size.getWidth()*2),
              height: double.infinity,
              borderRadius: 0,
              blur: 5,
              alignment: Alignment.center,
              border: 0,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),

              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.5),
                  Color((0xFFFFFFFF)).withOpacity(0.5),
                ],
              ),
              child:Column(

                children: [
                  SizedBox(height: size.getHeight()*5),
                  SiriWave(
                    controller: _controller,
                    options:  SiriWaveOptions(
                      height:size.getHeight()*60,
                      backgroundColor: Colors.transparent,
                    ),
                    style: SiriWaveStyle.ios_7,

                  ),
                  SizedBox(height: size.getHeight()*1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      SizedBox(width: size.getWidth()*1),
                      Container(
                        height: size.getHeight()*15,
                        width: size.getWidth()*15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF853D40),
                        ),
                        child: InkWell(
                          highlightColor:Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: ()async{
                            int result = await player.stop();
                            if(result == 1) { //stop success
                              setState(() {
                                isplaying = false;
                                audioplayed = false;
                                currentpos = 0;
                                stop=false;
                              });
                            }
                          },
                          child:Center(
                            child:Icon(Icons.close,size: size.getWidth()*9,color: Color(theme.getColor("iconsColor")),),
                          ),
                        ),
                      ),

                      Container(
                        height: size.getHeight()*13,
                        width: size.getWidth()*27,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isplaying?Colors.green:Color(0xFF5CBAFA),
                        ),
                        child: InkWell(
                          highlightColor:Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: (){
                            plays();
                            zzz();
                            if(isplaying){

                              _controller.setSpeed(0.0);

                            }else{
                              _controller.setSpeed(0.05);

                            }

                          },
                          child:Center(
                            child:Icon(isplaying?Icons.pause:Icons.play_arrow,size:size.getWidth()*18,color: Color(theme.getColor("iconsColor")),),
                          ),
                        ),
                      ),

                      Container(
                        height: size.getHeight()*15,
                        width: size.getWidth()*15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isplaying?Color(0xFF186A3A):Color(0xFF1F6086),
                        ),
                        child: InkWell(
                          highlightColor:Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: ()async{
                            int result = await player.seek(Duration(milliseconds:0));
                            if(result == 1){

                            }
                          },
                          child:Center(
                            child:Icon(Icons.refresh_sharp,size: size.getWidth()*9,color: Color(theme.getColor("iconsColor")),),
                          ),
                        ),
                      ),
                      SizedBox(width: size.getWidth()*1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class list extends StatefulWidget {
  late int number_azkar;
  late int index;
  late int index_text2;
  list(this.number_azkar,this.index,this.index_text2);
  @override
  State<list> createState() => _lstState(number_azkar,index,index_text2);
}

class _lstState extends State<list> {
  late int number_azkar;
  late int index;
  late int index_text2;
  _lstState(this.number_azkar,this.index,this.index_text2);
 bool _ziez_text_=false;
 final size_ = GetStorage();
 late double ziez_text=6.5;
   int? colorsss;
   List list=[];

  Future<void> share(String name) async {
    await FlutterShare.share(
        title: 'الاذكار',
        text: name,
        linkUrl: '',
        chooserTitle: 'share');
  }
  @override
  void initState() {
    // TODO: implement initState
    list.add(number_azkar);
    print(list);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    var azkar=azkar_text();
    azkar.azkar_texts(index_text2);
    Themes theme = Themes();

    return Container(
      // color: Colors.orange,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          InkWell(
            onTap: (){
              setState(() {
             //   print(index);
              ///  azkar.azkar_morning.removeAt(index);
                if(number_azkar>1){
                 // number_azkar--;
                  list[0]--;
                }else{
                colorsss=1;

                }


              });
            },
            child: Container(
              width: size.getWidth()*100,
              margin: EdgeInsets.only(top:size.getHeight()*2,left: size.getWidth()*3,right:  size.getWidth()*3,bottom: size.getHeight()*3),
              decoration: BoxDecoration(
                color: colorsss!=1?Color(theme.getColor("backgrouund")):Colors.grey.shade500.withOpacity(1),
                borderRadius: BorderRadius.all(Radius.circular(size.getWidth()*2),),
                border: Border.all(
                  width: 1,
                  color: Color(theme.getColor("iconsColor")),
                ),
              ),
                /*
                style: GoogleFonts.amiri(
                fontSize:_ziez_text_==true?size.getWidth()*ziez_text:size.getWidth()*size_.read('size'),color: Color(theme.getColor("iconsColor")),),textAlign: TextAlign.center,
                )
                */
              child:Container(
                margin: EdgeInsets.only(left: size.getWidth()*3,right:size.getWidth()*3,bottom:size.getHeight()*2),
                child:Container(
                  margin: EdgeInsets.only(left: size.getWidth()*3,right:size.getWidth()*3,bottom:size.getHeight()*2.5,top: size.getHeight()*2.5),
                  child: Text(azkar.azkar_index_text(index,0,index_text2),  style: GoogleFonts.amiri(
                    fontSize:_ziez_text_==true?size.getWidth()*ziez_text:size.getWidth()*size_.read('size'),color: Color(theme.getColor("iconsColor")),),textAlign: TextAlign.center,
                  ),
              ),

            ),
          ),
          ),

          Container(
            height: size.getHeight()*7,
            margin:EdgeInsets.only(left:size.getWidth()*10,right:size.getWidth()*10,),
            decoration: BoxDecoration(
              color: colorsss!=1?Color(theme.getColor("backgrouund")):Colors.grey.shade500.withOpacity(1),
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
                    share(azkar.azkar_index_text(index,0,index_text2));
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
                  child:Center(
                    child:Text(list[0].toString(),style: TextStyle(color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*4,fontWeight: FontWeight.bold),),
                  ),
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
    );
  }
}
class MyWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 40.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 40.0);

    //see my previous post to understand about Bezier Curve waves
    // https://www.hellohpc.com/flutter-how-to-make-bezier-curve-waves-using-custom-clippath/

    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            0.0,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      } else {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            size.height - 120,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      }
    }

    path.lineTo(0.0, 40.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}




