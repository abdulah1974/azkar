import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/size.dart';
import '../Constants/theme.dart';
class page_alkahf extends StatefulWidget {
  const page_alkahf({Key? key}) : super(key: key);

  @override
  State<page_alkahf> createState() => _page_alkahfState();
}

class _page_alkahfState extends State<page_alkahf> {
  List list_ = [
    "alkahf_page_/alkahf_1.png",
    "alkahf_page_/alkahf_2.png",
    "alkahf_page_/alkahf_3.png",
    "alkahf_page_/alkahf_4.png",
    "alkahf_page_/alkahf_5.png",
    "alkahf_page_/alkahf_6.png",
    "alkahf_page_/alkahf_7.png",
    "alkahf_page_/alkahf_8.png",
    "alkahf_page_/alkahf_9.png",
    "alkahf_page_/alkahf_10.png",
    "alkahf_page_/alkahf_11.png",
    "alkahf_page_/alkahf_12.png",
  ];
  int items = 1;
  @override
  Widget build(BuildContext context) {
    var size = mediaQuery(context);
    Themes theme = Themes();
    return  Scaffold(
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
        title:Text("سورة الكهف",style: TextStyle(color: Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold),),
        //  centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: size.getWidth()*5,),
                Text("$items/12",style: TextStyle(color: Color(theme.getColor("iconsColor")),fontWeight: FontWeight.bold,)),
              ],
            ),
            Container(
              height: size.getHeight()*90,
              child: PageView.builder(
                  onPageChanged: (i){
                    setState(() {

                      items=i+1;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: list_.length,
                  itemBuilder: (context,index){
                    return  Container(



                      margin: EdgeInsets.symmetric(vertical: size.getHeight()*1, horizontal: size.getWidth()*3),
                      child: _buildItem(index),
                    );
                  }),
            ),

          ],
        ),
      ),
    );
  }
  _buildItem(index){
    var size = mediaQuery(context);
    Themes theme = Themes();
    return Center(
      child: Container(
        height: size.getHeight()*88,

        child: Container(

          decoration: BoxDecoration(
            /*
              boxShadow: [
                BoxShadow(
                  color: Color(theme.getColor("iconsColor")),
                  blurRadius: 5.0,
                ),
              ],

             */
            image: DecorationImage(

                image:AssetImage(list_[index]),
               fit: BoxFit.fill,

            ),
            borderRadius: BorderRadius.circular(size.getWidth()*4),
          ),
        ),
      ),
    );
  }
}
