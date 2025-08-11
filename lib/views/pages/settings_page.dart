import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.title // buat oper data through pages
    });

    final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.09;
  int countClick = 0;
  String? selectedItem = "Element 1";

  final List<String> itemsButton =[
    "Element 1",
    "Element 2",
    "Element 3"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false, // biar gada icon back (atau intinya icon di awalan app bar)
        title:  Text(widget.title),
      ),
      body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding:  const EdgeInsets.all(20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                  duration: Duration(seconds: 5),
                    content: Text("Snackbar"),
                    behavior: SnackBarBehavior.floating, //biar ada jarak dari bawah. jadi ga nempel
                  )
                );
              },
              child: const Text("Open Snackbar")
            ),
            DropdownButton(
              value: selectedItem,
              items: itemsButton.map((String item){
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item
                  ),
                );
              }).toList(),
              onChanged: (value){
                setState(() {
                  selectedItem = value;
                });
              }
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
              onEditingComplete:()=> setState(() {}),
            ),
            Text(controller.text),
            Checkbox.adaptive(
              tristate: true,
              value: isChecked,
              onChanged: (bool? value){
                setState(() {
                  isChecked = value;
                });
              }
            ),
            CheckboxListTile.adaptive(
              tristate: true, // bisa punya 3 value
              title: const Text("Click me"),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              }
            ),
            Switch.adaptive( // adaptiv buat styling ios
              value: isSwitched,
              onChanged: (bool value){
                setState(() {
                  isSwitched = value;
                });
              }
            ),
            SwitchListTile.adaptive(
              title: const Text("Switch Me"),
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              }
            ),
            Slider.adaptive(
              max: 10.0,
              value: sliderValue,
              divisions: 10, // biar nomor nomor biasa aja valuenya ga sampe buanyak angka dibelakang 0
              onChanged: (double value){
                setState(() {
                  sliderValue = value;
                });
                print(value);
              }
            ),
            InkWell(
              splashColor: Colors.teal,// warna efek splash pas di klik
              onTap: (){
               setState(() {
                  countClick++;
                  debugPrint("iMAGE SELECTED $countClick times");
               });
              },
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.white12,
              )
            ),
             ElevatedButton(
              onPressed: (){},
              child: const Text("Click Me")
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.teal
              ),
              onPressed: (){},
              child: const Text("Click Me")
            ),
            TextButton(
              onPressed: (){},
              child: const Text("Click me")
            ),
            OutlinedButton(
              onPressed: (){},
              child: const Text("Click Me")
            ),
            const CloseButton(
              style:ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red)
              ),
            ),
             BackButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue[400])
              ),
            )
          ],
        ),
      ),
    )
    );
  }
}