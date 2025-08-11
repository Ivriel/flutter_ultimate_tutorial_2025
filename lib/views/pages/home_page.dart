import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding:  EdgeInsets.all(20),
      child: Column(
        children: [
          HeroWidget()
        ],
      ),
    );
  }
}