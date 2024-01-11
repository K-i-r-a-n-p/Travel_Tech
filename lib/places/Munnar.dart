import 'package:flutter/material.dart';
import 'package:software_project/BusBooking.dart';
import 'package:software_project/TrainBooking.dart';

class PlaceMunnar extends StatelessWidget {
  const PlaceMunnar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Munnar"),
        centerTitle: true,
      ),
      body: ListView(children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assests/munnar-1.png')),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, right: 20),
          child: Text(
            "Gorgeous hill station in the lap of the fascinating Western Ghats, Munnar needs no introduction. Rising 1,600m above the sea level, a vacation in the beguiling locales of this hilly retreat is all about the lofty clouds, picturesque mountains, rolling hills, and a soothing ambience.\n\nCanopied mostly by never-ending tea plantations and lush forests, you simply cannot miss out Munnar while searching for the best tourist destination in Kerala. Be it during the summer or the winter, monsoon or the spring, Munnar will always make you crave for more!",
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
            "Tourist Attractions:  Eravikulam National Park, Mattupetty Dam, Pothamedu View Point, Anamudi, Blossom Park, Devikulam, Pallivasal, TATA Tea Museum, Vattavada, Attukal Waterfalls, Cheeyapara Waterfalls, Kundala Lake, Nyayamakad, Meesapulimala, Kolukkumalai, Lock-Hart Gap, Chithirapuram, Rajamala, Top Station, Marayoor Dolmens, Indo Swiss Diary Farm, Lite of Pi Church,",
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
