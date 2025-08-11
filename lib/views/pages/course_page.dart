import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/data/constants.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widgets/hero_widget.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.keyConcepts,
      KValue.cleanUi,
      KValue.fixBugs,
      KValue.basicLayout,
    ];

    return Scaffold(
      appBar: AppBar(),// supaya ada back buttonnya
      body: const  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
           HeroWidget(
              title: 'Flutter Mapp'
            )
          ],
        ),
      ),
    )
    );
  }
}