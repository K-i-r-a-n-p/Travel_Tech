import 'package:flutter/material.dart';

class Destinations extends StatelessWidget {
  const Destinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Destinations"),
        centerTitle: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("Kollam", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("Shornur", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("Kozhikode", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
