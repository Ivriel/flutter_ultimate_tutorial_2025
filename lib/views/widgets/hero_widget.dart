import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero( // biar ada transisi bawaan nya
      tag: 'hero-image', // unique value.  harus kasih value beda beda untuk tag 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/images/legionwphd.png",
          color: Colors.teal, // buat ngewarna gambarnya
          colorBlendMode: BlendMode.modulate,
        ),
      ),
    );
  }
}
