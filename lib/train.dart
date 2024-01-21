import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:software_project/global/Common/toast.dart';

class TrainInfo {
  final String trainName;
  final String trainNumber;
  final String from;
  final String to;
  final String duration;
  final String distance;

  TrainInfo({
    required this.trainName,
    required this.trainNumber,
    required this.from,
    required this.to,
    required this.duration,
    required this.distance,
  });
}

main(List args, String dateofJourney) async {
  List<TrainInfo> trainInfoList = await train(args[0], args[1], dateofJourney);
  return trainInfoList;
}

Future<List<TrainInfo>> train(
    String fcode, String tcode, String dateofJourney) async {
  List<TrainInfo> trainInfoList = [];
  const String url =
      "https://irctc1.p.rapidapi.com/api/v3/trainBetweenStations";
  const String apiKey = "fbf64fbfe0mshb9b0e72cdb34ab7p1a815ajsn534ab9de273a";

  Map<String, String> queryParameters = {
    "fromStationCode": fcode,
    "toStationCode": tcode,
    "dateOfJourney": dateofJourney,
  };
  Uri uri = Uri.parse(url).replace(queryParameters: queryParameters);

  Map<String, String> headers = {
    "X-RapidAPI-Key": apiKey,
    "X-RapidAPI-Host": "irctc1.p.rapidapi.com",
  };
  try {
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      List<Map<String, dynamic>> data =
          (decodedResponse['data'] as List<dynamic>)
              .cast<Map<String, dynamic>>();

      if (data.isEmpty) {
        showToast(message: "No trains found");
      } else {
        for (var trainData in data) {
          String trainName = trainData['train_name'];
          String trainNumber = trainData['train_number'];
          String from = trainData['from_std'];
          String to = trainData['to_std'];
          String duration = trainData['duration'].toString();
          String distance = trainData['distance'].toString();

          TrainInfo trainInfo = TrainInfo(
            trainName: trainName,
            trainNumber: trainNumber,
            from: from,
            to: to,
            duration: duration,
            distance: distance,
          );

          trainInfoList.add(trainInfo);
        }
      }
    } else {
      showToast(message: "Request failed with status: ${response.statusCode}");
    }
  } catch (error) {
    showToast(message: "Error: $error");
  }
  return trainInfoList;
}
