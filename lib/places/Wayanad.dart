import 'package:flutter/material.dart';

class PlaceWayanad extends StatelessWidget {
  const PlaceWayanad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Wayanad"),
          centerTitle: true,
        ),
        body: ListView(children: const [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(image: AssetImage('assests/kerala-backwaters.jpg')),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "Wayanad is a rural district in Kerala state, southwest India. In the east, the Wayanad Wildlife Sanctuary is a lush, forested region with areas of high altitude, home to animals including Asiatic elephants, tigers, leopards and egrets. In the Ambukuthi Hills to the south, Edakkal Caves contain ancient petroglyphs, some dating back to the Neolithic age.",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ]));
  }
}
