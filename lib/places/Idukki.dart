import 'package:flutter/material.dart';
import 'package:software_project/BusBooking.dart';
import 'package:software_project/TrainBooking.dart';

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
      body: ListView(children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assests/Idukki.jpg')),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, right: 20),
          child: Text(
            "A gem in the lap of the mighty Western Ghats, Idukki boasts of being one of the evergreen and pristine districts in Kerala. Canopied by lush vegetation, this part of ‘India’s Backwater Capital’ has a unique charm and attracts visitors from almost all the corners of the globe.\n\nHome to numerous natural marvels, lofty peaks like Anamudi and others, captivating sanctuaries, and spice gardens, this surreal part of Kerala is a must for every nature lovers. To note here, many of the popular Kerala tourist destinations like Munnar, Vagamon, Ramakkalmedu, Marayur, and Thekkady are located within this district.",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, right: 20),
          child: Text(
            "Best time to visit: Year-round Destination",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, right: 20),
          child: Text(
            "Tourist Attractions:  Periyar National Park, Periyar Lake, Idukki Arch Dam, Munnar, Vagamon, Thekkady, Nandukani, Painavu, Gavi, Murikkady, Kulamavu Dam, Anakkara, Hill View Park, Thommankuthu Falls, Keezharkuthu Falls, Mangala Devi Temple",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75.0, right: 75.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TrainBooking()),
              );
            },
            child: const Text('Search Trains'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75.0, right: 75.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BusBooking()),
              );
            },
            child: const Text('Search Buses'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
