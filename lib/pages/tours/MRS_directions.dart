import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myfirstapp/utils/dimensions.dart';

import '../../widgets/IconAndTextWidget.dart';
class MRSDirections extends StatefulWidget {
  const MRSDirections({Key? key}) : super(key: key);

  @override
  State<MRSDirections> createState() => _MRSDirectionsState();
}

class _MRSDirectionsState extends State<MRSDirections> {


  PageController pageController= PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height =Dimensions.pageViewContainer;
  int noOfImages1=13;
  int noOfImages2=13;
  bool gate1=true;

  String g1= "lib/assets/gucguide/gate1.jpg";
  String g2= "lib/assets/gucguide/aftergate1.jpg";
  String g3="lib/assets/gucguide/basketballcourt.jpg";
  String g4="lib/assets/gucguide/stairs.jpg";
  String g5="lib/assets/gucguide/beforec.jpg";
  String g6="lib/assets/gucguide/c.jpg";
  String g7="lib/assets/gucguide/afterc.jpg";
  String g8="lib/assets/gucguide/beforeelevator.jpg";
  String g9="lib/assets/gucguide/elevator.jpg";
  String g10="lib/assets/gucguide/corridor1.jpg";
  String g11="lib/assets/gucguide/corridor2.jpg";
  String g12="lib/assets/gucguide/door1.jpg";
  String g13="lib/assets/gucguide/door2.jpg";


  String gg1= "lib/assets/gucguide/gate1.jpg";
  String gg2= "lib/assets/gucguide/aftergate1.jpg";
  String gg3="lib/assets/gucguide/beforeelevator.jpg";
  String gg4="lib/assets/gucguide/elevator.jpg";
  String gg5="lib/assets/gucguide/corridor1.jpg";
  String gg6="lib/assets/gucguide/corridor2.jpg";
  String gg7="lib/assets/gucguide/door1.jpg";


