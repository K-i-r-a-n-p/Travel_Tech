import 'package:flutter/material.dart';

class PlaceBekal extends StatelessWidget {
  const PlaceBekal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Bekal"),
        centerTitle: true,
      ),
      body: ListView(children: const [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assests/Bekal.jpg')),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Located in the Kasaragod district of Kerala, Bekal is among the most scenic hamlets you can ever visit while on a Kerala tour. A combined beauty of the mighty Arabian Sea and lush landscapes, this tiny, yet pictorial village is of utmost historical importance. The glorious Bekal Fort testifies this fact vividly.\n\nServing as a perfect getaway from the concrete life, Bekal enjoys a pleasant climate while wearing a greener shade throughout the year. If you are yearning for silent, yet joyous holiday experience in Kerala, Bekal is the ideal hideout for you!",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Best time to visit: October to March",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "Tourist Attractions:  Bekal Fort, Pallikere Beach, Bekal Fort Beach, Valiyaparamba Backwaters, Kappil Beach, Hosdurg Beach, Nileswaram Cultural Centre, Nityanandarshan Caves, TulurVanam, Bekal Hole Aqua Park, Mallikarjuna Temple, Malik Dinar Mosque",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
