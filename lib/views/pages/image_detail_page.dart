import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Gambar'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Hero(
          tag: 'hero1',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/legionwphd.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
