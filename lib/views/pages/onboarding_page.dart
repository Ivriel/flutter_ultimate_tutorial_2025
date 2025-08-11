import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/data/constants.dart';
import 'package:flutter_ultimate_tutorial_2025/views/pages/login_page.dart';
import 'package:lottie/lottie.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Lottie.asset(
                    'assets/lotties/welcome_2.json',
                    height: 400
                  ),
                const SizedBox(height: 20),
                const Text(
                  'Flutter Mapp my instructor. Watch his video to learn Flutter.',
                  style: KTextStyle.descriptionText,
                  textAlign: TextAlign.justify,
                ),
                FilledButton(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(title: 'Register')
                        )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                      double.infinity,
                       40
                      )
                  ),
                  child: const Text('Next')
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }


}