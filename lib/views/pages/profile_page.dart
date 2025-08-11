import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/data/notifiers.dart';
import 'package:flutter_ultimate_tutorial_2025/views/pages/welcome_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
           const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/legionwphd.png"),
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: (){
              selectedPageNotifier.value = 0; // biar balik ke home page lagi
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (context)=> const WelcomePage()
                )
              );
            },
          )
        ],
      ),
    );
  }
}