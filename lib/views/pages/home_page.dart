import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/data/constants.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const HeroWidget(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Basic Layout",
                      style: KTextStyle.titleTealText
                    ),
                    Text(
                      "The description of this",
                      style: KTextStyle.descriptionText,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}