import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/tranlate.dart';
import 'package:video_player/video_player.dart';

class UploadVid extends StatefulWidget {
  const UploadVid({super.key});

  @override
  State<UploadVid> createState() => _UploadVidState();
}

class _UploadVidState extends State<UploadVid> {
  late VideoPlayerController videoPlayerController;
late File video;
bool uploaded=false;
bool pressed=false;
late double sliderValue;
final picker = ImagePicker();
pickVideo() async {
  setState(() {
    pressed=true;
  });
  final vid = await picker.pickVideo(source: ImageSource.gallery);
  video = File(vid!.path);
  int videoSizeInBytes = await video.length();

// Convert to kilobytes (optional)
  double videoSizeInKB = videoSizeInBytes / 1024;

// Convert to megabytes (optional)
  double videoSizeInMB = videoSizeInBytes / (1024 * 1024);
  sliderValue=videoSizeInMB;

  // videoPlayerController = VideoPlayerController.file(video)
  //   ..initialize().then((_) {
  //     setState(() {});
  //     videoPlayerController.play();
  //   });
  setState(() {
    uploaded=true;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back,
            size: 28,
          ),
          onPressed: () {},
        ),
        actions: const [
          Text(
            'Videos',
            style: TextStyle(
              color: Color(0xffA86434),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        color: const Color(0xffF3F4F9),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: 290,
                height: 82,
                color: const Color(0xff649192),
                onPressed: (){
                  pickVideo();
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Choose video ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Icon(
                        Icons.upload,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              uploaded && pressed? const Text('video Uploaded successfully') : const SizedBox(),
              const SizedBox(height: 50,),
              uploaded && pressed? MaterialButton(
                color: Colors.greenAccent,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Translate()));
                  setState(() {
                    pressed=false;
                    uploaded=false;
                  });
                },
                child: const Text(
                  'Continue',
                ),
              ): const SizedBox(),
              pressed && !uploaded? Slider(value: 0, onChanged: (value){

              })
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
