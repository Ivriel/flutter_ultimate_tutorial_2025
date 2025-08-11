import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget(
      {super.key,
      required this.title,
      this.nextPage // nullable jadi gapake required
      });

  final String title;
  final Widget? nextPage; // pake tanda tanya biar bisa nullable

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextPage != null ?  () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) {
                return nextPage!; // kasih tanda seru biar ga error
              } 
            ),
        );
      } : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            // biar ada transisi bawaan nya
            tag:
                'hero-image', // unique value.  harus kasih value beda beda untuk tag
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
                  color: Colors.white38),
            ),
          )
        ],
      ),
    );
  }
}
