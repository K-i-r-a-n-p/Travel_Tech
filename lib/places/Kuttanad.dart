import 'package:flutter/material.dart';
import 'package:software_project/BusBooking.dart';
import 'package:software_project/TrainBooking.dart';

class PlaceKuttanad extends StatelessWidget {
  const PlaceKuttanad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Kuttanad"),
        centerTitle: true,
      ),
      body: ListView(children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assests/Kuttanad.jpg')),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, right: 20),
          child: Text(
            "Fondly called as the ‘Rice Bowl of Kerala’, Kuttanad is truly a poetry in motion! Gracious, tranquil, evergreen, and still untouched by the outer world, this magnificent tourist destination in God’s Own Country is fringed with captivating groves of coconut trees, and is interconnected with a bucolic network of canal. This makes Kuttanad a place to behold among the visitors.\n\nWhile the intrinsic network of canals add more to the beauty and charm of Kuttanad, its evergreen swaying paddy fields make it truly irresistible for the visitors. Also, the rustic and traditional way of living that still persists in this piece of heaven will surely make you feel and live the true colours of Kerala.",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, right: 20),
          child: Text(
            "Best time to visit: August to March",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, right: 20),
          child: Text(
            "Tourist Attractions:  Champakulam, Chengannur, Pamba River, Meenachil River, Achankovil River, Manimala River, Punnamada Lake, Backwaters, Paddy Fields, Traditional Water Turbines",
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
