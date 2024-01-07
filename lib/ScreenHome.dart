import 'package:flutter/material.dart';
import 'package:software_project/Bookings.dart';
import 'package:software_project/BusBooking.dart';
import 'package:software_project/Destinations.dart';
import 'package:software_project/ScreenProfile.dart';
import 'package:software_project/ScreenSettings.dart';
import 'package:software_project/TrainBooking.dart';
import 'package:software_project/places/Munnar.dart';
import 'package:software_project/places/Thekkadi.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final List<String> allPlaces = [
    "Munnar",
    "Thekkadi",
    "Alleppey",
    "Kovalam",
    "Wayanad",
    // Add more places as needed
  ];

  List<String> filteredPlaces = [];
  bool isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    filteredPlaces = allPlaces;
  }

  void filterPlaces(String query) {
    setState(() {
      filteredPlaces = allPlaces
          .where((place) => place.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Bookings()));
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
            child: WillPopScope(
                onWillPop: () async {
                  if (isSearchFocused) {
                    setState(() {
                      isSearchFocused = false;
                    });
                    return false;
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: filterPlaces,
                        onTap: () {
                          setState(() {
                            isSearchFocused = true;
                          });
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            isSearchFocused = false;
                          });
                        },
                        decoration: const InputDecoration(hintText: "Search"),
                      ),
                      Visibility(
                        visible: isSearchFocused,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: filteredPlaces.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(filteredPlaces[index]),
                                onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PlaceMunnar(),
                                      ),
                                    )

                                // Add onTap to navigate or perform action for each place
                                );
                          },
                        ),
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
                      Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const PlaceMunnar()));
                              },
                              child: const Text("Munnar"))),
                      const Text("Favourites",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Image.asset("assests/Periyar-National-Park.jpg"),
                      Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const PlaceThekkadi()));
                              },
                              child: const Text("Thekkadi"))),
                      const SizedBox(height: 15),
                    ],
                  ),
                )),
          ),
        ));
  }
}
