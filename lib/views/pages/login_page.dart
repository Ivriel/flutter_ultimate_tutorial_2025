import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widget_tree.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widgets/hero_widget.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword  = TextEditingController();

  String confirmedEmail = "tes";
  String confirmedPassword = "tespw";

  bool isShowedPassword = false;

  @override
  void dispose() { // ini kayak ng on destroy
    controllerEmail.dispose(); // buat ngebuang controller ketika sudah ganti page
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
             const HeroWidget(title: 'Login'),
             const SizedBox(height: 20),
              TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              onEditingComplete:()=> setState(() {}),
            ),
             const SizedBox(height: 10),
              TextField(
              controller: controllerPassword,
              obscureText: isShowedPassword,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowedPassword = !isShowedPassword;
                    });
                  },
                  icon: isShowedPassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                ),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              onEditingComplete:()=> setState(() {}),
            ),
              const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                onLoginPressed();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40)
              ),
              child: const Text("Login")
            ),
          ],
        ),
      ),
    );
  }

  
  void onLoginPressed(){
    if(confirmedEmail == controllerEmail.text && confirmedPassword == controllerPassword.text) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context)=> const WidgetTree()
      )
    );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
          content:  Text(
            "Email / password salah",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          )
        )
      );
    }

  }

}