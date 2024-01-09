import 'package:flutter/material.dart';

class PlaceMalampuzha extends StatelessWidget {
  const PlaceMalampuzha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Malampuzha"),
        centerTitle: true,
      ),
      body: ListView(children: const [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assests/Malampuzha.jpg')),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "India’s ‘Spice Capital’ is all about lush greeneries and heart-warming ambience, hence the name “God’s Own Country’! And while in Malampuzha, located in the Palakkad district, you can feel the true essence of Kerala and its bountiful nature.\n\nMostly covered by evergreen vegetation, this part of the state is a picture-perfect display of how we should co-exist with Mother Nature. Malampuzha’s undulating beauty and tranquillity makes it a must to visit place in the entire region of Southern India.",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Best time to visit: August (Monsoon End) to April (Early Summer)",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Tourist Attractions:  Malampuzha Dam, Malampuzha Garden, Kava, Palakkad Fort, Dhoni Hills and Waterfalls, Thread Garden, Rock Garden, Snake Park, UdanKhatola, Fantasy Park",
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
