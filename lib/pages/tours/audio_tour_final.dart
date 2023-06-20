import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AudioTour extends StatefulWidget {
  const AudioTour({Key? key}) : super(key: key);

  @override
  State<AudioTour> createState() => _AudioTourState();
}

class _AudioTourState extends State<AudioTour> with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool isAnimated=false;
  bool showAnim=false;
  bool playy=false;
  bool showButton=false;
Duration timing= Duration(milliseconds: 100);
  Duration speed2= Duration(milliseconds: 100);
  Duration speed3= Duration(milliseconds: 100);
  int count=0;
  late AnimationController iconController;
  void togglePlaying  () {
    setState(() {
      if(isPlaying){
        setState(() {
          timing= Duration(milliseconds: 100);
        });
      }
      else{
        setState(() {
          timing= Duration(milliseconds: 1000000000);
        });
      }
      isPlaying = !isPlaying;
      showAnim=true;
      playy=!playy;
    });
  }
  void animateIcon(){
    setState(() {
      isAnimated=!isAnimated;
      isAnimated? iconController.forward(): iconController.reverse();
    });
  }

  @override
  void initState() {
    iconController=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    //iconController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:Scaffold(
            body: Container(
              padding: EdgeInsets.all(20),
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF29B6F6),Color(0xFF01579B)])
              ),
              child: Stack(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    margin: EdgeInsets.only(top: 45, left: 20),
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
                    margin: EdgeInsets.only(top: 45, left: 269),
                    child: Column(
                      children: [
                        Text("Solar", style: TextStyle(fontSize: 25,
                            fontFamily: 'misto',
                            color: Colors.lightBlue[800]),),
                        Text("Park", style: TextStyle(fontSize: 25,
                            fontFamily: 'misto',
                            color: Colors.lightBlue[800]),),
                        Text("Tour", style: TextStyle(fontSize: 25,
                            fontFamily: 'misto',
                            color: Colors.lightBlue[800]),),

                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      AudioWidget.assets(
                        path: 'lib/assets/Solar_park_Audio.mp3',
                        play: isPlaying,
                        onFinished: (){
                          setState(() {
                            showButton=true;
                          });
                        },
                        child: Positioned(
                          top:200,
                          left: 100,
                          child: CustomPaint(
                            size: Size(280, (280*0.5454545454545454).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: RPSCustomPainter(),
                          ),
                        ),),
                      Positioned(
                          top: 252,
                          left: 138,
                          child: GestureDetector(
                            onTap: (){
                              animateIcon();
                              togglePlaying();
                            },
                            child: AnimatedIcon(
                              icon: AnimatedIcons.play_pause,
                              progress: iconController,
                              size: 60,
                            ),
                          )),
                      showAnim? Positioned(
                        top:400,
                          right:5,
                          left: 5,
                          child:
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 0),
                        width: MediaQuery.of(context).size.width,
                        child: DefaultTextStyle(
                          style:TextStyle(
                            fontSize: 30,
                            fontFamily: 'robotoN',
                            color: Colors.white,
                          ),
                              child: AnimatedTextKit(
                           repeatForever: false,
                           totalRepeatCount: 1,
                           animatedTexts: [
                             TyperAnimatedText("Welcome to the Solar Panel Park audio tour at the German University in Cairo.",
                                 speed: Duration(milliseconds: 100)),
                             TyperAnimatedText("Subtitle 2",
                                 speed: Duration(milliseconds: 100)),
                             TyperAnimatedText("Subtitle 3 ",
                                 speed: Duration(milliseconds: 100))
                          ],
                        )

                        ),
                      )): Container(),
                      showButton? Positioned(
                        top:670,
                          left:50,
                          child:
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/solardetail');
                        },
                        child: Container(
                          width: 280,
                            height: 60,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 27.0),
                                child: Text("To Video Tour!",style: TextStyle(
                                  color: Colors.lightBlue[800],
                                  fontFamily: 'robotoN',
                                  fontSize: 25,
                                ),),
                              ),
                              Icon(Icons.arrow_forward,color: Colors.lightBlue[800], )
                            ],
                          )
                        ),
                      )):Container(),
                    ],
                  )

                ],
              ),
            )
        )
    );
  }
}
// class Controls extends StatelessWidget {
//   const Controls({Key? key, required this.audioPlayer}) : super(key: key);
// final AudioPlayer audioPlayer;
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<PlayerState>(
//       stream: audioPlayer.onPlayerStateChanged,
//         builder:(context,snapshot) {
//           final playerState=snapshot.data;
//           final processingState=PlayerState?.completed;
//           final playing=PlayerState?.playing;
//           if(playing != false){
//             return IconButton(
//                 onPressed:(){ audioPlayer.play;},
//                 iconSize: 80,
//               color: Colors.white,
//               icon: const Icon(Icons.play_arrow_rounded),
//             );
//           }
//           else if( processingState!=PlayerState.completed){
//             return IconButton(
//               onPressed:(){ audioPlayer.play;},
//               iconSize: 80,
//               color: Colors.white,
//               icon: const Icon(Icons.pause_rounded),
//             );
//           }
//           return Icon(
//             Icons.play_arrow_rounded,
//             size: 80,
//             color: Colors.white,
//           );
//         });
//   }
// }
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=2;
    paint_0_stroke.shader = ui.Gradient.linear(Offset(size.width*0.2030303,size.height*0.3000000), Offset(size.width*0.7000000,size.height*1.627778), [Colors.lightBlue.withOpacity(1),Colors.lightBlueAccent.withOpacity(1)], [0,1]);
    canvas.drawCircle(Offset(size.width*0.2424242,size.height*0.5555556),size.width*0.2393939,paint_0_stroke);

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.lightBlue.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.2424242,size.height*0.5555556),size.width*0.2393939,paint_0_fill);

    Paint paint_1_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.04848485;
    paint_1_stroke.shader = ui.Gradient.linear(Offset(size.width*0.2089394,size.height*0.3383333), Offset(size.width*0.6313636,size.height*1.466944), [Colors.lightBlue.withOpacity(1),Colors.lightBlueAccent.withOpacity(1)], [0,1]);
    canvas.drawCircle(Offset(size.width*0.2424242,size.height*0.5555556),size.width*0.1818182,paint_1_stroke);

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.2424242,size.height*0.5555556),size.width*0.1818182,paint_1_fill);

    Paint paint_2_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.1030303;
    paint_2_stroke.shader = ui.Gradient.linear(Offset(size.width*0.2256818,size.height*0.4469444), Offset(size.width*0.4368939,size.height*1.011250), [Colors.blue.withOpacity(1),Colors.white.withOpacity(1)], [0,1]);
    canvas.drawCircle(Offset(size.width*0.2424242,size.height*0.5555556),size.width*0.05151515,paint_2_stroke);

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Colors.lightBlue.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.2424242,size.height*0.5555556),size.width*0.05151515,paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width,0);
    path_3.lineTo(size.width*0.8545455,size.height*0.1151511);
    path_3.lineTo(size.width*0.9272727,size.height*0.05757578);
    path_3.lineTo(size.width,0);
    path_3.close();

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_3,paint_3_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}