import 'package:flutter/material.dart';
import 'package:software_project/train.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainDetails extends StatefulWidget {
  final List<TrainInfo> trainInfoList;

  const TrainDetails({required this.trainInfoList, Key? key}) : super(key: key);

  @override
  State<TrainDetails> createState() => _TrainDetailsState();
}

class _TrainDetailsState extends State<TrainDetails> {
  late List<TrainInfo> displayedTrainInfoList;

  @override
  void initState() {
    super.initState();
    displayedTrainInfoList = List.from(widget.trainInfoList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Train Details"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSortOptions(context);
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: displayedTrainInfoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(displayedTrainInfoList[index].trainName),
              leading: Text(displayedTrainInfoList[index].trainNumber),
              subtitle: Text(
                'Distance: ${displayedTrainInfoList[index].distance} km\n'
                'From: ${displayedTrainInfoList[index].from}\n'
                'To: ${displayedTrainInfoList[index].to}',
              ),
              trailing:
                  Text("Duration: ${displayedTrainInfoList[index].duration}"),
              onTap: () {
                launchRazorpayPaymentWebsite();
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> launchRazorpayPaymentWebsite() async {
    var data = Uri.parse('https://rzp.io/l/l738RHk');
    await launchUrl(data);
  }

  void showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Sort by Duration (early first)"),
                onTap: () {
                  sortDurationEarly();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Sort by Duration (late first)"),
                onTap: () {
                  sortDurationLate();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Sort by Departure (early first)"),
                onTap: () {
                  sortDepartureEarly();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Sort by Departure (late first)"),
                onTap: () {
                  sortDepartureLate();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Sort by Arrival (early first)"),
                onTap: () {
                  sortArrivalEarly();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Sort by Arrival (late first)"),
                onTap: () {
                  sortArrivalLate();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void sortDurationEarly() {
    setState(() {
      displayedTrainInfoList.sort((a, b) => a.duration.compareTo(b.duration));
    });
  }

  void sortDurationLate() {
    setState(() {
      displayedTrainInfoList.sort((a, b) => b.duration.compareTo(a.duration));
    });
  }

  void sortDepartureEarly() {
    setState(() {
      displayedTrainInfoList.sort((a, b) => a.from.compareTo(b.from));
    });
  }

  void sortDepartureLate() {
    setState(() {
      displayedTrainInfoList.sort((a, b) => b.from.compareTo(a.from));
    });
  }

  void sortArrivalEarly() {
    setState(() {
      displayedTrainInfoList.sort((a, b) => a.to.compareTo(b.to));
    });
  }

  void sortArrivalLate() {
    setState(() {
      displayedTrainInfoList.sort((a, b) => b.to.compareTo(a.to));
    });
  }
}
