import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/tranlate.dart';

class UploadVid extends StatefulWidget {
  const UploadVid({super.key});

  @override
  State<UploadVid> createState() => _UploadVidState();
}

class _UploadVidState extends State<UploadVid> {
late File video;
bool uploaded=false;
bool pressed=false;
final picker = ImagePicker();
pickVideo() async {
  setState(() {
    pressed=true;
  });
  final vid = await picker.pickVideo(source: ImageSource.gallery);
  video = File(vid!.path);
  setState(() {
    uploaded=true;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: const [
          Text(
            'Videos',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: (){
                pickVideo();
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Choose video',
                  ),
                  Icon(Icons.upload),
                ],
              ),
            ),
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
            pressed && !uploaded? const CircularProgressIndicator()
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
