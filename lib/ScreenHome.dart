import 'package:flutter/material.dart';
import 'package:software_project/Bookings.dart';
import 'package:software_project/BusBooking.dart';
import 'package:software_project/Destinations.dart';
import 'package:software_project/ScreenProfile.dart';
import 'package:software_project/ScreenSettings.dart';
import 'package:software_project/TrainBooking.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Travel Tech"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenProfile()));
              },
              icon: const Icon(Icons.person))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.book_online_sharp),
              title: const Text('My Bookings'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Bookings()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.bus_alert),
              title: const Text('Book Bus'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BusBooking()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.train),
              title: const Text('Book Train'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TrainBooking()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Saved Destinations'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Destinations()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScreenSettings()));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Search"),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Recommended",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      TextButton(
                          onPressed: () {}, child: const Text("See more"))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Image.asset("assests/kerala-backwaters.jpg"),
                  const SizedBox(height: 5),
                  const Center(
                    child: Text("Munnar",
                        style: TextStyle(
                          fontSize: 13,
                        )),
                  ),
                  const Text("Favourites",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Image.asset("assests/Periyar-National-Park.jpg"),
                  const Center(
                    child: Text(
                      "Thekkadi",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            )),
      ),
    );
  }
}
