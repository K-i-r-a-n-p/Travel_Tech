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
            child: Image(image: AssetImage('assests/kuruva-island.webp')),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "Cradled in the lap of the Western Ghats, Wayanad truly deserves a top rank in the list of places to visit in Kerala. Situated at an astounding height of 700-2,100m, this stunning hill station is all about fantasy, untouched nature, unforgettable moments, and merriment!\n\nAdding more to Wayanad’s enchanting beauty, visitors can also revisit and unfold history while visiting this hilly retreat. Yes, the lush and pristine forests in Wayanad are said to be inhabited more than 3,000 years ago.",
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
              "Tourist Attractions: Wayanad Wildlife Sanctuary, Banasura Sagar Dam, Chembra Peak, Soochipara Falls, Sentinel Rock Falls, Kanthanpara Waterfalls, Kuruva Island, Pookode Lake, Lakkidi, Muthanga Wildlife Sanctuary, Pakshipathalam, Edakkal Caves, SulthanBthery, Chain Tree",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ]));
  }
}
