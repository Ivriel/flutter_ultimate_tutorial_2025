import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/data/classes/activity_class.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widgets/hero_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late Future <Activity> activity; // valuenya bakal diset nanti jadi kalau null sekarang gapapa ( itu fungsinya deklarasi late)

  @override
  void initState() {
    super.initState();
    activity = getData();
  }

  Future<Activity> getData() async {
   var url = Uri.https('bored-api.appbrewery.com', '/random');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    try {
      return Activity.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e, stack) {
      log('Parsing error: $e');
      log('Stack: $stack');
      rethrow;
    }
  } else {
    log('Failed to load activity ${response.statusCode}');
    throw Exception('Failed to load activity from api ${response.statusCode}');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), // supaya ada back buttonnya
        body: FutureBuilder(
          future: activity,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child:  CircularProgressIndicator()
              );
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            if (snapshot.hasData) {
              Activity  activity =  snapshot.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      HeroWidget(title: activity.activity),
                      Text(activity.activity)
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text("Error"),
              );
            }
          },
        ));

  }
}