  String image1='';
  String image2='';
  String image3='';
  String image4='';
  String image5='';
  String image6='';
  String image7='';
  String image8='';
  String image9='';
  String image10='';
  String image11='';
  String image12='';



  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
      });
    });
    image1=g1;
    image2=g2;
    image3=g3;
    image4=g4;
    image5=g5;
    image6=g6;
    image7=g7;
    image8=g8;
    image9=g9;
    image10=g10;
    image11=g11;
    image12=g12;
  }
  @override
  void dispose() {
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            Container(
              width: 45,
              height: 45,
              margin: EdgeInsets.only(top: 45, left: 30),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(
                      Icons.arrow_back_ios, color: Colors.lightBlue[800]),
                  onPressed: () {
                    Navigator.pushNamed(context, '/solarpark');
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 45, left: 300),
              child: Column(
                children: [
                  Text("MRS", style: TextStyle(fontSize: 23,
                      fontFamily: 'misto',
                      color: Colors.lightBlue[800]),),
                  Text("Lab", style: TextStyle(fontSize: 23,
                      fontFamily: 'misto',
                      color: Colors.lightBlue[800]),),
                  Text("Tour", style: TextStyle(fontSize: 23,
                      fontFamily: 'misto',
                      color: Colors.lightBlue[800]),),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:160),
              height:500,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: gate1? 12:7,
                  itemBuilder: (context,position){
                    return _buildPageItem(position);
                  }),
            ),

            Positioned(
              top:680,
              left: 160,
              child:
              new DotsIndicator(
                dotsCount: gate1?12:7,
                position: _currPageValue,
                decorator: DotsDecorator(
                  activeColor: Colors.lightBlue[800],
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Positioned(
              top: 750,
              left: 120,
              child: GNav(
                  rippleColor: Colors.lightBlue, // tab button ripple color when pressed
                  hoverColor: Colors.lightBlue, // tab button hover color
                  haptic: true, // haptic feedback
                  tabBorderRadius: 15,
                  tabActiveBorder: Border.all(color: Colors.lightBlue, width: 1), // tab button border
                  tabBorder: Border.all(color: Colors.lightBlue, width: 1), // tab button border
                  tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
                  curve: Curves.easeOutExpo, // tab animation curves
                  duration: Duration(milliseconds: 900), // tab animation duration
                  gap: 8, // the tab button gap between icon and text
                  color: Colors.grey, // unselected icon color
                  activeColor: Colors.lightBlue[800], // selected icon and text color
                  iconSize: 24, // tab button icon size
                  tabBackgroundColor: Colors.lightBlue.withOpacity(0.1), // selected tab background color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
                  tabs: [
                    GButton(
                      icon: Icons.location_pin,
                      text: 'Gate 1',
                      onPressed:(){
                        setState(() {
                          image1=g1;
                          image2=g2;
                          image3=g3;
                          image4=g4;
                          image5=g5;
                          image6=g6;
                          image7=g7;
                          image8=g8;
                          image9=g9;
                          image10=g10;
                          image11=g11;
                          image12=g12;
                        });
                      },
                    ),
                    GButton(
                      icon: Icons.location_pin,
                      text: 'Gate 2',
                      onPressed: (){
                        setState(() {
                          image1=gg1;
                          image2=gg2;
                          image3=gg3;
                          image4=gg4;
                          image5=gg5;
                          image6=gg6;
                          image7=gg7;
                          gate1=false;
                        });
                      },
                    ),


                  ]
              ),
            )
          ],
        )
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix= new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if (index== _currPageValue.floor()+1){
      var currScale=_scaleFactor+ (_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index== _currPageValue.floor()-1){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
          children: [

            Container(
              height:500,
              width:400,
              margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color:Color(0xFF69c5df)
              ),
              child: index==0? Image.asset(image1,fit: BoxFit.fitHeight,): index==1?Image.asset(image2,fit: BoxFit.fitHeight):index==2? Image.asset(image3,fit: BoxFit.fill):index==3?Image.asset(image4,fit: BoxFit.fill):index==4? Image.asset(image5,fit: BoxFit.fill):
              index==5?Image.asset(image6,fit: BoxFit.fill):index==6?Image.asset(image7,fit: BoxFit.fill):index==7?Image.asset(image8,fit: BoxFit.fill):index==8?Image.asset(image9,fit: BoxFit.fill):index==9?Image.asset(image10,fit: BoxFit.fill):index==10? Image.asset(image11,fit: BoxFit.fill):
              index==11?Image.asset(image12,fit: BoxFit.fill):null,
            ),
            Container(
                margin:EdgeInsets.only(top:80,left:128),
                child: CustomPaint(
                  size: Size(90, (90*1.9647887323943662).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: Shape(),
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height:100,
                  width:300,
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0,8)
                        ),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5,0)
                        ),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(5,0)
                        )
                      ]
                  ),
                  child: Container(
                    padding:EdgeInsets.only(top:15,left:1,right: Dimensions.width15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(index == 0 ? "Enter from gate 1" : index==1? "Go left":"Take the second right ", style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 26,
                        )),
                      ],
                    ),
                  )
              ),
            ),
          ]
      ),
    );
  }

}
class Shape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_0_stroke.color=Colors.lightBlue.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5000000,size.height*0.2576204),size.width*0.4964789,paint_0_stroke);

    // Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    // paint_0_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawCircle(Offset(size.width*0.5000000,size.height*0.2576204),size.width*0.4964789,paint_0_fill);

    Paint paint_1_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_1_stroke.color=Colors.lightBlue.withOpacity(1.0);
    canvas.drawLine(Offset(size.width*0.5035211,size.height*0.2576204),Offset(size.width*0.5035211,size.height*0.9888029),paint_1_stroke);

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Colors.lightBlue.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5035211,size.height*0.9798423),size.width*0.03873239,paint_2_fill);

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = Colors.lightBlue.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5035211,size.height*0.2594125),size.width*0.03873239,paint_3_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
