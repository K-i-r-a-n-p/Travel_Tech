import 'package:flutter/material.dart';

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
      body: ListView(children: const [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assests/munnar-1.png')),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Gorgeous hill station in the lap of the fascinating Western Ghats, Munnar needs no introduction. Rising 1,600m above the sea level, a vacation in the beguiling locales of this hilly retreat is all about the lofty clouds, picturesque mountains, rolling hills, and a soothing ambience.\n\nCanopied mostly by never-ending tea plantations and lush forests, you simply cannot miss out Munnar while searching for the best tourist destination in Kerala. Be it during the summer or the winter, monsoon or the spring, Munnar will always make you crave for more!",
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
            "Tourist Attractions:  Eravikulam National Park, Mattupetty Dam, Pothamedu View Point, Anamudi, Blossom Park, Devikulam, Pallivasal, TATA Tea Museum, Vattavada, Attukal Waterfalls, Cheeyapara Waterfalls, Kundala Lake, Nyayamakad, Meesapulimala, Kolukkumalai, Lock-Hart Gap, Chithirapuram, Rajamala, Top Station, Marayoor Dolmens, Indo Swiss Diary Farm, Lite of Pi Church,",
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
