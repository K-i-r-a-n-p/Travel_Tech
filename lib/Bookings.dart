import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_project/global/Common/toast.dart';

import 'fire_base_auth/database.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Bookings"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseService(uid: user?.uid ?? '').getUserBookings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No bookings found."),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Clear Bookings"),
                              content: const Text(
                                  "Are you sure you want to clear all your bookings?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _clearBookings(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Clear"),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text("Clear Bookings"),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var booking = snapshot.data![index];
                  return ListTile(
                    title: Text('${(booking)['from']} to ${(booking)['to']}',
                        style: const TextStyle(fontSize: 17)),
                    subtitle: Text('Date: ${(booking)['date']}'),
                    trailing: _buildBookingIcon(booking),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2,
                  );
                },
                itemCount: snapshot.data!.length,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBookingIcon(Map<String, dynamic> booking) {
    String transportMode = booking[
        'transportMode']; // Replace 'transportMode' with the actual field name

    // Check the transport mode and return the appropriate icon
    if (transportMode == 'train') {
      return const Icon(Icons.train);
    } else {
      return const Icon(Icons.bus_alert);
    }
  }

  void _clearBookings(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      // Create an instance of DatabaseService
      DatabaseService databaseService = DatabaseService(uid: user!.uid);

      // Clear user bookings
      await databaseService.clearUserBookings();

      setState(() {});

      showToast(message: "Bookings cleared successfully.");
    } catch (e) {
      showToast(message: "Error clearing bookings: $e");
    }
  }
}
