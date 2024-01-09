import 'package:flutter/material.dart';
import 'package:software_project/places/Allapuzha.dart';
import 'package:software_project/places/Bekal.dart';
import 'package:software_project/places/Kuttanad.dart';
import 'package:software_project/places/Malampuzha.dart';
import 'package:software_project/places/Munnar.dart';
import 'package:software_project/places/Thekkadi.dart';
import 'package:software_project/places/Wayanad.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Places to Visit"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Image(image: AssetImage('assests/kuruva-island.webp')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PlaceWayanad()));
                },
                child: const Text(
                  "Wayanad",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Image(image: AssetImage('assests/munnar-1.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlaceMunnar()));
                  },
                  child: const Text("Munnar", style: TextStyle(fontSize: 15))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Image(image: AssetImage('assests/Alleppey.jpg')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlaceAllapuzha()));
                  },
                  child:
                      const Text("Alappuzha", style: TextStyle(fontSize: 15))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child:
                Image(image: AssetImage('assests/Periyar-National-Park.jpg')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlaceThekkadi()));
                  },
                  child:
                      const Text("Thekkadey", style: TextStyle(fontSize: 15))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Image(image: AssetImage('assests/Malampuzha.jpg')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlaceMalampuzha()));
                  },
                  child:
                      const Text("Malampuzha", style: TextStyle(fontSize: 15))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Image(image: AssetImage('assests/Bekal.jpg')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlaceBekal()));
                  },
                  child: const Text("Bekal", style: TextStyle(fontSize: 15))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Image(image: AssetImage('assests/Kuttanad.jpg')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlaceKuttanad()));
                  },
                  child:
                      const Text("Kuttanad", style: TextStyle(fontSize: 15))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Image(image: AssetImage('assests/Idukki.jpg')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlaceKuttanad()));
                  },
                  child: const Text("Idukki", style: TextStyle(fontSize: 15))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Image(image: AssetImage('assests/Vagamon.jpg')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlaceKuttanad()));
                  },
                  child: const Text("Vagamon", style: TextStyle(fontSize: 15))),
            ),
          ),
        ],
      ),
    );
  }
}
