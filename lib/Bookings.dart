import 'package:flutter/material.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Bookings"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ListTile(
                title:
                    Text("Kollam to Shornur", style: TextStyle(fontSize: 17)),
                subtitle: Text("Date: 29/12/2023"),
                trailing: Icon(Icons.train),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 2,
              );
            },
            itemCount: 1,
          ),
        ],
      ),
    );
  }
}
