import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/data/notifiers.dart';
import 'package:flutter_ultimate_tutorial_2025/views/pages/home_page.dart';
import 'package:flutter_ultimate_tutorial_2025/views/pages/settings_page.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widgets/navbar_widget.dart';

import 'pages/profile_page.dart';

List<Widget> pages = [
  const HomePage(),
  const ProfilePage()
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Flutter Map"),
          actions: [
            IconButton(
              onPressed: (){
                isDarkModeNotifier.value = !isDarkModeNotifier.value;
              },
              icon: ValueListenableBuilder(
                valueListenable:isDarkModeNotifier,
                builder: (context,isDarkMode,child){
                  return Icon(
                    isDarkMode ? Icons.light_mode :
                    Icons.dark_mode
                  );
                },
              )
            ),
            IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context){
                    return const SettingsPage(title: 'Settings Page',);
                  })
                );
              },
              icon: const Icon(Icons.settings)
            )
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (context, selectedPage, child) {
            return pages.elementAt(selectedPage);
          },
        ),
        bottomNavigationBar:const NavbarWidget()
      );
  }
}