import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:software_project/Seat/Bus.dart';

class BusBooking extends StatefulWidget {
  const BusBooking({super.key});

  @override
  State<BusBooking> createState() => _TrainBookingState();
}

class _TrainBookingState extends State<BusBooking> {
  String? fromValue;
  String? toValue;
  DateTime? selectedDate;
  bool _searching = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Bus Booking"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "From",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildDropdown('From', fromValue, isDarkMode),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "To",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildDropdown('To', toValue, isDarkMode),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "Date",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildDateColumn(),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                searchBuses();
              },
              child: _searching
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text("Search", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdown(String label, String? selectedValue, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Center(
        child: DropdownButton(
          isExpanded: true,
          style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black, fontSize: 20),
          items: const [
            DropdownMenuItem(
              value: "Shornur",
              child: Text("Shornur"),
            ),
            DropdownMenuItem(
              value: "Palakkad",
              child: Text("Palakkad"),
            ),
            DropdownMenuItem(
              value: "Kollam",
              child: Text("Kollam"),
            ),
            DropdownMenuItem(
              value: "Kannur",
              child: Text("Kannur"),
            ),
            DropdownMenuItem(
              value: "Kozhikode",
              child: Text("Kozhikode"),
            ),
            DropdownMenuItem(
              value: "Thiruvananthapuram",
              child: Text("Thiruvananthapuram"),
            ),
            DropdownMenuItem(
              value: "Ernakulam",
              child: Text("Ernakulam"),
            ),
            DropdownMenuItem(
              value: "Thrissur",
              child: Text("Thrissur"),
            ),
          ],
          onChanged: (value) {
            setState(() {
              if (label == 'From') {
                fromValue = value.toString();
              } else {
                toValue = value.toString();
              }
            });
          },
          hint: Text(selectedValue ?? ''),
        ),
      ),
    );
  }

  Widget buildDateColumn() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null && pickedDate != selectedDate) {
              setState(() {
                selectedDate = pickedDate;
              });
            }
          },
          child: Text(
            selectedDate != null
                ? '${selectedDate!.toLocal().day}/${selectedDate!.toLocal().month}/${selectedDate!.toLocal().year}'
                : 'Select Date',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  void searchBuses() async {
    setState(() {
      _searching = true;
    });

    if (fromValue == null || toValue == null) {
      setState(() {
        _searching = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Route'),
            content: Text('Please select a route to continue.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    if (selectedDate == null) {
      setState(() {
        _searching = false;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Date'),
            content: Text('Please select a date to continue.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Perform the Firestore query
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('busSchedules')
        .where('route', arrayContains: fromValue?.toUpperCase())
        .get();

    setState(() {
      _searching = false;
    });
    // Filter the results based on the second condition
    List<String> matchingBusNames = [];
    querySnapshot.docs.forEach((doc) {
      List<String> routes = List<String>.from(doc['route']);
      if (routes.contains(toValue?.toUpperCase())) {
        matchingBusNames.add(doc.id); // Assuming document name is the bus name
      }
    });

    // Process the filtered results
    if (matchingBusNames.isNotEmpty) {
      // Buses found, you can handle and display the results here
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Available Buses'),
            content: SizedBox(
                width: double.maxFinite,
                height: 200,
                child: ListView(
                  shrinkWrap: true,
                  children: matchingBusNames
                      .map((busName) => ListTile(
                            title: Text(busName),
                            subtitle: Text("$fromValue to $toValue"),
                            trailing: Text(
                                '${selectedDate!.toLocal().day}/${selectedDate!.toLocal().month}/${selectedDate!.toLocal().year}'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => BusLayout())));
                            },
                          ))
                      .toList(),
                )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // No buses found
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('No Buses Found'),
            content: Text('Sorry, no buses available for the selected route.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
