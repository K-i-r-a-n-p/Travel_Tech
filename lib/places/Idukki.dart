import 'package:flutter/material.dart';

class PlaceIdukki extends StatelessWidget {
  const PlaceIdukki({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Idukki"),
        centerTitle: true,
      ),
      body: ListView(children: const [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assests/Idukki.jpg')),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "A gem in the lap of the mighty Western Ghats, Idukki boasts of being one of the evergreen and pristine districts in Kerala. Canopied by lush vegetation, this part of ‘India’s Backwater Capital’ has a unique charm and attracts visitors from almost all the corners of the globe.\n\nHome to numerous natural marvels, lofty peaks like Anamudi and others, captivating sanctuaries, and spice gardens, this surreal part of Kerala is a must for every nature lovers. To note here, many of the popular Kerala tourist destinations like Munnar, Vagamon, Ramakkalmedu, Marayur, and Thekkady are located within this district.",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Best time to visit: Year-round Destination",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Tourist Attractions:  Periyar National Park, Periyar Lake, Idukki Arch Dam, Munnar, Vagamon, Thekkady, Nandukani, Painavu, Gavi, Murikkady, Kulamavu Dam, Anakkara, Hill View Park, Thommankuthu Falls, Keezharkuthu Falls, Mangala Devi Temple",
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
