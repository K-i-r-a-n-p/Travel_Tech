import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_project/global/Common/toast.dart';
import 'package:software_project/places/TrainDetails.dart';
import 'package:software_project/train.dart';
import 'package:software_project/global/Common/Stationcode.dart';

import 'fire_base_auth/database.dart';

class TrainBooking extends StatefulWidget {
  const TrainBooking({super.key});

  @override
  State<TrainBooking> createState() => _TrainBookingState();
}

class _TrainBookingState extends State<TrainBooking> {
  bool _searching = false;
  String trainName = '';
  String fromValue = '';
  String toValue = '';
  DateTime? selectedDate;
  String? cvalue;
  List codes = [];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Train Booking"),
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
                trainDetails();
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
            DropdownMenuItem(
              value: "Aluva",
              child: Text("Aluva"),
            ),
            DropdownMenuItem(
              value: "Kayamkulam",
              child: Text("Kayamkulam"),
            ),
            DropdownMenuItem(
              value: "Kottayam",
              child: Text("Kottayam"),
            ),
            DropdownMenuItem(
              value: "Alappuzha",
              child: Text("Alappuzha"),
            ),
            DropdownMenuItem(
              value: "Ottappalam",
              child: Text("Ottappalam"),
            ),
            DropdownMenuItem(
              value: "Guruvayur",
              child: Text("Guruvayur"),
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

  void trainDetails() async {
    String fplace = fromValue;
    String tplace = toValue;
    String fcode = stationCodes[fplace]!;
    String tcode = stationCodes[tplace]!;
    codes.add(fcode);
    codes.add(tcode);

    if (fromValue == '' || toValue == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select Route'),
            content: const Text('Please select a route to continue.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    if (selectedDate == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select Date'),
            content: const Text('Please select a date to continue.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    setState(() {
      _searching = true;
    });

    String dateOfJourney = selectedDate!.toLocal().toString().split(' ')[0];
    List<TrainInfo> trainInfoList =
        await train(codes[0], codes[1], dateOfJourney);

    setState(() {
      _searching = false;
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TrainDetails(
          trainInfoList: trainInfoList,
          fromValue: fromValue,
          toValue: toValue,
          selectedDate: selectedDate!,
        ),
      ),
    );
  }
}
