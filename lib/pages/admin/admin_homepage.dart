import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/specialevents_model.dart';
import '../../services/database.dart';

class AdminHomepage extends StatefulWidget {
  const AdminHomepage({Key? key}) : super(key: key);

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Scaffold(
        body:Stack(
          children: [
            Positioned(
              top:37,
              left: 20,
              child: Row(
              children:[
                Container(
                  width: 45,
                  height: 45,
                  margin: EdgeInsets.only(right: 190),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                          Icons.arrow_back_ios, color: Colors.lightBlue[800]),
                      onPressed: () {
                        Navigator.pushNamed(context, '/authenticate');
                      },
                    ),
                  ),
                ),

                   Column(
                children: [
                Text("GUC", style: TextStyle(
                fontFamily: 'misto',
                letterSpacing: 12,
                fontSize: 24,
                color: Colors.lightBlue[800],
                fontWeight: FontWeight.bold,
              ),),
                Text("GUIDE", style: TextStyle(
                  fontFamily: 'misto',
                  letterSpacing: 12,
                  fontSize: 24,
                  color: Colors.lightBlue[800],
                  fontWeight: FontWeight.bold,
                ),),
          ],

        )

           ]
              ),
            ),
            //top left
             Positioned(
                   child: Stack(
                     children:[
                     Positioned(
                         top: 170,
                         left:35,
                         child: GestureDetector(
                           onTap: (){
                             Navigator.pushNamed(context, '/eventsform');
                           },
                           child: Container(
                             width: 156,
                             height: 212,
                             decoration:BoxDecoration(
                                 borderRadius: BorderRadius.circular(30),
                                 color:Colors.lightBlue[800]
                             ),
                           ),
                         )),

                       Positioned(
                           top:110,
                           left: 53,
                           child: CustomPaint(
                             size: Size(120, (120*0.8790322580645161).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                             painter: RPSCustomPainter(),
                           )),
                       Positioned(
                           top:130,
                           left: 66,
                           child: CustomPaint(
                             size: Size(60, (60*0.8790322580645161).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                             painter: AddEvent(),
                           )),
                       Positioned(
                           top:250,
                           left: 90,
                           child:Container(
                             width:70,
                             child: Text(
                               "Add Event",style: TextStyle(
                                 fontFamily: 'robotoN',
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold
                             ),
                             ),
                           ) ),

                 ]
               )),
            // top right
            Positioned(child: Stack(
              children: [
                Positioned(
                    top: 230,
                    left:220,
                    child: GestureDetector(
                      onTap: (){Navigator.pushNamed(context, '/addrobot');},
                      child: Container(
                        width: 156,
                        height: 212,
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:Colors.lightBlue[800]
                        ),
                      ),
                    )),
                Positioned(
                    top:180,
                    left: 240,
                    child: GestureDetector(
                      onTap: (){Navigator.pushNamed(context, '/addrobot');},
                      child: CustomPaint(
                        size: Size(120, (120*0.8790322580645161).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: RPSCustomPainter(),
                      ),
                    )),
                Positioned(
                    top:200,
                    left: 257,
                    child: GestureDetector(
                      onTap: (){Navigator.pushNamed(context, '/addrobot');},
                      child: CustomPaint(
                        size: Size(60, (60*0.8790322580645161).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: EditPass(),
                      ),
                    )),
                Positioned(
                    top:320,
                    left: 240,
                    child:Container(
                      width:130,
                      child: Text(
                        "Add Robot",style: TextStyle(
                          fontFamily: 'robotoN',
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                    ) ),

              ],
            )),
            //bottom left
            Positioned(child: Stack(
              children: [
                Positioned(
                    top: 500,
                    left:220,
                    child: GestureDetector(
                      onTap:(){ Navigator.pushNamed(context, '/editevent');},
                      child: Container(
                        width: 156,
                        height: 212,
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:Colors.lightBlue[800]
                        ),
                      ),
                    )),
                Positioned(
                    top:450,
                    left: 240,
                    child: GestureDetector(
                      onTap:(){ Navigator.pushNamed(context, '/editevent');} ,
                      child: CustomPaint(
                        size: Size(120, (120*0.8790322580645161).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: RPSCustomPainter(),
                      ),
                    )),
                Positioned(
                    top:590,
                    left: 270,
                    child:GestureDetector(
                      onTap:(){ Navigator.pushNamed(context, '/editevent');} ,
                      child: Container(
                        width:70,
                        child: Text(
                          "Edit Event",style: TextStyle(
                            fontFamily: 'robotoN',
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    ) ),
                Positioned(
                    top:470,
                    left: 255,
                    child: CustomPaint(
                      size: Size(60, (60*0.8790322580645161).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: EditPen(),
                    )),

              ],
            )),
            //bottom right
            Positioned(child: Stack(
              children: [
                Positioned(
                    top: 450,
                    left:35,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/editrobot');
                      },
                      child: Container(
                        width: 156,
                        height: 212,
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:Colors.lightBlue[800]
                        ),
                      ),
                    )),
                Positioned(
                    top:400,
                    left: 53,
                    child: CustomPaint(
                      size: Size(120, (120*0.8790322580645161).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: RPSCustomPainter(),
                    )),
                Positioned(
                    top:420,
                    left: 70,
                    child: CustomPaint(
                      size: Size(60, (60*0.8790322580645161).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: Person(),
                    )),
                Positioned(
                    top:540,
                    left: 90,
                    child:Container(
                      width:70,
                      child: Text(
                        "Edit Robot",style: TextStyle(
                          fontFamily: 'robotoN',
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                    ) ),
              ],
            )),

          ]
    )

    );
        
    }
}
// class RPSCustomPainter extends CustomPainter {
// @override
// void paint(Canvas canvas, Size size) {
//
//   Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
//   paint_0_fill.color = Color(0xFFE0F7FA).withOpacity(1.0);
//   canvas.drawOval(Rect.fromCenter(center:Offset(size.width*0.5000000,size.height*0.5000000),width:size.width,height:size.height),paint_0_fill);
//
// }
//
// @override
// bool shouldRepaint(covariant CustomPainter oldDelegate) {
//   return true;
// }
// }
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.6785294,size.height*0.6063644);
    path_0.cubicTo(size.width*0.8288882,size.height*0.6065188,size.width*0.9508824,size.height*0.4729248,size.width*0.9510118,size.height*0.3079725);
    path_0.cubicTo(size.width*0.9511412,size.height*0.1430195,size.width*0.8293588,size.height*0.009175638,size.width*0.6790000,size.height*0.009021477);
    path_0.cubicTo(size.width*0.5286400,size.height*0.008867315,size.width*0.4066453,size.height*0.1424611,size.width*0.4065153,size.height*0.3074141);
    path_0.cubicTo(size.width*0.4063853,size.height*0.4723664,size.width*0.5281694,size.height*0.6062107,size.width*0.6785294,size.height*0.6063644);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff5D93E3).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.7204882,size.height*0.5108315);
    path_1.cubicTo(size.width*0.8130176,size.height*0.5109268,size.width*0.8881000,size.height*0.4200738,size.width*0.8881882,size.height*0.3079067);
    path_1.cubicTo(size.width*0.8882765,size.height*0.1957403,size.width*0.8133353,size.height*0.1047336,size.width*0.7208118,size.height*0.1046383);
    path_1.cubicTo(size.width*0.6282824,size.height*0.1045436,size.width*0.5532000,size.height*0.1953966,size.width*0.5531118,size.height*0.3075631);
    path_1.cubicTo(size.width*0.5530235,size.height*0.4197302,size.width*0.6279588,size.height*0.5107369,size.width*0.7204882,size.height*0.5108315);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xff5AA9D6).withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width*0.6572882,size.height*0.9886443);
    path_2.cubicTo(size.width*0.8423412,size.height*0.9888322,size.width*0.9924941,size.height*0.8178255,size.width*0.9926588,size.height*0.6066866);
    path_2.cubicTo(size.width*0.9928294,size.height*0.3955477,size.width*0.8429471,size.height*0.2242336,size.width*0.6578882,size.height*0.2240436);
    path_2.cubicTo(size.width*0.4728306,size.height*0.2238537,size.width*0.3226788,size.height*0.3948604,size.width*0.3225129,size.height*0.6059993);
    path_2.cubicTo(size.width*0.3223465,size.height*0.8171409,size.width*0.4722288,size.height*0.9884497,size.width*0.6572882,size.height*0.9886443);
    path_2.close();

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Color(0xff5082E3).withOpacity(1.0);
    canvas.drawPath(path_2,paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width*0.3955659,size.height*0.9166913);
    path_3.cubicTo(size.width*0.6095353,size.height*0.9169128,size.width*0.7831471,size.height*0.7245302,size.width*0.7833353,size.height*0.4870027);
    path_3.cubicTo(size.width*0.7835235,size.height*0.2494725,size.width*0.6102176,size.height*0.05673779,size.width*0.3962435,size.height*0.05651839);
    path_3.cubicTo(size.width*0.1822712,size.height*0.05629906,size.width*0.008661824,size.height*0.2486785,size.width*0.008474765,size.height*0.4862081);
    path_3.cubicTo(size.width*0.008287647,size.height*0.7237383,size.width*0.1815935,size.height*0.9164698,size.width*0.3955659,size.height*0.9166913);
    path_3.close();

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = Color(0xff3BA1FF).withOpacity(1.0);
    canvas.drawPath(path_3,paint_3_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
// class Person extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//
//     Path path_0 = Path();
//     path_0.moveTo(size.width*0.5000000,size.height*0.5416667);
//     path_0.cubicTo(size.width*0.5412042,size.height*0.5416667,size.width*0.5814833,size.height*0.5294500,size.width*0.6157458,size.height*0.5065542);
//     path_0.cubicTo(size.width*0.6500042,size.height*0.4836625,size.width*0.6767083,size.height*0.4511250,size.width*0.6924750,size.height*0.4130592);
//     path_0.cubicTo(size.width*0.7082417,size.height*0.3749913,size.width*0.7123708,size.height*0.3331025,size.width*0.7043292,size.height*0.2926896);
//     path_0.cubicTo(size.width*0.6962917,size.height*0.2522771,size.width*0.6764500,size.height*0.2151554,size.width*0.6473125,size.height*0.1860196);
//     path_0.cubicTo(size.width*0.6181792,size.height*0.1568838,size.width*0.5810583,size.height*0.1370417,size.width*0.5406458,size.height*0.1290033);
//     path_0.cubicTo(size.width*0.5002292,size.height*0.1209646,size.width*0.4583417,size.height*0.1250904,size.width*0.4202750,size.height*0.1408583);
//     path_0.cubicTo(size.width*0.3822063,size.height*0.1566267,size.width*0.3496692,size.height*0.1833296,size.width*0.3267771,size.height*0.2175896);
//     path_0.cubicTo(size.width*0.3038850,size.height*0.2518500,size.width*0.2916667,size.height*0.2921292,size.width*0.2916667,size.height*0.3333333);
//     path_0.cubicTo(size.width*0.2916667,size.height*0.3885871,size.width*0.3136158,size.height*0.4415792,size.width*0.3526863,size.height*0.4806458);
//     path_0.cubicTo(size.width*0.3917563,size.height*0.5197167,size.width*0.4447458,size.height*0.5416667,size.width*0.5000000,size.height*0.5416667);
//     path_0.close();
//     path_0.moveTo(size.width*0.5000000,size.height*0.2083333);
//     path_0.cubicTo(size.width*0.5247208,size.height*0.2083333,size.width*0.5488917,size.height*0.2156646,size.width*0.5694458,size.height*0.2293996);
//     path_0.cubicTo(size.width*0.5900042,size.height*0.2431350,size.width*0.6060250,size.height*0.2626571,size.width*0.6154833,size.height*0.2854979);
//     path_0.cubicTo(size.width*0.6249458,size.height*0.3083387,size.width*0.6274208,size.height*0.3334721,size.width*0.6226000,size.height*0.3577196);
//     path_0.cubicTo(size.width*0.6177750,size.height*0.3819675,size.width*0.6058708,size.height*0.4042404,size.width*0.5883875,size.height*0.4217208);
//     path_0.cubicTo(size.width*0.5709083,size.height*0.4392042,size.width*0.5486333,size.height*0.4511083,size.width*0.5243875,size.height*0.4559333);
//     path_0.cubicTo(size.width*0.5001375,size.height*0.4607542,size.width*0.4750042,size.height*0.4582792,size.width*0.4521625,size.height*0.4488167);
//     path_0.cubicTo(size.width*0.4293250,size.height*0.4393583,size.width*0.4098017,size.height*0.4233375,size.width*0.3960663,size.height*0.4027796);
//     path_0.cubicTo(size.width*0.3823313,size.height*0.3822238,size.width*0.3750000,size.height*0.3580562,size.width*0.3750000,size.height*0.3333333);
//     path_0.cubicTo(size.width*0.3750000,size.height*0.3001813,size.width*0.3881696,size.height*0.2683871,size.width*0.4116117,size.height*0.2449450);
//     path_0.cubicTo(size.width*0.4350542,size.height*0.2215029,size.width*0.4668500,size.height*0.2083333,size.width*0.5000000,size.height*0.2083333);
//     path_0.close();
//     path_0.moveTo(size.width*0.7916667,size.height*0.7500000);
//     path_0.lineTo(size.width*0.7916667,size.height*0.8333333);
//     path_0.cubicTo(size.width*0.7916667,size.height*0.8443833,size.width*0.7872750,size.height*0.8549833,size.width*0.7794625,size.height*0.8627958);
//     path_0.cubicTo(size.width*0.7716500,size.height*0.8706083,size.width*0.7610500,size.height*0.8750000,size.width*0.7500000,size.height*0.8750000);
//     path_0.cubicTo(size.width*0.7389500,size.height*0.8750000,size.width*0.7283500,size.height*0.8706083,size.width*0.7205375,size.height*0.8627958);
//     path_0.cubicTo(size.width*0.7127250,size.height*0.8549833,size.width*0.7083333,size.height*0.8443833,size.width*0.7083333,size.height*0.8333333);
//     path_0.lineTo(size.width*0.7083333,size.height*0.7500000);
//     path_0.cubicTo(size.width*0.7083333,size.height*0.7389500,size.width*0.7039417,size.height*0.7283500,size.width*0.6961292,size.height*0.7205375);
//     path_0.cubicTo(size.width*0.6883167,size.height*0.7127250,size.width*0.6777167,size.height*0.7083333,size.width*0.6666667,size.height*0.7083333);
//     path_0.lineTo(size.width*0.3333333,size.height*0.7083333);
//     path_0.cubicTo(size.width*0.3222825,size.height*0.7083333,size.width*0.3116846,size.height*0.7127250,size.width*0.3038704,size.height*0.7205375);
//     path_0.cubicTo(size.width*0.2960567,size.height*0.7283500,size.width*0.2916667,size.height*0.7389500,size.width*0.2916667,size.height*0.7500000);
//     path_0.lineTo(size.width*0.2916667,size.height*0.8333333);
//     path_0.cubicTo(size.width*0.2916667,size.height*0.8443833,size.width*0.2872767,size.height*0.8549833,size.width*0.2794629,size.height*0.8627958);
//     path_0.cubicTo(size.width*0.2716487,size.height*0.8706083,size.width*0.2610508,size.height*0.8750000,size.width*0.2500000,size.height*0.8750000);
//     path_0.cubicTo(size.width*0.2389492,size.height*0.8750000,size.width*0.2283513,size.height*0.8706083,size.width*0.2205371,size.height*0.8627958);
//     path_0.cubicTo(size.width*0.2127233,size.height*0.8549833,size.width*0.2083333,size.height*0.8443833,size.width*0.2083333,size.height*0.8333333);
//     path_0.lineTo(size.width*0.2083333,size.height*0.7500000);
//     path_0.cubicTo(size.width*0.2083333,size.height*0.7168500,size.width*0.2215029,size.height*0.6850542,size.width*0.2449450,size.height*0.6616125);
//     path_0.cubicTo(size.width*0.2683871,size.height*0.6381708,size.width*0.3001813,size.height*0.6250000,size.width*0.3333333,size.height*0.6250000);
//     path_0.lineTo(size.width*0.6666667,size.height*0.6250000);
//     path_0.cubicTo(size.width*0.6998167,size.height*0.6250000,size.width*0.7316125,size.height*0.6381708,size.width*0.7550542,size.height*0.6616125);
//     path_0.cubicTo(size.width*0.7784958,size.height*0.6850542,size.width*0.7916667,size.height*0.7168500,size.width*0.7916667,size.height*0.7500000);
//     path_0.close();
//
//     Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
//     paint_0_fill.color = Color(0xff222221).withOpacity(1.0);
//     canvas.drawPath(path_0,paint_0_fill);
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
class Person extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.2916667,size.height*0.5416667);
    path_0.cubicTo(size.width*0.3246304,size.height*0.5416667,size.width*0.3568533,size.height*0.5318917,size.width*0.3842617,size.height*0.5135792);
    path_0.cubicTo(size.width*0.4116700,size.height*0.4952667,size.width*0.4330333,size.height*0.4692333,size.width*0.4456458,size.height*0.4387792);
    path_0.cubicTo(size.width*0.4582625,size.height*0.4083263,size.width*0.4615625,size.height*0.3748150,size.width*0.4551292,size.height*0.3424850);
    path_0.cubicTo(size.width*0.4487000,size.height*0.3101550,size.width*0.4328250,size.height*0.2804575,size.width*0.4095179,size.height*0.2571487);
    path_0.cubicTo(size.width*0.3862092,size.height*0.2338400,size.width*0.3565121,size.height*0.2179667,size.width*0.3241817,size.height*0.2115358);
    path_0.cubicTo(size.width*0.2918517,size.height*0.2051050,size.width*0.2583404,size.height*0.2084054,size.width*0.2278862,size.height*0.2210200);
    path_0.cubicTo(size.width*0.1974317,size.height*0.2336346,size.width*0.1714021,size.height*0.2549967,size.width*0.1530883,size.height*0.2824050);
    path_0.cubicTo(size.width*0.1347750,size.height*0.3098133,size.width*0.1250000,size.height*0.3420367,size.width*0.1250000,size.height*0.3750000);
    path_0.cubicTo(size.width*0.1250000,size.height*0.4192042,size.width*0.1425596,size.height*0.4615958,size.width*0.1738154,size.height*0.4928500);
    path_0.cubicTo(size.width*0.2050717,size.height*0.5241083,size.width*0.2474637,size.height*0.5416667,size.width*0.2916667,size.height*0.5416667);
    path_0.close();
    path_0.moveTo(size.width*0.2916667,size.height*0.2916667);
    path_0.cubicTo(size.width*0.3081483,size.height*0.2916667,size.width*0.3242600,size.height*0.2965542,size.width*0.3379642,size.height*0.3057108);
    path_0.cubicTo(size.width*0.3516683,size.height*0.3148679,size.width*0.3623492,size.height*0.3278825,size.width*0.3686567,size.height*0.3431100);
    path_0.cubicTo(size.width*0.3749637,size.height*0.3583371,size.width*0.3766142,size.height*0.3750925,size.width*0.3733988,size.height*0.3912575);
    path_0.cubicTo(size.width*0.3701833,size.height*0.4074225,size.width*0.3622467,size.height*0.4222708,size.width*0.3505921,size.height*0.4339250);
    path_0.cubicTo(size.width*0.3389379,size.height*0.4455792,size.width*0.3240892,size.height*0.4535167,size.width*0.3079242,size.height*0.4567333);
    path_0.cubicTo(size.width*0.2917592,size.height*0.4599458,size.width*0.2750037,size.height*0.4582958,size.width*0.2597762,size.height*0.4519917);
    path_0.cubicTo(size.width*0.2445492,size.height*0.4456833,size.width*0.2315342,size.height*0.4350000,size.width*0.2223775,size.height*0.4212958);
    path_0.cubicTo(size.width*0.2132208,size.height*0.4075933,size.width*0.2083333,size.height*0.3914817,size.width*0.2083333,size.height*0.3750000);
    path_0.cubicTo(size.width*0.2083333,size.height*0.3528987,size.width*0.2171129,size.height*0.3317025,size.width*0.2327413,size.height*0.3160746);
    path_0.cubicTo(size.width*0.2483692,size.height*0.3004467,size.width*0.2695654,size.height*0.2916667,size.width*0.2916667,size.height*0.2916667);
    path_0.close();
    path_0.moveTo(size.width*0.5000000,size.height*0.7083333);
    path_0.lineTo(size.width*0.5000000,size.height*0.7916667);
    path_0.cubicTo(size.width*0.5000000,size.height*0.8027167,size.width*0.4956083,size.height*0.8133167,size.width*0.4877958,size.height*0.8211292);
    path_0.cubicTo(size.width*0.4799833,size.height*0.8289417,size.width*0.4693833,size.height*0.8333333,size.width*0.4583333,size.height*0.8333333);
    path_0.cubicTo(size.width*0.4472833,size.height*0.8333333,size.width*0.4366833,size.height*0.8289417,size.width*0.4288708,size.height*0.8211292);
    path_0.cubicTo(size.width*0.4210583,size.height*0.8133167,size.width*0.4166667,size.height*0.8027167,size.width*0.4166667,size.height*0.7916667);
    path_0.lineTo(size.width*0.4166667,size.height*0.7083333);
    path_0.cubicTo(size.width*0.4166667,size.height*0.6972833,size.width*0.4122767,size.height*0.6866833,size.width*0.4044629,size.height*0.6788708);
    path_0.cubicTo(size.width*0.3966487,size.height*0.6710583,size.width*0.3860508,size.height*0.6666667,size.width*0.3750000,size.height*0.6666667);
    path_0.lineTo(size.width*0.2083333,size.height*0.6666667);
    path_0.cubicTo(size.width*0.1972825,size.height*0.6666667,size.width*0.1866846,size.height*0.6710583,size.width*0.1788704,size.height*0.6788708);
    path_0.cubicTo(size.width*0.1710567,size.height*0.6866833,size.width*0.1666667,size.height*0.6972833,size.width*0.1666667,size.height*0.7083333);
    path_0.lineTo(size.width*0.1666667,size.height*0.7916667);
    path_0.cubicTo(size.width*0.1666667,size.height*0.8027167,size.width*0.1622767,size.height*0.8133167,size.width*0.1544629,size.height*0.8211292);
    path_0.cubicTo(size.width*0.1466487,size.height*0.8289417,size.width*0.1360508,size.height*0.8333333,size.width*0.1250000,size.height*0.8333333);
    path_0.cubicTo(size.width*0.1139492,size.height*0.8333333,size.width*0.1033513,size.height*0.8289417,size.width*0.09553708,size.height*0.8211292);
    path_0.cubicTo(size.width*0.08772333,size.height*0.8133167,size.width*0.08333333,size.height*0.8027167,size.width*0.08333333,size.height*0.7916667);
    path_0.lineTo(size.width*0.08333333,size.height*0.7083333);
    path_0.cubicTo(size.width*0.08333333,size.height*0.6751833,size.width*0.09650292,size.height*0.6433875,size.width*0.1199450,size.height*0.6199458);
    path_0.cubicTo(size.width*0.1433871,size.height*0.5965042,size.width*0.1751812,size.height*0.5833333,size.width*0.2083333,size.height*0.5833333);
    path_0.lineTo(size.width*0.3750000,size.height*0.5833333);
    path_0.cubicTo(size.width*0.4081521,size.height*0.5833333,size.width*0.4399458,size.height*0.5965042,size.width*0.4633875,size.height*0.6199458);
    path_0.cubicTo(size.width*0.4868292,size.height*0.6433875,size.width*0.5000000,size.height*0.6751833,size.width*0.5000000,size.height*0.7083333);
    path_0.close();
    path_0.moveTo(size.width*0.7083333,size.height*0.4583333);
    path_0.cubicTo(size.width*0.7412958,size.height*0.4583333,size.width*0.7735208,size.height*0.4485583,size.width*0.8009292,size.height*0.4302458);
    path_0.cubicTo(size.width*0.8283375,size.height*0.4119313,size.width*0.8497000,size.height*0.3859017,size.width*0.8623125,size.height*0.3554475);
    path_0.cubicTo(size.width*0.8749292,size.height*0.3249929,size.width*0.8782292,size.height*0.2914817,size.width*0.8717958,size.height*0.2591517);
    path_0.cubicTo(size.width*0.8653667,size.height*0.2268217,size.width*0.8494917,size.height*0.1971242,size.width*0.8261833,size.height*0.1738154);
    path_0.cubicTo(size.width*0.8028750,size.height*0.1505067,size.width*0.7731792,size.height*0.1346333,size.width*0.7408500,size.height*0.1282025);
    path_0.cubicTo(size.width*0.7085167,size.height*0.1217717,size.width*0.6750083,size.height*0.1250721,size.width*0.6445542,size.height*0.1376867);
    path_0.cubicTo(size.width*0.6141000,size.height*0.1503012,size.width*0.5880667,size.height*0.1716633,size.width*0.5697542,size.height*0.1990717);
    path_0.cubicTo(size.width*0.5514417,size.height*0.2264800,size.width*0.5416667,size.height*0.2587033,size.width*0.5416667,size.height*0.2916667);
    path_0.cubicTo(size.width*0.5416667,size.height*0.3358696,size.width*0.5592250,size.height*0.3782617,size.width*0.5904833,size.height*0.4095179);
    path_0.cubicTo(size.width*0.6217375,size.height*0.4407750,size.width*0.6641292,size.height*0.4583333,size.width*0.7083333,size.height*0.4583333);
    path_0.close();
    path_0.moveTo(size.width*0.7083333,size.height*0.2083333);
    path_0.cubicTo(size.width*0.7248167,size.height*0.2083333,size.width*0.7409250,size.height*0.2132208,size.width*0.7546292,size.height*0.2223775);
    path_0.cubicTo(size.width*0.7683333,size.height*0.2315346,size.width*0.7790167,size.height*0.2445492,size.width*0.7853250,size.height*0.2597762);
    path_0.cubicTo(size.width*0.7916292,size.height*0.2750037,size.width*0.7932792,size.height*0.2917592,size.width*0.7900667,size.height*0.3079242);
    path_0.cubicTo(size.width*0.7868500,size.height*0.3240892,size.width*0.7789125,size.height*0.3389379,size.width*0.7672583,size.height*0.3505925);
    path_0.cubicTo(size.width*0.7556042,size.height*0.3622467,size.width*0.7407542,size.height*0.3701833,size.width*0.7245917,size.height*0.3733988);
    path_0.cubicTo(size.width*0.7084250,size.height*0.3766142,size.width*0.6916708,size.height*0.3749642,size.width*0.6764417,size.height*0.3686567);
    path_0.cubicTo(size.width*0.6612167,size.height*0.3623496,size.width*0.6482000,size.height*0.3516683,size.width*0.6390458,size.height*0.3379642);
    path_0.cubicTo(size.width*0.6298875,size.height*0.3242600,size.width*0.6250000,size.height*0.3081483,size.width*0.6250000,size.height*0.2916667);
    path_0.cubicTo(size.width*0.6250000,size.height*0.2695654,size.width*0.6337792,size.height*0.2483692,size.width*0.6494083,size.height*0.2327413);
    path_0.cubicTo(size.width*0.6650375,size.height*0.2171133,size.width*0.6862333,size.height*0.2083333,size.width*0.7083333,size.height*0.2083333);
    path_0.close();
    path_0.moveTo(size.width*0.9166667,size.height*0.6250000);
    path_0.lineTo(size.width*0.9166667,size.height*0.7083333);
    path_0.cubicTo(size.width*0.9166667,size.height*0.7193833,size.width*0.9122750,size.height*0.7299833,size.width*0.9044625,size.height*0.7377958);
    path_0.cubicTo(size.width*0.8966500,size.height*0.7456083,size.width*0.8860500,size.height*0.7500000,size.width*0.8750000,size.height*0.7500000);
    path_0.cubicTo(size.width*0.8639500,size.height*0.7500000,size.width*0.8533500,size.height*0.7456083,size.width*0.8455375,size.height*0.7377958);
    path_0.cubicTo(size.width*0.8377250,size.height*0.7299833,size.width*0.8333333,size.height*0.7193833,size.width*0.8333333,size.height*0.7083333);
    path_0.lineTo(size.width*0.8333333,size.height*0.6250000);
    path_0.cubicTo(size.width*0.8333333,size.height*0.6139500,size.width*0.8289417,size.height*0.6033500,size.width*0.8211292,size.height*0.5955375);
    path_0.cubicTo(size.width*0.8133167,size.height*0.5877250,size.width*0.8027167,size.height*0.5833333,size.width*0.7916667,size.height*0.5833333);
    path_0.lineTo(size.width*0.6250000,size.height*0.5833333);
    path_0.cubicTo(size.width*0.6178417,size.height*0.5833542,size.width*0.6108125,size.height*0.5852208,size.width*0.6045833,size.height*0.5887500);
    path_0.cubicTo(size.width*0.5974792,size.height*0.5926958,size.width*0.5916875,size.height*0.5986375,size.width*0.5879167,size.height*0.6058333);
    path_0.cubicTo(size.width*0.5854500,size.height*0.6108083,size.width*0.5820125,size.height*0.6152417,size.width*0.5778083,size.height*0.6188708);
    path_0.cubicTo(size.width*0.5736042,size.height*0.6225000,size.width*0.5687125,size.height*0.6252500,size.width*0.5634292,size.height*0.6269625);
    path_0.cubicTo(size.width*0.5581458,size.height*0.6286750,size.width*0.5525750,size.height*0.6293125,size.width*0.5470417,size.height*0.6288375);
    path_0.cubicTo(size.width*0.5415083,size.height*0.6283667,size.width*0.5361250,size.height*0.6267917,size.width*0.5312083,size.height*0.6242083);
    path_0.cubicTo(size.width*0.5262917,size.height*0.6216250,size.width*0.5219417,size.height*0.6180833,size.width*0.5184125,size.height*0.6137958);
    path_0.cubicTo(size.width*0.5148833,size.height*0.6095083,size.width*0.5122458,size.height*0.6045542,size.width*0.5106583,size.height*0.5992333);
    path_0.cubicTo(size.width*0.5090708,size.height*0.5939125,size.width*0.5085625,size.height*0.5883250,size.width*0.5091667,size.height*0.5828042);
    path_0.cubicTo(size.width*0.5097667,size.height*0.5772833,size.width*0.5114708,size.height*0.5719375,size.width*0.5141667,size.height*0.5670833);
    path_0.cubicTo(size.width*0.5254833,size.height*0.5456333,size.width*0.5426833,size.height*0.5278542,size.width*0.5637500,size.height*0.5158333);
    path_0.cubicTo(size.width*0.5824708,size.height*0.5053917,size.width*0.6035625,size.height*0.4999375,size.width*0.6250000,size.height*0.5000000);
    path_0.lineTo(size.width*0.7916667,size.height*0.5000000);
    path_0.cubicTo(size.width*0.8248167,size.height*0.5000000,size.width*0.8566125,size.height*0.5131708,size.width*0.8800542,size.height*0.5366125);
    path_0.cubicTo(size.width*0.9034958,size.height*0.5600542,size.width*0.9166667,size.height*0.5918500,size.width*0.9166667,size.height*0.6250000);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff222221).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class AddEvent extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.5418375,size.height*0.7946292);
    path_0.cubicTo(size.width*0.5418375,size.height*0.8057250,size.width*0.5374292,size.height*0.8163667,size.width*0.5295833,size.height*0.8242125);
    path_0.cubicTo(size.width*0.5217375,size.height*0.8320583,size.width*0.5110958,size.height*0.8364667,size.width*0.5000000,size.height*0.8364667);
    path_0.cubicTo(size.width*0.4889042,size.height*0.8364667,size.width*0.4782625,size.height*0.8320583,size.width*0.4704167,size.height*0.8242125);
    path_0.cubicTo(size.width*0.4625708,size.height*0.8163667,size.width*0.4581625,size.height*0.8057250,size.width*0.4581625,size.height*0.7946292);
    path_0.lineTo(size.width*0.4584583,size.height*0.5415417);
    path_0.lineTo(size.width*0.2053721,size.height*0.5418375);
    path_0.cubicTo(size.width*0.1942763,size.height*0.5418375,size.width*0.1836350,size.height*0.5374292,size.width*0.1757888,size.height*0.5295833);
    path_0.cubicTo(size.width*0.1679429,size.height*0.5217375,size.width*0.1635350,size.height*0.5110958,size.width*0.1635350,size.height*0.5000000);
    path_0.cubicTo(size.width*0.1635350,size.height*0.4889042,size.width*0.1679429,size.height*0.4782625,size.width*0.1757888,size.height*0.4704167);
    path_0.cubicTo(size.width*0.1836350,size.height*0.4625708,size.width*0.1942763,size.height*0.4581625,size.width*0.2053721,size.height*0.4581625);
    path_0.lineTo(size.width*0.4584583,size.height*0.4584583);
    path_0.lineTo(size.width*0.4581625,size.height*0.2053721);
    path_0.cubicTo(size.width*0.4581625,size.height*0.1942763,size.width*0.4625708,size.height*0.1836350,size.width*0.4704167,size.height*0.1757888);
    path_0.cubicTo(size.width*0.4782625,size.height*0.1679429,size.width*0.4889042,size.height*0.1635350,size.width*0.5000000,size.height*0.1635350);
    path_0.cubicTo(size.width*0.5110958,size.height*0.1635350,size.width*0.5217375,size.height*0.1679429,size.width*0.5295833,size.height*0.1757888);
    path_0.cubicTo(size.width*0.5374292,size.height*0.1836350,size.width*0.5418375,size.height*0.1942763,size.width*0.5418375,size.height*0.2053721);
    path_0.lineTo(size.width*0.5415417,size.height*0.4584583);
    path_0.lineTo(size.width*0.7946292,size.height*0.4581625);
    path_0.cubicTo(size.width*0.8057250,size.height*0.4581625,size.width*0.8163667,size.height*0.4625708,size.width*0.8242125,size.height*0.4704167);
    path_0.cubicTo(size.width*0.8320583,size.height*0.4782625,size.width*0.8364667,size.height*0.4889042,size.width*0.8364667,size.height*0.5000000);
    path_0.cubicTo(size.width*0.8364667,size.height*0.5110958,size.width*0.8320583,size.height*0.5217375,size.width*0.8242125,size.height*0.5295833);
    path_0.cubicTo(size.width*0.8163667,size.height*0.5374292,size.width*0.8057250,size.height*0.5418375,size.width*0.7946292,size.height*0.5418375);
    path_0.lineTo(size.width*0.5415417,size.height*0.5415417);
    path_0.lineTo(size.width*0.5418375,size.height*0.7946292);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff222221).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class EditPen extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.8037500,size.height*0.2033333);
    path_0.lineTo(size.width*0.7966667,size.height*0.1962500);
    path_0.cubicTo(size.width*0.7732292,size.height*0.1728417,size.width*0.7414583,size.height*0.1596933,size.width*0.7083333,size.height*0.1596933);
    path_0.cubicTo(size.width*0.6752083,size.height*0.1596933,size.width*0.6434375,size.height*0.1728417,size.width*0.6200000,size.height*0.1962500);
    path_0.lineTo(size.width*0.2204167,size.height*0.5954167);
    path_0.cubicTo(size.width*0.2150875,size.height*0.6008333,size.width*0.2113413,size.height*0.6076083,size.width*0.2095833,size.height*0.6150000);
    path_0.lineTo(size.width*0.1679167,size.height*0.7816667);
    path_0.cubicTo(size.width*0.1659329,size.height*0.7887083,size.width*0.1658392,size.height*0.7961500,size.width*0.1676446,size.height*0.8032417);
    path_0.cubicTo(size.width*0.1694500,size.height*0.8103333,size.width*0.1730913,size.height*0.8168250,size.width*0.1782017,size.height*0.8220625);
    path_0.cubicTo(size.width*0.1833121,size.height*0.8273000,size.width*0.1897121,size.height*0.8311000,size.width*0.1967567,size.height*0.8330792);
    path_0.cubicTo(size.width*0.2038017,size.height*0.8350542,size.width*0.2112433,size.height*0.8351458,size.width*0.2183333,size.height*0.8333333);
    path_0.lineTo(size.width*0.3850000,size.height*0.7916667);
    path_0.cubicTo(size.width*0.3923938,size.height*0.7899083,size.width*0.3991658,size.height*0.7861625,size.width*0.4045833,size.height*0.7808333);
    path_0.lineTo(size.width*0.8037500,size.height*0.3812500);
    path_0.cubicTo(size.width*0.8271583,size.height*0.3578125,size.width*0.8403083,size.height*0.3260417,size.width*0.8403083,size.height*0.2929167);
    path_0.cubicTo(size.width*0.8403083,size.height*0.2597917,size.width*0.8271583,size.height*0.2280208,size.width*0.8037500,size.height*0.2045833);
    path_0.lineTo(size.width*0.8037500,size.height*0.2033333);
    path_0.close();
    path_0.moveTo(size.width*0.3537500,size.height*0.7125000);
    path_0.lineTo(size.width*0.2654167,size.height*0.7345833);
    path_0.lineTo(size.width*0.2875000,size.height*0.6462500);
    path_0.lineTo(size.width*0.5616667,size.height*0.3720833);
    path_0.lineTo(size.width*0.6279167,size.height*0.4383333);
    path_0.lineTo(size.width*0.3537500,size.height*0.7125000);
    path_0.close();
    path_0.moveTo(size.width*0.7450000,size.height*0.3212500);
    path_0.lineTo(size.width*0.6866667,size.height*0.3791667);
    path_0.lineTo(size.width*0.6208333,size.height*0.3133333);
    path_0.lineTo(size.width*0.6787500,size.height*0.2550000);
    path_0.cubicTo(size.width*0.6826250,size.height*0.2510946,size.width*0.6872333,size.height*0.2479950,size.width*0.6923083,size.height*0.2458796);
    path_0.cubicTo(size.width*0.6973875,size.height*0.2437642,size.width*0.7028333,size.height*0.2426750,size.width*0.7083333,size.height*0.2426750);
    path_0.cubicTo(size.width*0.7138333,size.height*0.2426750,size.width*0.7192792,size.height*0.2437642,size.width*0.7243583,size.height*0.2458796);
    path_0.cubicTo(size.width*0.7294333,size.height*0.2479950,size.width*0.7340417,size.height*0.2510946,size.width*0.7379167,size.height*0.2550000);
    path_0.lineTo(size.width*0.7450000,size.height*0.2620833);
    path_0.cubicTo(size.width*0.7489042,size.height*0.2659567,size.width*0.7520042,size.height*0.2705654,size.width*0.7541208,size.height*0.2756425);
    path_0.cubicTo(size.width*0.7562375,size.height*0.2807200,size.width*0.7573250,size.height*0.2861663,size.width*0.7573250,size.height*0.2916667);
    path_0.cubicTo(size.width*0.7573250,size.height*0.2971671,size.width*0.7562375,size.height*0.3026133,size.width*0.7541208,size.height*0.3076908);
    path_0.cubicTo(size.width*0.7520042,size.height*0.3127683,size.width*0.7489042,size.height*0.3173767,size.width*0.7450000,size.height*0.3212500);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff222221).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class EditPass extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.8400000,size.height*0.7358333);
    path_0.cubicTo(size.width*0.8399542,size.height*0.7564292,size.width*0.8338083,size.height*0.7765458,size.width*0.8223333,size.height*0.7936458);
    path_0.cubicTo(size.width*0.8108583,size.height*0.8107458,size.width*0.7945708,size.height*0.8240625,size.width*0.7755292,size.height*0.8319083);
    path_0.cubicTo(size.width*0.7564917,size.height*0.8397583,size.width*0.7355500,size.height*0.8417875,size.width*0.7153583,size.height*0.8377375);
    path_0.cubicTo(size.width*0.6951667,size.height*0.8336875,size.width*0.6766292,size.height*0.8237458,size.width*0.6620833,size.height*0.8091667);
    path_0.lineTo(size.width*0.4245833,size.height*0.5720833);
    path_0.cubicTo(size.width*0.4018367,size.height*0.5794583,size.width*0.3780812,size.height*0.5832542,size.width*0.3541679,size.height*0.5833333);
    path_0.cubicTo(size.width*0.3413129,size.height*0.5834458,size.width*0.3284767,size.height*0.5823292,size.width*0.3158346,size.height*0.5800000);
    path_0.cubicTo(size.width*0.2706004,size.height*0.5725375,size.width*0.2286683,size.height*0.5516042,size.width*0.1955158,size.height*0.5199375);
    path_0.cubicTo(size.width*0.1623633,size.height*0.4882708,size.width*0.1395308,size.height*0.4473458,size.width*0.1300012,size.height*0.4025000);
    path_0.cubicTo(size.width*0.1266629,size.height*0.3866058,size.width*0.1249871,size.height*0.3704075,size.width*0.1250013,size.height*0.3541667);
    path_0.cubicTo(size.width*0.1246813,size.height*0.3179708,size.width*0.1331150,size.height*0.2822338,size.width*0.1495846,size.height*0.2500000);
    path_0.cubicTo(size.width*0.1525192,size.height*0.2441154,size.width*0.1568054,size.height*0.2390092,size.width*0.1620917,size.height*0.2350987);
    path_0.cubicTo(size.width*0.1673783,size.height*0.2311879,size.width*0.1735154,size.height*0.2285842,size.width*0.1800013,size.height*0.2275000);
    path_0.cubicTo(size.width*0.1865358,size.height*0.2264238,size.width*0.1932329,size.height*0.2269208,size.width*0.1995371,size.height*0.2289496);
    path_0.cubicTo(size.width*0.2058413,size.height*0.2309788,size.width*0.2115708,size.height*0.2344813,size.width*0.2162513,size.height*0.2391667);
    path_0.lineTo(size.width*0.3212512,size.height*0.3454167);
    path_0.cubicTo(size.width*0.3228375,size.height*0.3470042,size.width*0.3247213,size.height*0.3482633,size.width*0.3267946,size.height*0.3491225);
    path_0.cubicTo(size.width*0.3288679,size.height*0.3499817,size.width*0.3310900,size.height*0.3504238,size.width*0.3333346,size.height*0.3504238);
    path_0.cubicTo(size.width*0.3355788,size.height*0.3504238,size.width*0.3378008,size.height*0.3499817,size.width*0.3398742,size.height*0.3491225);
    path_0.cubicTo(size.width*0.3419475,size.height*0.3482633,size.width*0.3438313,size.height*0.3470042,size.width*0.3454179,size.height*0.3454167);
    path_0.cubicTo(size.width*0.3470050,size.height*0.3438300,size.width*0.3482646,size.height*0.3419467,size.width*0.3491238,size.height*0.3398733);
    path_0.cubicTo(size.width*0.3499829,size.height*0.3378000,size.width*0.3504250,size.height*0.3355775,size.width*0.3504250,size.height*0.3333333);
    path_0.cubicTo(size.width*0.3504250,size.height*0.3310892,size.width*0.3499829,size.height*0.3288667,size.width*0.3491238,size.height*0.3267933);
    path_0.cubicTo(size.width*0.3482646,size.height*0.3247200,size.width*0.3470050,size.height*0.3228367,size.width*0.3454179,size.height*0.3212500);
    path_0.lineTo(size.width*0.2404179,size.height*0.2162500);
    path_0.cubicTo(size.width*0.2357321,size.height*0.2115696,size.width*0.2322300,size.height*0.2058400,size.width*0.2302008,size.height*0.1995358);
    path_0.cubicTo(size.width*0.2281721,size.height*0.1932317,size.width*0.2276750,size.height*0.1865346,size.width*0.2287512,size.height*0.1800000);
    path_0.cubicTo(size.width*0.2297025,size.height*0.1736329,size.width*0.2321167,size.height*0.1675729,size.width*0.2358033,size.height*0.1622958);
    path_0.cubicTo(size.width*0.2394904,size.height*0.1570183,size.width*0.2443500,size.height*0.1526671,size.width*0.2500013,size.height*0.1495833);
    path_0.cubicTo(size.width*0.2585808,size.height*0.1450225,size.width*0.2674954,size.height*0.1411225,size.width*0.2766679,size.height*0.1379167);
    path_0.cubicTo(size.width*0.3015733,size.height*0.1292142,size.width*0.3277863,size.height*0.1248450,size.width*0.3541679,size.height*0.1250000);
    path_0.cubicTo(size.width*0.3681213,size.height*0.1250492,size.width*0.3820508,size.height*0.1261633,size.width*0.3958346,size.height*0.1283333);
    path_0.cubicTo(size.width*0.4424458,size.height*0.1369625,size.width*0.4852583,size.height*0.1597575,size.width*0.5184417,size.height*0.1936100);
    path_0.cubicTo(size.width*0.5516250,size.height*0.2274629,size.width*0.5735583,size.height*0.2707258,size.width*0.5812500,size.height*0.3175000);
    path_0.cubicTo(size.width*0.5829792,size.height*0.3296417,size.width*0.5836750,size.height*0.3419075,size.width*0.5833333,size.height*0.3541667);
    path_0.cubicTo(size.width*0.5832542,size.height*0.3780800,size.width*0.5794583,size.height*0.4018354,size.width*0.5720833,size.height*0.4245833);
    path_0.lineTo(size.width*0.8091667,size.height*0.6620833);
    path_0.cubicTo(size.width*0.8189458,size.height*0.6717125,size.width*0.8267125,size.height*0.6831917,size.width*0.8320042,size.height*0.6958542);
    path_0.cubicTo(size.width*0.8373000,size.height*0.7085167,size.width*0.8400167,size.height*0.7221083,size.width*0.8400000,size.height*0.7358333);
    path_0.close();
    path_0.moveTo(size.width*0.7566667,size.height*0.7358333);
    path_0.cubicTo(size.width*0.7566083,size.height*0.7330167,size.width*0.7559875,size.height*0.7302375,size.width*0.7548417,size.height*0.7276625);
    path_0.cubicTo(size.width*0.7536958,size.height*0.7250875,size.width*0.7520500,size.height*0.7227667,size.width*0.7500000,size.height*0.7208333);
    path_0.lineTo(size.width*0.5000000,size.height*0.4708333);
    path_0.lineTo(size.width*0.5000000,size.height*0.4683333);
    path_0.lineTo(size.width*0.4912500,size.height*0.4583333);
    path_0.cubicTo(size.width*0.4868042,size.height*0.4524500,size.width*0.4840000,size.height*0.4454958,size.width*0.4831208,size.height*0.4381750);
    path_0.cubicTo(size.width*0.4822458,size.height*0.4308542,size.width*0.4833250,size.height*0.4234333,size.width*0.4862500,size.height*0.4166667);
    path_0.cubicTo(size.width*0.4954167,size.height*0.3971129,size.width*0.5001167,size.height*0.3757625,size.width*0.5000000,size.height*0.3541667);
    path_0.cubicTo(size.width*0.5008250,size.height*0.3462713,size.width*0.5008250,size.height*0.3383121,size.width*0.5000000,size.height*0.3304167);
    path_0.cubicTo(size.width*0.4950250,size.height*0.3005042,size.width*0.4808208,size.height*0.2728958,size.width*0.4593792,size.height*0.2514537);
    path_0.cubicTo(size.width*0.4379375,size.height*0.2300117,size.width*0.4103304,size.height*0.2158092,size.width*0.3804179,size.height*0.2108333);
    path_0.cubicTo(size.width*0.3717658,size.height*0.2091758,size.width*0.3629771,size.height*0.2083388,size.width*0.3541679,size.height*0.2083333);
    path_0.lineTo(size.width*0.3508346,size.height*0.2083333);
    path_0.lineTo(size.width*0.4045846,size.height*0.2625000);
    path_0.cubicTo(size.width*0.4139571,size.height*0.2717621,size.width*0.4214000,size.height*0.2827921,size.width*0.4264792,size.height*0.2949512);
    path_0.cubicTo(size.width*0.4315583,size.height*0.3071100,size.width*0.4341708,size.height*0.3201562,size.width*0.4341708,size.height*0.3333333);
    path_0.cubicTo(size.width*0.4341708,size.height*0.3465104,size.width*0.4315583,size.height*0.3595567,size.width*0.4264792,size.height*0.3717154);
    path_0.cubicTo(size.width*0.4214000,size.height*0.3838746,size.width*0.4139571,size.height*0.3949046,size.width*0.4045846,size.height*0.4041667);
    path_0.cubicTo(size.width*0.3855725,size.height*0.4228458,size.width*0.3599863,size.height*0.4333125,size.width*0.3333346,size.height*0.4333125);
    path_0.cubicTo(size.width*0.3066825,size.height*0.4333125,size.width*0.2810962,size.height*0.4228458,size.width*0.2620846,size.height*0.4041667);
    path_0.lineTo(size.width*0.2083346,size.height*0.3508333);
    path_0.cubicTo(size.width*0.2083346,size.height*0.3508333,size.width*0.2083346,size.height*0.3529167,size.width*0.2083346,size.height*0.3541667);
    path_0.cubicTo(size.width*0.2082292,size.height*0.3646775,size.width*0.2093475,size.height*0.3751646,size.width*0.2116679,size.height*0.3854167);
    path_0.cubicTo(size.width*0.2174921,size.height*0.4141017,size.width*0.2318133,size.height*0.4403708,size.width*0.2527692,size.height*0.4608042);
    path_0.cubicTo(size.width*0.2737250,size.height*0.4812417,size.width*0.3003454,size.height*0.4949000,size.width*0.3291679,size.height*0.5000000);
    path_0.cubicTo(size.width*0.3374421,size.height*0.5012792,size.width*0.3457958,size.height*0.5019750,size.width*0.3541679,size.height*0.5020833);
    path_0.cubicTo(size.width*0.3759233,size.height*0.5015500,size.width*0.3972817,size.height*0.4961375,size.width*0.4166667,size.height*0.4862500);
    path_0.cubicTo(size.width*0.4234333,size.height*0.4833208,size.width*0.4308583,size.height*0.4822417,size.width*0.4381750,size.height*0.4831208);
    path_0.cubicTo(size.width*0.4454958,size.height*0.4840000,size.width*0.4524542,size.height*0.4868042,size.width*0.4583333,size.height*0.4912500);
    path_0.lineTo(size.width*0.4675000,size.height*0.4983333);
    path_0.lineTo(size.width*0.4712500,size.height*0.5016667);
    path_0.lineTo(size.width*0.7212500,size.height*0.7516667);
    path_0.cubicTo(size.width*0.7252250,size.height*0.7556542,size.width*0.7306208,size.height*0.7579042,size.width*0.7362500,size.height*0.7579167);
    path_0.cubicTo(size.width*0.7417417,size.height*0.7578083,size.width*0.7469792,size.height*0.7555792,size.width*0.7508625,size.height*0.7516958);
    path_0.cubicTo(size.width*0.7547500,size.height*0.7478125,size.width*0.7569792,size.height*0.7425750,size.width*0.7570833,size.height*0.7370833);
    path_0.lineTo(size.width*0.7566667,size.height*0.7358333);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff222221).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
