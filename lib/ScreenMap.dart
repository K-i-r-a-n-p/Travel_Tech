import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class ScreenMap extends StatelessWidget {
  const ScreenMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Map"),
        centerTitle: true,
      ),
      body: FlutterLocationPicker(
        initZoom: 11,
        minZoomLevel: 5,
        maxZoomLevel: 16,
        trackMyPosition: true,
        searchBarBackgroundColor: Colors.white,
        selectedLocationButtonTextstyle: const TextStyle(fontSize: 18),
        mapLanguage: 'en',
        //onError: (e) => print(e),
        selectLocationButtonLeadingIcon: const Icon(Icons.check),
        onPicked: (pickedData) {
          // print(pickedData.latLong.latitude);
          // print(pickedData.latLong.longitude);
          // print(pickedData.address);
          // print(pickedData.addressData);
        },
        onChanged: (pickedData) {
          // print(pickedData.latLong.latitude);
          // print(pickedData.latLong.longitude);
          // print(pickedData.address);
          // print(pickedData.addressData);
        },
        showContributorBadgeForOSM: true,
      ),
    );
  }
}
