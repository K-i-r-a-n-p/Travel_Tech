import 'package:flutter/material.dart';

class PlaceAllapuzha extends StatelessWidget {
  const PlaceAllapuzha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Allapuzha"),
        centerTitle: true,
      ),
      body: ListView(children: const [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assests/Alleppey.jpg')),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Esteemed as the ‘Backwater Capital of India’ or the ‘Venice of the East’, Alleppey is known for its silent backwaters and bountiful beauty!.\n\nSeated on the banks of the azure Vembanad Lake, it is in fact one of the most popular backwater destinations in Kerala and one of the highest sought-aftertourist places in Kerala. Visit this paradise; enjoy houseboat cruise and stay, village walks, Ayurvedic therapies and lot more!",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Best time to visit: Year-round destination",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Tourist Attractions: Vembanad Lake , Alleppey Beach, Marari Beach, Krishnapuram Palace, Pathiramanal, Kuttanad Backwaters, Arthunkal Church, Ambalapuzha Temple, Mannarshala Temple, Karumadikuttan Statue, St. Mary Rorane Church",
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
