import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/views/pages/login_page.dart';
import 'package:flutter_ultimate_tutorial_2025/views/pages/onboarding_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                "assets/lotties/welcome_3.json",
                height: 400
                ),
                 const FittedBox( // biar tetap bisa satu baris meski harusnya overflow / kebawah
                   child: Text(
                    "Ivriel Gunawan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold ,
                      fontSize: 500,
                      letterSpacing: 50
                    ),
                  ),
                 ),
                 const SizedBox(height: 20),
                FilledButton(
                  onPressed: (){
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnBoardingPage()
                      ),
                      //  PageRouteBuilder(
                      //   pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
                      //   transitionDuration: const Duration(milliseconds: 700), // Lebih lambat untuk lihat transisi widget heronya
                      //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      //     return FadeTransition(
                      //       opacity: animation,
                      //       child: child,
                      //     );
                      //   },
                      // ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40)
                  ),
                  child: const Text("Get Started")
                ),
                 TextButton(
                  onPressed: (){
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(title: 'Login')
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40)
                  ),
                  child: const Text("Login")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}