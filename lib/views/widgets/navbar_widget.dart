import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context,selectedPage,child) {
        return NavigationBar(
        selectedIndex: selectedPage,
       destinations:const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile'
            )
          ],
        onDestinationSelected: (int value) {
          selectedPageNotifier.value = value;
        },
    );
      }
    );
  }
}