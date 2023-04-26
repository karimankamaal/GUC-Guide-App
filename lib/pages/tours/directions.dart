import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myfirstapp/utils/dimensions.dart';

import '../../widgets/IconAndTextWidget.dart';
class Directions extends StatefulWidget {
  const Directions({Key? key}) : super(key: key);

  @override
  State<Directions> createState() => _DirectionsState();
}

class _DirectionsState extends State<Directions> {
  PageController pageController= PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height =Dimensions.pageViewContainer;
 String image1= "lib/assets/img.png";
  String image2= "lib/assets/solarpanel.jpeg";
  String image3="lib/assets/destination_pin.png";
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
      });
    });
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
              Text("Solar", style: TextStyle(fontSize: 23,
                  fontFamily: 'misto',
                  color: Colors.lightBlue[800]),),
              Text("Park", style: TextStyle(fontSize: 23,
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
            itemCount: 3,
            itemBuilder: (context,position){
              return _buildPageItem(position);
            }),
      ),

        Positioned(
          top:680,
          left: 160,
          child:
        new DotsIndicator(
          dotsCount: 3,
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
          left: 80,
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

                  },
                ),
                GButton(
                  icon: Icons.location_pin,
                  text: 'Gate 2',
                  onPressed: (){
                    setState(() {
                      image1=image3;
                      image2=image1;
                      image3=image2;
                    });
                  },
                ),
                GButton(
                  icon: Icons.location_pin,
                  text: 'Gate 3',textSize: 30,
                    onPressed: (){
                      setState(() {
                        image1=image2;
                        image2=image3;
                        image3=image2;
                      });
                    }
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
                child: index==0? Image.asset(image1,fit: BoxFit.fitHeight,): index==1?Image.asset(image2,fit: BoxFit.fitHeight):index==2? Image.asset(image3,fit: BoxFit.fill):Image.asset(image3,fit: BoxFit.fill),
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