// class Person extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//
//     Path path_0 = Path();
//     path_0.moveTo(size.width*0.8885821,size.height*0.2115842);
//     path_0.cubicTo(size.width*0.8885821,size.height*0.1813455,size.width*0.8701194,size.height*0.1568317,size.width*0.8473507,size.height*0.1568317);
//     path_0.cubicTo(size.width*0.8245821,size.height*0.1568317,size.width*0.8061194,size.height*0.1813455,size.width*0.8061194,size.height*0.2115842);
//     path_0.lineTo(size.width*0.8061194,size.height*0.4979208);
//     path_0.cubicTo(size.width*0.8061194,size.height*0.5281594,size.width*0.8245821,size.height*0.5526733,size.width*0.8473507,size.height*0.5526733);
//     path_0.cubicTo(size.width*0.8701194,size.height*0.5526733,size.width*0.8885821,size.height*0.5281594,size.width*0.8885821,size.height*0.4979208);
//     path_0.lineTo(size.width*0.8885821,size.height*0.2115842);
//     path_0.close();
//
//     Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
//     paint_0_fill.color = Colors.lightBlue;
//     canvas.drawPath(path_0,paint_0_fill);
//
//     Path path_1 = Path();
//     path_1.moveTo(size.width*0.9552985,size.height*0.4094059);
//     path_1.cubicTo(size.width*0.9780896,size.height*0.4094059,size.width*0.9965672,size.height*0.3849149,size.width*0.9965672,size.height*0.3547030);
//     path_1.cubicTo(size.width*0.9965672,size.height*0.3244911,size.width*0.9780896,size.height*0.3000000,size.width*0.9552985,size.height*0.3000000);
//     path_1.lineTo(size.width*0.7394776,size.height*0.3000000);
//     path_1.cubicTo(size.width*0.7166858,size.height*0.3000000,size.width*0.6982097,size.height*0.3244911,size.width*0.6982097,size.height*0.3547030);
//     path_1.cubicTo(size.width*0.6982097,size.height*0.3849149,size.width*0.7166858,size.height*0.4094059,size.width*0.7394776,size.height*0.4094059);
//     path_1.lineTo(size.width*0.9552985,size.height*0.4094059);
//     path_1.close();
//
//     Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
//     paint_1_fill.color = Colors.lightBlue.withOpacity(1.0);
//     canvas.drawPath(path_1,paint_1_fill);
//
//     Path path_2 = Path();
//     path_2.moveTo(size.width*0.3802239,size.height*0.4857426);
//     path_2.cubicTo(size.width*0.1920896,size.height*0.4857426,size.width*0.03596993,size.height*0.6700000,size.width*0.006417679,size.height*0.9114851);
//     path_2.cubicTo(size.width*0.005174507,size.height*0.9217663,size.width*0.005629761,size.height*0.9322832,size.width*0.007751791,size.height*0.9423069);
//     path_2.cubicTo(size.width*0.009873806,size.height*0.9523317,size.width*0.01361201,size.height*0.9616248,size.width*0.01870784,size.height*0.9695446);
//     path_2.cubicTo(size.width*0.02380366,size.height*0.9774634,size.width*0.03013522,size.height*0.9838188,size.width*0.03726478,size.height*0.9881713);
//     path_2.cubicTo(size.width*0.04439433,size.height*0.9925248,size.width*0.05215157,size.height*0.9947723,size.width*0.05999970,size.height*0.9947525);
//     path_2.lineTo(size.width*0.7004478,size.height*0.9947525);
//     path_2.cubicTo(size.width*0.7082978,size.height*0.9947624,size.width*0.7160575,size.height*0.9925248,size.width*0.7231896,size.height*0.9881693);
//     path_2.cubicTo(size.width*0.7303224,size.height*0.9838168,size.width*0.7366575,size.height*0.9774634,size.width*0.7417590,size.height*0.9695475);
//     path_2.cubicTo(size.width*0.7468582,size.height*0.9616307,size.width*0.7506045,size.height*0.9523386,size.width*0.7527388,size.height*0.9423149);
//     path_2.cubicTo(size.width*0.7548657,size.height*0.9322901,size.width*0.7553358,size.height*0.9217713,size.width*0.7541045,size.height*0.9114851);
//     path_2.cubicTo(size.width*0.7245522,size.height*0.6700000,size.width*0.5684328,size.height*0.4857426,size.width*0.3802239,size.height*0.4857426);
//     path_2.close();
//
//     Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
//     paint_2_fill.color = Colors.lightBlue.withOpacity(1.0);
//     canvas.drawPath(path_2,paint_2_fill);
//
//     Path path_3 = Path();
//     path_3.moveTo(size.width*0.3802239,size.height*0.6579208);
//     path_3.cubicTo(size.width*0.5153269,size.height*0.6579208,size.width*0.6248507,size.height*0.5126129,size.width*0.6248507,size.height*0.3333663);
//     path_3.cubicTo(size.width*0.6248507,size.height*0.1541198,size.width*0.5153269,size.height*0.008811871,size.width*0.3802239,size.height*0.008811871);
//     path_3.cubicTo(size.width*0.2451201,size.height*0.008811871,size.width*0.1355970,size.height*0.1541198,size.width*0.1355970,size.height*0.3333663);
//     path_3.cubicTo(size.width*0.1355970,size.height*0.5126129,size.width*0.2451201,size.height*0.6579208,size.width*0.3802239,size.height*0.6579208);
//     path_3.close();
//
//     Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
//     paint_3_fill.color = Color(0xFF0277BD);
//     canvas.drawPath(path_3,paint_3_fill);
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }