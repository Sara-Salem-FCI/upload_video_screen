import 'package:flutter/material.dart';

class Translate extends StatelessWidget {
  const Translate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Translate the video to sign language'
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                      'Translate the video to text'
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
