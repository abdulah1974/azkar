import 'dart:math';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Constants/size.dart';
import 'package:vibration/vibration.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../Constants/theme.dart';
class praise extends StatefulWidget{
 String name;
 praise(this.name);


  @override
  State<praise> createState() => _praiseState(name);
}

class _praiseState extends State<praise>   {
  String name;

  _praiseState(this.name);
  int number = 0;
 void _praise(){
   number++;
 }
 int length =0;

  TextEditingController edit_controller=  TextEditingController();
  Future<void> showMyDialog() async {
    var size = mediaQuery(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Themes theme = Themes();
        return AlertDialog(
          backgroundColor: Color(theme.getColor("backgrouund")),
          title:  Text('اضافة تسبيح',style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor"))),),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[

                Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          maxLines: 2,
                          minLines: 1,
                          maxLength: 40,
                          cursorColor:Color(theme.getColor("iconsColor")),
                          onChanged: (s){

                            length++;

                           // print(text_);
                          //  print(_);
                          },

                          controller:edit_controller,
                          // readOnly: true,
                          textAlign:TextAlign.right,

                          autofocus:true,
                          style:TextStyle(color:  Color(theme.getColor("iconsColor")),),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size.getWidth()*2),
                              borderSide: BorderSide(
                                color: Color(theme.getColor("iconsColor")),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(theme.getColor("iconsColor"))),
                              borderRadius: BorderRadius.circular(size.getWidth()*2),
                            ),
                          ),

                        ),

                      ],
                    )
                )

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('الغاء',style: TextStyle(color: Colors.red),),
              onPressed: () {
                edit_controller.clear();
                length=0;
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('حفظ',style: TextStyle(color: Colors.green),),
              onPressed: () {


                if(edit_controller.text.isNotEmpty||edit_controller.text!=""){
                  Navigator.of(context).pop();
                }

              },
            ),
          ],
        );
      },
    );
  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prayer_();


 }
 // notes.png

  List prayer =[ 'ربي اني مغلوب فانتصر','لا اله اله الله','الحمدالله','ربي اغفر لي'];
  String? temp;
  final _random =  Random();
  void prayer_() async {

    temp = prayer[_random.nextInt(prayer.length)];



  }
  _checkIfVibrate() async {
    // check if device can vibrate
    canVibrate = await Vibrate.canVibrate;
  }
  late  bool canVibrate = false;

  _getVibration(feedbackType) async {
    if (canVibrate) {
      Vibrate.feedback(feedbackType);
       Vibrate.vibrate();   // Try this too!
    }
  }
  double pars=0.0;
  void aaa(){
    setState(() {


      if(pars>0.99){
        pars=0.0;
      }else{
        pars+=0.1;
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Themes theme = Themes();
    return Scaffold(
      backgroundColor: Color(theme.getColor("backgrouund")),
      appBar:AppBar(
        leading: IconButton(
          splashRadius: size.getWidth()*5,
          //     highlightColor: Colors.transparent,
          //     splashColor: Colors.transparent,
          icon: Icon(Icons.arrow_back, size: size.getWidth()*8,color: Color(theme.getColor("iconsColor")),),
          onPressed: () {
            Navigator.pop(context);
          },),
        elevation: 0,
        backgroundColor: Color(theme.getColor("backgrouund")),
        actions: [
          IconButton(
            splashRadius: 20,
            icon:  Icon(Icons.add,color: Color(theme.getColor("iconsColor")),),
            onPressed: () {
              showMyDialog();
            },
          ),
        ],
        title: Text(name,style: TextStyle(color: Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold,),),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.getHeight()*5,),
            Container(
              child: Text(edit_controller.text.isEmpty?temp.toString():edit_controller.text,maxLines:1,style: TextStyle(color:  Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold,fontSize:size.getWidth()*length>30?15:30,)),
            ),
            SizedBox(height: size.getHeight()*5,),
            InkWell(
              highlightColor:Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (){
                setState(() {
                  _praise();
                  aaa();

                });
              },
              child: CircularPercentIndicator(
                lineWidth: size.getWidth()*3,
                radius:size.getWidth()*80,
                percent:pars,
                animation: true,
                center: Text(number.toString(),style: TextStyle(color:  Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold,fontSize: size.getWidth()*20,)),
                backgroundColor: Colors.grey,
                progressColor:Color(theme.getColor("iconsColor"))
              ),
            ),

            Container(
              alignment:Alignment.topCenter,
              margin: EdgeInsets.only(top:size.getHeight()*2,left:size.getHeight()*30),
              child: SizedBox(
                  height: size.getWidth()*20, width:size.getWidth()*20,

                  child:InkWell(
                    highlightColor:Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                       number=0;
                       pars=0.0;
                      });
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(size.getHeight()*20),

                        ),
                        color: Color(theme.getColor("backgrouund")),
                        shadowColor:  Color(theme.getColor("iconsColor")),
                        elevation:5,
                        child: Center(
                          child:Icon(Icons.refresh_sharp,color:Color(theme.getColor("iconsColor")),),
                        )
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }

}

