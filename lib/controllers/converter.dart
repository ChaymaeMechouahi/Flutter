import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  final String base64Image;

  MyImageWidget({required this.base64Image});

  @override
  Widget build(BuildContext context) {
    Uint8List decodedImage = base64.decode(base64Image);

    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: Image.memory(decodedImage),
      ),
    );
  }
}

// Utilisation de MyImageWidget
void main() {
  String base64Image =
      "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";
 
  runApp(MaterialApp(
    home: MyImageWidget(base64Image: base64Image), // Votre image en base 64
  ));
}