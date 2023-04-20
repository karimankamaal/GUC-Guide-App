import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/home/homepage.dart';
import 'package:myfirstapp/pages/map_page.dart';

import '../map_screen.dart';


class MRSTour extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            onTap: (){},
            child: Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(top:450,left: 75),
                    child:CustomPaint(
                      size: Size(130, (140*1.2697674418604652).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: LookingRight(),
                    )
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('lib/assets/solarpanel.jpeg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  margin: EdgeInsets.only(top:467,left:17),
                  width: 150,
                  height: 145,
                ),
                Container(
                  margin: EdgeInsets.only(top: 523, left: 170),
                  child: Icon(Icons.pause, size: 30,color: Color(0xafff0000),),
                ),
              ],
            ),
          ),

          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(top:35,left:20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Color(0xafff0000)),
                onPressed: (){
                  Navigator.pushNamed(context, '/homepage');
                },
              ),
            ),
          ),


          Column(
            children: [
              Container(
                  margin:EdgeInsets.only(left:20,top:180),
                  child:
                  Column(
                      children:[
                        Text("MRS",style: TextStyle(fontSize: 46,fontFamily: 'misto',color: Color(0xafff0000)),), Text("Lab",style: TextStyle(fontSize: 46,fontFamily: 'misto',color: Color(0xafff0000))),Text("Tour",style: TextStyle(fontSize: 46,fontFamily: 'misto',color: Color(0xafff0000))),
                      ]
                  )
              )
            ],
          ),
          Container(
              margin:EdgeInsets.only(top:70,left:255),
              child: CustomPaint(
                size: Size(120, (120*1.9647887323943662).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: Shape(),
              )
          ),

          GestureDetector(
            onTap:(){ },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top:320,left:210),
                  child: CustomPaint(
                    size: Size(140, (145*1.2697674418604652).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: LookingLeft(),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/img.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                  margin: EdgeInsets.only(top:340,left:250),
                  width: 150,
                  height: 145,
                ),

                Container(
                  margin: EdgeInsets.only(top: 395, left: 218),
                  child: Icon(Icons.location_on, size: 30,color: Color(0xafff0000),),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class LookingRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.8427628,size.height*0.1130615);
    path_0.cubicTo(size.width*0.8693860,size.height*0.1636810,size.width*0.8685488,size.height*0.2098630,size.width*0.8649209,size.height*0.2590579);
    path_0.cubicTo(size.width*0.8632698,size.height*0.2814989,size.width*0.8624419,size.height*0.2927194,size.width*0.8644186,size.height*0.3066355);
    path_0.cubicTo(size.width*0.8668279,size.height*0.3235960,size.width*0.8745628,size.height*0.3447018,size.width*0.8840000,size.height*0.3600656);
    path_0.cubicTo(size.width*0.8917395,size.height*0.3726703,size.width*0.9007907,size.height*0.3826557,size.width*0.9188930,size.height*0.4026264);
    path_0.lineTo(size.width*0.9745767,size.height*0.4640586);
    path_0.cubicTo(size.width*0.9856698,size.height*0.4762967,size.width*0.9912186,size.height*0.4824176,size.width*0.9938791,size.height*0.4889560);
    path_0.cubicTo(size.width*0.9974279,size.height*0.4976777,size.width*0.9974279,size.height*0.5070549,size.width*0.9938791,size.height*0.5157729);
    path_0.cubicTo(size.width*0.9912186,size.height*0.5223150,size.width*0.9856698,size.height*0.5284359,size.width*0.9745767,size.height*0.5406740);
    path_0.lineTo(size.width*0.9188930,size.height*0.6021062);
    path_0.cubicTo(size.width*0.9008233,size.height*0.6220440,size.width*0.8917860,size.height*0.6320110,size.width*0.8840558,size.height*0.6445824);
    path_0.cubicTo(size.width*0.8746140,size.height*0.6599414,size.width*0.8669070,size.height*0.6808974,size.width*0.8644651,size.height*0.6978571);
    path_0.cubicTo(size.width*0.8624698,size.height*0.7117326,size.width*0.8632791,size.height*0.7230476,size.width*0.8648930,size.height*0.7456740);
    path_0.cubicTo(size.width*0.8682837,size.height*0.7931502,size.width*0.8686930,size.height*0.8376337,size.width*0.8427628,size.height*0.8869377);
    path_0.cubicTo(size.width*0.8191581,size.height*0.9318168,size.width*0.7738884,size.height*0.9674689,size.width*0.7169023,size.height*0.9860586);
    path_0.cubicTo(size.width*0.6741674,size.height,size.width*0.6199860,size.height,size.width*0.5116279,size.height);
    path_0.lineTo(size.width*-0.2279070,size.height);
    path_0.cubicTo(size.width*-0.3362656,size.height,size.width*-0.3904447,size.height,size.width*-0.4331823,size.height*0.9860586);
    path_0.cubicTo(size.width*-0.4901674,size.height*0.9674689,size.width*-0.5354372,size.height*0.9318168,size.width*-0.5590419,size.height*0.8869377);
    path_0.cubicTo(size.width*-0.5767442,size.height*0.8532821,size.width*-0.5767442,size.height*0.8106117,size.width*-0.5767442,size.height*0.7252747);
    path_0.lineTo(size.width*-0.5767442,size.height*0.2747253);
    path_0.cubicTo(size.width*-0.5767442,size.height*0.1893879,size.width*-0.5767442,size.height*0.1467194,size.width*-0.5590419,size.height*0.1130615);
    path_0.cubicTo(size.width*-0.5354372,size.height*0.06818462,size.width*-0.4901674,size.height*0.03253011,size.width*-0.4331823,size.height*0.01394147);
    path_0.cubicTo(size.width*-0.3904447,0,size.width*-0.3362656,0,size.width*-0.2279070,0);
    path_0.lineTo(size.width*0.5116279,0);
    path_0.cubicTo(size.width*0.6199860,0,size.width*0.6741674,0,size.width*0.7169023,size.height*0.01394147);
    path_0.cubicTo(size.width*0.7738884,size.height*0.03253011,size.width*0.8191581,size.height*0.06818462,size.width*0.8427628,size.height*0.1130615);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.black.withOpacity(0.8);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class LookingLeft extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.1438553,size.height*0.1130615);
    path_0.cubicTo(size.width*0.1194979,size.height*0.1636810,size.width*0.1202621,size.height*0.2098630,size.width*0.1235809,size.height*0.2590579);
    path_0.cubicTo(size.width*0.1250949,size.height*0.2814989,size.width*0.1258519,size.height*0.2927194,size.width*0.1240421,size.height*0.3066355);
    path_0.cubicTo(size.width*0.1218366,size.height*0.3235960,size.width*0.1147600,size.height*0.3447018,size.width*0.1061281,size.height*0.3600656);
    path_0.cubicTo(size.width*0.09904511,size.height*0.3726703,size.width*0.09076468,size.height*0.3826557,size.width*0.07420340,size.height*0.4026264);
    path_0.lineTo(size.width*0.02325889,size.height*0.4640586);
    path_0.cubicTo(size.width*0.01310855,size.height*0.4762967,size.width*0.008033404,size.height*0.4824176,size.width*0.005599574,size.height*0.4889560);
    path_0.cubicTo(size.width*0.002354455,size.height*0.4976777,size.width*0.002354455,size.height*0.5070549,size.width*0.005599574,size.height*0.5157729);
    path_0.cubicTo(size.width*0.008033404,size.height*0.5223150,size.width*0.01310855,size.height*0.5284359,size.width*0.02325894,size.height*0.5406740);
    path_0.lineTo(size.width*0.07420340,size.height*0.6021062);
    path_0.cubicTo(size.width*0.09073787,size.height*0.6220440,size.width*0.09900553,size.height*0.6320110,size.width*0.1060757,size.height*0.6445824);
    path_0.cubicTo(size.width*0.1147162,size.height*0.6599414,size.width*0.1217664,size.height*0.6808974,size.width*0.1239987,size.height*0.6978571);
    path_0.cubicTo(size.width*0.1258255,size.height*0.7117326,size.width*0.1250864,size.height*0.7230476,size.width*0.1236072,size.height*0.7456740);
    path_0.cubicTo(size.width*0.1205047,size.height*0.7931502,size.width*0.1201311,size.height*0.8376337,size.width*0.1438553,size.height*0.8869377);
    path_0.cubicTo(size.width*0.1654498,size.height*0.9318168,size.width*0.2068698,size.height*0.9674689,size.width*0.2590034,size.height*0.9860586);
    path_0.cubicTo(size.width*0.2981038,size.height,size.width*0.3476719,size.height,size.width*0.4468085,size.height);
    path_0.lineTo(size.width*1.123404,size.height);
    path_0.cubicTo(size.width*1.222540,size.height,size.width*1.272111,size.height,size.width*1.311209,size.height*0.9860586);
    path_0.cubicTo(size.width*1.363345,size.height*0.9674689,size.width*1.404762,size.height*0.9318168,size.width*1.426357,size.height*0.8869377);
    path_0.cubicTo(size.width*1.442553,size.height*0.8532821,size.width*1.442553,size.height*0.8106117,size.width*1.442553,size.height*0.7252747);
    path_0.lineTo(size.width*1.442553,size.height*0.2747253);
    path_0.cubicTo(size.width*1.442553,size.height*0.1893879,size.width*1.442553,size.height*0.1467194,size.width*1.426357,size.height*0.1130615);
    path_0.cubicTo(size.width*1.404762,size.height*0.06818462,size.width*1.363345,size.height*0.03253011,size.width*1.311209,size.height*0.01394147);
    path_0.cubicTo(size.width*1.272111,0,size.width*1.222540,0,size.width*1.123404,0);
    path_0.lineTo(size.width*0.4468085,0);
    path_0.cubicTo(size.width*0.3476719,0,size.width*0.2981038,0,size.width*0.2590034,size.height*0.01394147);
    path_0.cubicTo(size.width*0.2068698,size.height*0.03253011,size.width*0.1654498,size.height*0.06818462,size.width*0.1438553,size.height*0.1130615);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.black.withOpacity(0.8);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class Shape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_0_stroke.color=Colors.red.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5000000,size.height*0.2576204),size.width*0.4964789,paint_0_stroke);

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5000000,size.height*0.2576204),size.width*0.4964789,paint_0_fill);

    Paint paint_1_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_1_stroke.color=Colors.red.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.5035211,size.height*0.2576204),Offset(size.width*0.5035211,size.height*0.9888029),paint_1_stroke);

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Colors.red.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5035211,size.height*0.9798423),size.width*0.03873239,paint_2_fill);

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = Colors.red.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5035211,size.height*0.2594125),size.width*0.03873239,paint_3_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
