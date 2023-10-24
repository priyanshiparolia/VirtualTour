import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class suryamandir extends StatefulWidget {
  const suryamandir({super.key});

  @override
  State<suryamandir> createState() => _suryamandirState();
}

class _suryamandirState extends State<suryamandir> {

  late VideoPlayerController controller;

  late Future<void> _initializeVideoPlayerFuture;

   void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer(){
     controller = VideoPlayerController.asset('assets/surya_mandir_video.mp4');
     controller.addListener(() {
        setState(() {});
     });
    controller.initialize().then((value){
        setState(() {});
    });

  }
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

return  Scaffold(
          appBar: AppBar( 
              title: Text("Play Video from Assets/URL"),
              backgroundColor: Colors.redAccent,
          ),
          body: Container( 
            child: Column(
              children:[
                  AspectRatio( 
                    aspectRatio: controller.value.aspectRatio,
                     child: VideoPlayer(controller),
                  ),

                  Container( //duration of video
                     child: Text("Total Duration: " + controller.value.duration.toString()),
                  ),

                  Container(
                      child: VideoProgressIndicator(
                        controller, 
                        allowScrubbing: true,
                        colors:VideoProgressColors(
                            backgroundColor: Colors.redAccent,
                            playedColor: Colors.green,
                            bufferedColor: Colors.purple,
                        )
                      )
                  ),

                  Container(
                     child: Row(
                         children: [
                            IconButton(
                                onPressed: (){
                                  if(controller.value.isPlaying){
                                    controller.pause();
                                  }else{
                                    controller.play();
                                  }

                                  setState(() {
                                    
                                  });
                                }, 
                                icon:Icon(controller.value.isPlaying?Icons.pause:Icons.play_arrow)
                           ),

                           IconButton(
                                onPressed: (){
                                  controller.seekTo(Duration(seconds: 0));

                                  setState(() {
                                    
                                  });
                                }, 
                                icon:Icon(Icons.stop)
                           )
                         ],
                     ),
                  )
              ]
            )
          ),
       );
  



  }
}