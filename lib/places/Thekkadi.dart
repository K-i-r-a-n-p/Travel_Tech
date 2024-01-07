import 'package:flutter/material.dart';

class PlaceThekkadi extends StatelessWidget {
  const PlaceThekkadi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Thekkadi"),
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
            child:
                Text("Periyar National Park", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("Kadathanadan Kalari Centre",
                style: TextStyle(fontSize: 20)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("Mangala Devi Temple", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
