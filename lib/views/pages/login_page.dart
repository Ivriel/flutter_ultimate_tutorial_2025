import 'package:flutter/material.dart';
import 'package:flutter_ultimate_tutorial_2025/views/widget_tree.dart';
import 'package:lottie/lottie.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.title 
  });

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  TextEditingController controllerEmail = TextEditingController(text: 'tes'); // buat binding langsung value input field nya (text)
  TextEditingController controllerPassword  = TextEditingController(text: 'tespw');

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

    // double widthScreen = MediaQuery.of(context).size.width; // kalau mau tahu lebar layar
    
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return FractionallySizedBox(
              widthFactor: constraints.maxWidth > 500 ?  0.5 : 1.0, //   kalau layarnya (perangkat) lebih besar dari 500? kalau iya berarti show 50 persen dari layar. kalau ga ya biasa aja (100%)
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Lottie.asset(
                      'assets/lotties/welcome.json',
                      height: 400
                    ),
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
                  FilledButton(
                    onPressed: (){
                      onLoginPressed();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40)
                    ),
                    child: Text(widget.title)
                  ),
                  const SizedBox(height: 50)
                ],
              ),
            );
              },
            )
          ),
        ),
      ),
    );
  }

  
  void onLoginPressed(){

    if(confirmedEmail == controllerEmail.text && confirmedPassword == controllerPassword.text) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context)=> const WidgetTree()
      ),
      (route)=> false // hapus semua route dibelakang 
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