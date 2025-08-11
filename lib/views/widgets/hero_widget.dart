import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero( // biar ada transisi bawaan nya
          tag: 'hero-image', // unique value.  harus kasih value beda beda untuk tag 
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/legionwphd.png",
              color: Colors.teal, // buat ngewarna gambarnya
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              letterSpacing: 50,
              color: Colors.white38
            ),
          ),
        )
      ],
    );
  }
}
