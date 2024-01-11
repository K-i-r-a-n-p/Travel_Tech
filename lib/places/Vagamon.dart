import 'package:flutter/material.dart';
import 'package:software_project/BusBooking.dart';
import 'package:software_project/TrainBooking.dart';

class PlaceVagamon extends StatelessWidget {
  const PlaceVagamon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Vagamon"),
        centerTitle: true,
      ),
      body: ListView(children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assests/Vagamon.jpg')),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, right: 20),
          child: Text(
            "One of the most scenic hill stations and least explored tourist places in Kerala, this retreat in the Idukki district is known for its salubrious beauty, pleasant climate, and much more.\n\nIn addition to leisure travellers, thrill and adventure seekers also make it to Vagamon in a considerable number. A year-round destination, it is considered as an ideal destination for adventure activities like paragliding, mountaineering, rock climbing, trekking, and lot more.",
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
            "Tourist Attractions:  Murinjupuzha Water Falls, Ulipooni Wildlife Sanctuary, ElaveezhaPoonchira, Idukki Arch Dam, Pine Hills, Parumthumpara Point, Kurisumala, Peermade, Mangala Devi Temple, Pattumalai Church, Kuttikanam Palace",
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
