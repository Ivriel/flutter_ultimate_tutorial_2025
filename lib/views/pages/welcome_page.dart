import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widget_tree.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widgets/hero_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeroWidget(),
            FilledButton(
              onPressed: (){
                 Navigator.pushReplacement(
                  context,
                   PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const WidgetTree(),
                    transitionDuration: const Duration(milliseconds: 700), // Lebih lambat untuk lihat transisi
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text("Login")
            )
          ],
        ),
      ),
    );
  }
}