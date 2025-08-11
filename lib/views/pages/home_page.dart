import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/data/constants.dart';
import 'package:flutter_ultimate_tutorial_2025/views/pages/course_page.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widgets/container_widget.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.keyConcepts,
      KValue.cleanUi,
      KValue.fixBugs,
      KValue.basicLayout,
    ];

    return Padding(
      padding: const  EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const HeroWidget(
              title: 'Home',
              nextPage: CoursePage(),
            ), // kasih titik tiga buat nandain kalau mau ngasih banyak widget biar ga error
            const SizedBox(height: 5),
            ... List.generate(   // length dan widget nya (parameter)
              list.length,(index) {
                return ContainerWidget(
              title: list.elementAt(index), // biar nge print title nya sesuai isi list nya (array)
              description: 'This is a description',
             );
            }) 
            // Column(
            //   children:  List.generate(   // length dan widget nya (parameter)
            //   3,(index) {
            //     return 
            //  const ContainerWidget(
            //   title: 'Basic Layout',
            //   description: 'This is a description',
            //  );
            // }) 
            // )
          ],
        ),
      ),
    );
  }
}