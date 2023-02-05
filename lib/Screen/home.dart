import 'package:azkar/Screen/azkar_.dart';
import 'package:azkar/Screen/page_alkahf.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:math';
import 'dart:ui';
import 'package:vibration/vibration.dart';
import 'package:azkar/Screen/praise.dart';
import 'package:flutter/material.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import 'alkahf.dart';
import 'azkar_2.dart';
import 'azkar_me.dart';
import 'god_names.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  List prayer = [
    'ربي اني مغلوب فانتصر',
    'اللهم صل وسلم وبارك على نبينا محمد',
    'لا اله الا الله',
    'الحمدالله',
    'ربي اغفر لي',
    'وَقُلْ رَبي زِدْنِي عِلْمًا',
    'رَبِّ إِنِّي ظَلَمْتُ نَفْسِي فَاغْفِرْ لِي',
    'إِنَّمَا أَشْكُو بَثِّي وَحُزْنِي إِلَى اللَّهِ',
    'رَبِّ لَا تَذَرْنِي فَرْداً وَأَنتَ خَيْرُ الْوَارِثِينَ',
  ];
  String? temp;
  final _random =  Random();
  void prayer_() async {

        temp = prayer[_random.nextInt(prayer.length)];
         while (temp != null) {
           await  Future.delayed(const Duration(seconds : 7));
           setState(() {

             temp = prayer[_random.nextInt(prayer.length)];

           });

         //  print(temp);
          // temp = prayer[_random.nextInt(prayer.length)];
         }


  }
  late Animation<Color> _colorAnimation;
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {

   setState(() {
     prayer_();

   });
   controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);

   animation =
   ColorTween(begin: Color.fromRGBO(118, 214, 104, 1), end:Colors.red).animate(controller)
     ..addListener(() {
       setState(() {

       });
     });
   animateColor();

   super.initState();

  }
  bool buttonToggle = true;
  void animateColor() {
    if (buttonToggle) {
      controller.forward();
    } else {
      controller.reverse();
    }
    buttonToggle = !buttonToggle;
  }
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Themes theme = Themes();
    final theme2 = GetStorage();
    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: size.getHeight()*25,
              decoration: BoxDecoration(
              //  Color(theme.getColor("contentColor")),
              //  Color.fromRGBO(118, 214, 104, 1),
                color:theme2.read('Theme')==1?Color(theme.getColor("contentColor")):Color.fromRGBO(118, 214, 104, 1),
                borderRadius: BorderRadius.circular(size.getWidth()*5),
              ),

            ),
                   Container(
                     margin: EdgeInsets.only(top:size.getHeight()*15),
                      padding:EdgeInsets.symmetric(horizontal: size.getWidth()*11),
                       width: size.getWidth()*100,
                       child: ClipRect(
                        child:  BackdropFilter(
                          filter:  ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                          child:  Container(
                            height: size.getHeight()*18,
                            decoration:  BoxDecoration(
                              color: Colors.grey.shade200.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(size.getWidth()*3),
                            ),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:EdgeInsets.symmetric(horizontal: size.getWidth()*3,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: size.getHeight()*7),
                                        child: Text(
                                          'السلام عليكم',
                                          style: TextStyle(fontWeight: FontWeight.bold,color:theme2.read('Theme')==1?Colors.white:Color.fromRGBO(118, 214, 104, 1),fontSize: size.getWidth()*7,),

                                        ),
                                      ),
                                       InkWell(
                                         highlightColor:Colors.transparent,
                                         splashColor: Colors.transparent,
                                        child: Container(
                                          margin: EdgeInsets.only(top:size.getHeight()*1),
                                          width: size.getWidth()*20,
                                          child:theme2.read('Theme')==1?Image.asset("icon/dark_themes.png",):Image.asset("icon/night.png",),
                                        ),
                                         onTap: (){
                                          setState(() {
                                            theme.changeTheme();
                                            animateColor();
                                          });
                                         },
                                      ),
                                   //   Colors.green

                                    ],
                                  ),
                                ),


                                Container(
                                  margin:  EdgeInsets.symmetric(horizontal: size.getWidth()*2,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                     Text(temp.toString(),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent,fontSize: size.getWidth()*4.7,),),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                     ),
                   ),
               Column(
                 children: [
                  SizedBox(height:size.getHeight()*38),
                   conternr("ورد الصباح","ورد المساء","icon/morning.png","icon/night.png",Colors.deepPurpleAccent,Colors.amber,2,5,1,2),
                   SizedBox(height:size.getHeight()*4),
                   conternr("تسبيح","ورد النوم","icon/beads.png","icon/moon.png",Colors.black,Colors.brown,10,7,3,4),
                   SizedBox(height:size.getHeight()*4),
                   islam("اسماء الله الحسنى","icon/islam.png",Colors.blueAccent,8,1),
                   SizedBox(height:size.getHeight()*4),
                   conternr("ورد الصلاة","ورد الاذان","icon/prayer.png","icon/mosque.png",Colors.orangeAccent,Colors.indigo,2,7,5,6),
                   SizedBox(height:size.getHeight()*4),
                   conternr("ورد الوضوء","ورد المنزل","icon/water.png","icon/house.png",Colors.green,Colors.lightBlueAccent,2,5,7,8),
                   SizedBox(height:size.getHeight()*4),
                   islam("ورد الخاصة","icon/flower.png",Colors.pink,16,2),
                   SizedBox(height:size.getHeight()*4),
                   conternr("ورد الاستيقاظ","سورة الكهف","icon/getting_up.png","icon/koran.png",Colors.brown.shade700,Colors.redAccent.shade200,0,2,9,2),
                   SizedBox(height:size.getHeight()*4),
                 ],
               ),


          ],
        ),
      ),
    );
  }
}
class conternr extends StatelessWidget {
  String? wrd;
  String? wrd2;
  String? icons;
  String? icons2;
  Color color;
  Color color2;
  int size_;
  int size2;
  int index_push;
  int index_push2;
  conternr(this.wrd,this.wrd2,this.icons,this.icons2,this.color,this.color2,this.size_,this.size2,this.index_push,this.index_push2);
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Themes theme = Themes();
    return  Row(

      children: [
        InkWell(
          highlightColor:Colors.transparent,
          splashColor: Colors.transparent,
          child: Card(

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(size.getWidth()*2.5),
            ),
            elevation: 3,
            margin: EdgeInsets.only(left: size.getHeight()*3.5,right: size.getHeight()*3),

            color: Colors.amber,
            child:Container(
              decoration:BoxDecoration(
                color:color2,
                borderRadius: BorderRadius.circular(size.getWidth()*2.5),
              ),
              height: size.getHeight()*7.7,
              width: size.getWidth()*40,
              child:Container(
                margin:  EdgeInsets.symmetric(horizontal: size.getWidth()*1,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(wrd.toString() ,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white70,),),
                    SizedBox(width: size.getWidth()*size_,),
                    Container(
                      width: size.getWidth()*14,
                      child:Image.asset(icons.toString(),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          onTap: (){

            if(index_push==3){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  praise(wrd.toString())),
              );
            }
            if(index_push==1){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  azkar_(wrd.toString(),1)),
              );


            }
            if(index_push==5){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  azkar_(wrd.toString(),5)),
              );
            }

            if(index_push==7){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  azkar_(wrd.toString(),7)),
              );
            }
            if(index_push==9){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  azkar_(wrd.toString(),8)),
              );
            }
          },
        ),

        InkWell(
          highlightColor:Colors.transparent,
          splashColor: Colors.transparent,
          onTap: (){

            if(index_push==1){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  azkar_(wrd2.toString(),2)),
              );
            }
            if(index_push==3){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  azkar_(wrd2.toString(),3)),
              );
            }
            if(index_push==5){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  azkar_(wrd2.toString(),4)),
              );
            }
            if(index_push==7){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  azkar_(wrd2.toString(),6)),
              );

            }
            if(index_push==9){
              print(index_push);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  page_alkahf()),
              );
            }
          },
          child: Card(
            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(size.getWidth()*2.5),
            ),
            elevation: 3,
            margin: EdgeInsets.only(left: size.getHeight()*3),
            color: Colors.amber,
            child:Container(

              decoration:  BoxDecoration(
                color:color,
                borderRadius: BorderRadius.circular(size.getWidth()*2.5),
              ),
              height: size.getHeight()*7.7,
              width: size.getWidth()*40,
              child:Container(
                margin:EdgeInsets.symmetric(horizontal: size.getWidth()*2,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(wrd2.toString(),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white70,),),
                    SizedBox(width: size.getWidth()*size2,),
                    Container(
                      width: size.getWidth()*12,
                      child:Image.asset(icons2.toString(),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class islam extends StatelessWidget {
  String? wrd;
  String? icons;
  Color color;
  int size_;
  int index_push;
  islam(this.wrd,this.icons,this.color,this.size_,this.index_push);
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    return  Row(

      children: [

        InkWell(
          highlightColor:Colors.transparent,
          splashColor: Colors.transparent,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.getWidth()*2.5),
            ),
            elevation: 3,
            margin: EdgeInsets.only(left:size.getHeight()*10.3,right:size.getHeight()*10.3),
            color: Colors.amber,
            child:Container(
              decoration:BoxDecoration(
                color:color,
                borderRadius: BorderRadius.circular(size.getWidth()*2.5),
              ),
              height: size.getHeight()*7.7,
              width: size.getWidth()*55,
              child:Container(
                margin:  EdgeInsets.symmetric(horizontal: size.getWidth()*2,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(wrd.toString() ,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white70,),),
                    SizedBox(width: size.getWidth()*size_,),
                    Container(
                      width: size.getWidth()*12,
                      child:Image.asset(icons.toString(),),
                    ),

                  ],
                ),
              ),
            ),
          ),
          onTap: (){
            if(index_push==2){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  azkar_me()),
              );
            }
            if(index_push==1){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  god_names()),
              );
            }

          },
        ),
      ],
    );
  }
}


