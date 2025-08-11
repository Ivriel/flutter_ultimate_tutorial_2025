import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded( // take as much place as possible dari parent nya . disini adalah row bukan column (yang jadi parentnya)
                child: Container(
                  color: Colors.teal,
                  height: 20,
                  child: const Text("Hello"), // show terus ga peduli lebar child nya pokok sampe mentok
                )
              ),
              Flexible(
                child: Container(
                  color: Colors.orange,
                  height: 20,
                  child: const Text("Hello"), // show terus tapi cuma selebar child nya
                )
              )
            ],
          ),
          const Divider(),
           Row(
            children: [
               Flexible(
                flex: 4, // pembagian ruangnya (berapa besar)
                child: Container(
                  color: Colors.orange,
                  height: 20,
                  child: const Text("Hello"), // show terus tapi cuma selebar child nya
                )
              ),
              Expanded( // take as much place as possible dari parent nya . disini adalah row bukan column (yang jadi parentnya)
                child: Container(
                  color: Colors.teal,
                  height: 20,
                  child: const Text("Hello"), // show terus ga peduli lebar child nya pokok sampe mentok
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}