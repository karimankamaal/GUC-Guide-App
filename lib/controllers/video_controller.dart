import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController{
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void onInit(){
    super.onInit();
    initializePlayer();
  }
  @override
  void onReady(){
    super.onReady();
  }
  @override
  void onClose(){
    videoPlayerController.dispose();
    chewieController!.dispose();
  }

  Future<void> initializePlayer() async{

    videoPlayerController= VideoPlayerController.network("https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4");
    await Future.wait([videoPlayerController.initialize()]);
    chewieController=ChewieController(videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      subtitle:Subtitles(
        [

        ]
      ) ,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.cyan,
        backgroundColor: Colors.white,
        bufferedColor: Colors.lightBlue,

      ),
      placeholder:  Container(
        margin: EdgeInsets.only(top:380),
        height:200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          color: Colors.lightBlue,
        ),
      ),
      );

  }
}