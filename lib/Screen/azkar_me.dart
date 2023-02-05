import 'dart:math';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../Constants/size.dart';
import '../Constants/theme.dart';
import '../DataBase/Planets.dart';
import '../DataBase/db_helper.dart';
class azkar_me extends StatefulWidget {

  @override
  State<azkar_me> createState() => _azkar_meState();
}

class _azkar_meState extends State<azkar_me> {


   TextEditingController controller=  TextEditingController();
   Future<void> _showMyDialog() async {
     var size = mediaQuery(context);
     Themes theme = Themes();
     return showDialog<void>(
       context: context,
       barrierDismissible: false,
       builder: (BuildContext context) {
         return AlertDialog(
           backgroundColor: Color(theme.getColor("backgrouund")),
           title:  Text('اضافة الاذكار/ادعية خاصة',style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor")),),),
           content: SingleChildScrollView(
             child: ListBody(
               children:  <Widget>[
                 Container(
                     child: Column(
                       children: <Widget>[
                         TextField(
                           controller:controller,
                           cursorColor:Color(theme.getColor("iconsColor")),
                          // readOnly: true,
                           textAlign: TextAlign.right,

                           autofocus:true,
                           style:TextStyle(color:  Color(theme.getColor("iconsColor")),),
                           maxLines: 4,
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

                         )
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
                 controller.clear();
                 Navigator.of(context).pop();
               },
             ),
             TextButton(
               child: const Text('حفظ',style: TextStyle(color: Colors.green),),
               onPressed: () {
                 addPlanets(controller.text);
                 controller.clear();
                 Navigator.of(context).pop();
               },
             ),
           ],
         );
       },
     );
   }


   late DataBase handler;

   int list=1;

   Future<int> addPlanets(String names) async {



     Planets fourthPlanet = Planets(id: list, name: names.toString(), age: 20, distancefromsun: 40);




     List<Planets> planets = [fourthPlanet];


     return await handler.insertPlanets(planets);

   }




   TextEditingController edit_controller=  TextEditingController();
   Future<void> edit_showMyDialog(id,names) async {
     var size = mediaQuery(context);
     edit_controller=TextEditingController(text:names);
     Themes theme = Themes();
     return showDialog<void>(
       context: context,
       barrierDismissible: false,
       builder: (BuildContext context) {

         return AlertDialog(
           backgroundColor: Color(theme.getColor("backgrouund")),
           title:  Text('تعديل الاذكار/ادعية خاصة',style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor")),),),
           content: SingleChildScrollView(
             child: ListBody(
               children:  <Widget>[
                 Container(
                     child: Column(
                       children: <Widget>[
                         TextField(
                           cursorColor:Color(theme.getColor("iconsColor")),
                           controller:edit_controller,
                           // readOnly: true,
                           textAlign: TextAlign.right,
                           autofocus:true,
                           style:TextStyle(color:  Color(theme.getColor("iconsColor")),),
                           maxLines: 4,
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
                         )
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
                 Navigator.of(context).pop();
               },
             ),
             TextButton(
               child:  Text('حفظ',style: TextStyle(color: Colors.green),),
               onPressed: () {


                 handler.update(Planets(id: id, name: edit_controller.text, age: 20, distancefromsun: 40));
               //  controller.clear();

                 Navigator.of(context).pop();
               },
             ),
           ],
         );
       },
     );
   }
   List prayer =[ 'ربي اني مغلوب فانتصر','لا اله اله الله','الحمدالله','ربي اغفر لي'];
   final _random =  Random();
   String? temp;
   String? temp_image_note;
   List image_note=["icon/notes.png","icon/note.png","icon/note_2.png","icon/note_3.png"];

   @override

   void initState() {

     super.initState();

     handler = DataBase();

     temp = prayer[_random.nextInt(prayer.length)];
     temp_image_note= image_note[_random.nextInt(image_note.length)];


   }
   bool show_me=true;
   void delet(id)  {

     Planets fourthPlanet = Planets(id: id, name: "", age: 20, distancefromsun: 40);


     List<Planets> planets = [fourthPlanet];
     for(int i=0;i<planets.length;i++){
       handler.deletePlanet(planets[i].id);
     }


   }
   List<int> selectedIndexList =[];
   Alignment alignment = Alignment.center;
   bool _first = true;
   double _height = 10;
   @override
  Widget build(BuildContext context) {
     var size = mediaQuery(context);
     Themes theme = Themes();
     final theme2 = GetStorage();
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
       title: Text("ورد الخاصة",style: TextStyle(fontWeight: FontWeight.bold,color: Color(theme.getColor("iconsColor")),),),
     //  centerTitle: true,

       actions: [
         IconButton(
           splashRadius: 20,
           icon:Icon(Icons.add,color: Color(theme.getColor("iconsColor")),),
           onPressed: () {
             _showMyDialog();
           },
         ),
       ],

     ),
      body:Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder(

                future: handler.retrievePlanets(),

                builder:(BuildContext context, AsyncSnapshot<List<Planets>> snapshot) {
                  if (snapshot.hasData) {

                    return snapshot.data?.length!=0?Column(
                      children: [
                        Container(
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data?.length,
                              itemBuilder:(_,index){
                               list+=snapshot.data![index].id;
                             //   print(snapshot.data![index].id);
                                return Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(snapshot.data![index].name,textAlign: TextAlign.right,style:TextStyle(fontFamily: "Abd",
                                                color: Color(theme.getColor("iconsColor"),),fontSize: size.getHeight()*3,fontWeight: FontWeight.bold,
                                              ),),

                                              trailing: Container(

                                                child: InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      if (!selectedIndexList.contains(index)) {

                                                        selectedIndexList.add(index);
                                                      } else {
                                                        selectedIndexList.remove(index);


                                                      }

                                                    });
                                                  },
                                                  child: Icon(Icons.more_vert,color: Color(theme.getColor("iconsColor"),),),
                                                ),
                                              ),
                                            ),
                                            AnimatedContainer(
                                              duration: const Duration(milliseconds: 550),
                                              height: selectedIndexList.contains(index)?50:10,
                                              width: MediaQuery.of(context).size.width,
                                              child: SingleChildScrollView(
                                                physics: const NeverScrollableScrollPhysics(),
                                                child: Column(
                                                 children: [
                                                   AnimatedOpacity(
                                                     opacity: selectedIndexList.contains(index) ? 1.0 : 0.0,
                                                     duration: const Duration(milliseconds: 550),
                                                     child:  Visibility(
                                                       visible:selectedIndexList.contains(index)?true:false,
                                                       child: Padding(
                                                         padding: EdgeInsets.all(size.getHeight()*0.7,),
                                                         child: Container(

                                                           padding: EdgeInsets.all(size.getHeight()*1.5,),
                                                           child: Row(
                                                             mainAxisAlignment: MainAxisAlignment.end,
                                                             children: [
                                                               InkWell(
                                                                 child: Container(
                                                                   margin: EdgeInsets.only(top:size.getHeight()*0.2,),
                                                                   child: Icon(
                                                                     Icons.edit,
                                                                     size: size.getWidth()*6,
                                                                     color: Color(theme.getColor("iconsColor"),),
                                                                   ),
                                                                 ),
                                                                 onTap: (){
                                                                   setState(() {
                                                                     edit_showMyDialog(snapshot.data![index].id,snapshot.data![index].name);
                                                                   });
                                                                 },
                                                               ),
                                                               SizedBox(width: size.getWidth()*5,),
                                                               InkWell(
                                                                 onTap: (){
                                                                   setState(() {
                                                                     show_me=!show_me;
                                                                     //    remove.remove(value)
                                                                     delet(snapshot.data![index].id);
                                                                     _first =true;

                                                                   });
                                                                 },
                                                                 child: Container(
                                                                   margin: EdgeInsets.only(top:size.getHeight()*0.2,),
                                                                   child: Icon(
                                                                     Icons.delete_outline_sharp,
                                                                     size: size.getWidth()*6,
                                                                     color: Color(theme.getColor("iconsColor"),),
                                                                   ),
                                                                 ),
                                                               ),
                                                             ],
                                                           ),
                                                         ),

                                                       ),
                                                     ),
                                                   ),

                                                 ],
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                        margin: EdgeInsets.all(size.getWidth()*1.4),
                                        padding: EdgeInsets.all(size.getWidth()*1.4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(size.getWidth()*2,),
                                          color:Color(theme.getColor("contentColor")),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          height: size.getHeight()*93,
                        ),
                      ],
                    ):AnimatedContainer(
                      decoration:BoxDecoration(
                        color: Colors.grey.shade600.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(_first?size.getWidth()*3:100),
                      ),
                      duration:Duration(milliseconds: 500),

                      height:_first?size.getHeight()*30:0,
                      width:_first?size.getWidth()*65:0,
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          InkWell(
                                highlightColor: Colors.transparent,
                               splashColor: Colors.transparent,
                            onTap: (){
                              setState(()  {
                                _first = !_first;
                                Future.delayed( Duration(milliseconds: 550), () {
                                  setState(() {
                                    addPlanets(temp.toString());
                                  });
                                 // print("ll");
                                });

                              });
                            },
                            child:Container(
                              width:_first?size.getWidth()*65:0,
                              height:_first?size.getHeight()*30:0,
                              child: Center(
                                child: ListView(
                                  physics:const NeverScrollableScrollPhysics(),
                                  children: [
                                    SizedBox(height: size.getHeight()*1,),
                                    Container(
                                      height: size.getHeight()*15,
                                      child:Image.asset(temp_image_note.toString()),
                                    ),
                                      SizedBox(height: size.getHeight()*5,),
                                     Text(temp.toString(),style: TextStyle(fontFamily: "Abd",color: Color(theme.getColor("iconsColor")),fontSize: size.getWidth()*6,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  } else {

                    return Container();

                  }

                },

              ),

            ],
          ),
        ),
      ),
    );
  }
}


