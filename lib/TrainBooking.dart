import 'package:flutter/material.dart';

class TrainBooking extends StatefulWidget {
  const TrainBooking({super.key});

  @override
  State<TrainBooking> createState() => _TrainBookingState();
}

class _TrainBookingState extends State<TrainBooking> {
  String? fromValue;
  String? toValue;
  DateTime? selectedDate;
  String? cvalue;

  @override
  Widget build(BuildContext context) {
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
          buildDropdown('From', fromValue),
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
          buildDropdown('To', toValue),
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
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "Class",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildDropdown1("class", cvalue),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Search", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdown(String label, String? selectedValue) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Center(
        child: DropdownButton(
          isExpanded: true,
          style: const TextStyle(color: Colors.black, fontSize: 20),
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

  Widget buildDropdown1(String label, String? selectedValue) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Center(
            child: DropdownButton(
          isExpanded: true,
          style: const TextStyle(color: Colors.black, fontSize: 20),
          items: const [
            DropdownMenuItem(
              value: "AC First Class (1A)",
              child: Text("AC First Class (1A)"),
            ),
            DropdownMenuItem(
              value: "AC 2 Tier (2A)",
              child: Text("AC 2 Tier (2A)"),
            ),
            DropdownMenuItem(
              value: "AC 3 Tier (3A)",
              child: Text("AC 3 Tier (3A)"),
            ),
            DropdownMenuItem(
              value: "AC Chair Car (CC)",
              child: Text("AC Chair Car (CC)"),
            ),
            DropdownMenuItem(
              value: "Sleeper (SL)",
              child: Text("Sleeper (SL)"),
            ),
            DropdownMenuItem(
              value: "Second Sitting (2S)",
              child: Text("Second Sitting (2S)"),
            ),
          ],
          onChanged: (value) => setState(() => cvalue = value.toString()),
          hint: Text(selectedValue ?? ''),
        )));
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
}
