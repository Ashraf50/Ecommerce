import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  final String image;
  const PhotoViewer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(image),
        ),
      ),
    );
  }
}
