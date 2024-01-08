import 'package:flutter/material.dart';

class PlaceThekkadi extends StatelessWidget {
  const PlaceThekkadi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Thekkady"),
        centerTitle: true,
      ),
      body: ListView(children: const [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assests/Periyar-National-Park.jpg')),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "The evergreen abode of God’s Own Country! Strategically located and well-connected with some of the major Kerala holiday destinations, this is the place that always wears the green colour of Mother Nature!\n\nThe ‘Spice Capital of Kerala’, Thekkady is much popular as the natural abode to numerous exotic wildlife species. And while talking about wildlife species, the Periyar National Park in Thekkady will surely behold all your senses with its fascinating range of dwellers!",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Best time to visit: October to February (Winter)",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Tourist Attractions: Periyar National Park, Periyar Lake, Gavi, Kumily, Caramom Hills, Spring Valley Mountain, Pandikuzhi, Chellarkovil, Panchalimedu, Vandiperiyar, Grampi, Mangala Devi Temple",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
