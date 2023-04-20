import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myfirstapp/controllers/video_controller.dart';
import 'dart:ui' as ui;

import 'package:video_player/video_player.dart';

class SolarParkTourPage extends StatefulWidget {
  @override
  _SolarParkTourPageState createState() => _SolarParkTourPageState();
}

class _SolarParkTourPageState extends State<SolarParkTourPage> {
 late AudioPlayer audioPlayer;
  String audio='';
  Duration duration=Duration.zero;
  Duration position= Duration.zero;
  bool isPlaying = false;

  void togglePlaying  () {
  setState(() {
      isPlaying = !isPlaying;
    });
  }
String formatTime(Duration duration){
    String twoDigits(int n)=> n.toString().padLeft(2,'0');
    final hours=twoDigits(duration.inHours);
    final minutes=twoDigits(duration.inMinutes);
    final seconds= twoDigits(duration.inSeconds);

    return[
      if (duration.inHours>0) hours,
      minutes,
      seconds,
    ].join(':');
}
@override
  void initState() {
  // TODO: implement initState
audioPlayer=AudioPlayer()..setSourceAsset('lib/asset/kids-cheering-sound-effect.mp3');
  audioPlayer.onPlayerStateChanged.listen((state) {
    setState(() {
      isPlaying = state == PlayerState.playing;
    });
  });

  audioPlayer.onDurationChanged.listen((newDuration) {
    setState(() {
      duration = newDuration;
    });
  });
}

Future setAudio() async{
final player= AudioCache(prefix: 'lib/assets/');
final url= await player .load('070 Shake  Morrow Official Audio.mp3');
audioPlayer.setSourceUrl(url.path);
}

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
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
                  Navigator.pushNamed(context, '/audiotour');
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 45, left: 290),
            child: Column(
              children: [
                Text("MRS", style: TextStyle(fontSize: 25,
                    fontFamily: 'misto',
                    color: Colors.lightBlue[800]),),
                Text("Lab", style: TextStyle(fontSize: 25,
                    fontFamily: 'misto',
                    color: Colors.lightBlue[800]),),
                Text("Tour", style: TextStyle(fontSize: 25,
                    fontFamily: 'misto',
                    color: Colors.lightBlue[800]),),

              ],
            ),
          ),

          Positioned(

            child: GetBuilder<VideoController>(
              init: VideoController(),
              builder: (controller)=> Flex(
                direction: Axis.vertical,
                children:[Expanded(

                  child: Center(
                  child: controller.chewieController!=null&&
                    controller.chewieController!.videoPlayerController.value.isInitialized?
                      SizedBox(
                          height: 700,
                          width: 600,
                          child:
                              Container(
                                  margin: EdgeInsets.only(top:200),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                                    color: Colors.lightBlue,
                                  ),
                                child: Chewie(controller: controller.chewieController!)))
                  :Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                )

                )),
    ]
              ),

            ),
          ),


        ],
      ),
        )
    );
  }
}
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
