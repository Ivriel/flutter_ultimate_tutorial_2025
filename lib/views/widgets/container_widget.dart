import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/data/constants.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.title, // buat ngoper ngoper data. sama aja kayak props di react
    required this.description
    });

    final String title;
    final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 2),
              child:Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: KTextStyle.titleTealText
                      ),
                      Text(
                        description,
                        style: KTextStyle.descriptionText,
                      )
                    ],
                  ),
                ),
              ),
            );
  }
}