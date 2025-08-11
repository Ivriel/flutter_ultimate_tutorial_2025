import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widgets/hero_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var url = Uri.https('bored-api.appbrewery.com','/random');
    var response = await http.get(url);

    if(response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String,dynamic>; // convert dulu ke map pakai json decode biar bisa dibaca 
      var itemCount = jsonResponse['activity'];
      print('One of simple activity: $itemCount');
      log(response.body);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),// supaya ada back buttonnya
      body: const  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
           HeroWidget(
              title: 'Course'
            )
          ],
        ),
      ),
    )
    );
  }
}