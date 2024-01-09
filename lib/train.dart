import 'dart:convert';
import 'package:http/http.dart' as http;

main(List args) {
  train(args[0], args[1]).then((trainName) {
    print(trainName);
  });
}

train(String fcode, String tcode) async {
  String trainName = 'mumbai express';
  const String url =
      "https://irctc1.p.rapidapi.com/api/v3/trainBetweenStations";
  const String apiKey = "407076c5bamsh9e1d7f6886e6fd0p174078jsnb6846194248e";

  print("object");

  Map<String, String> queryParameters = {
    "fromStationCode": fcode,
    "toStationCode": tcode,
    "dateOfJourney": "2024-01-09",
  };

  Uri uri = Uri.parse(url).replace(queryParameters: queryParameters);

  Map<String, String> headers = {
    "X-RapidAPI-Key": apiKey,
    "X-RapidAPI-Host": "irctc1.p.rapidapi.com",
  };
  try {
    final response = await http.get(uri, headers: headers);

    print("hi");

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      List<Map<String, dynamic>> data =
          (decodedResponse['data'] as List<dynamic>)
              .cast<Map<String, dynamic>>();

      if (data.isEmpty) {
        print("No trains found");
        return;
      } else {
        for (var trainData in data) {
          trainName = trainData['train_name'];
        }
      }
      // Write the response to a JSON file
      // final File outputFile = File('output.json');
      // await outputFile.writeAsString(json.encode(decodedResponse));
      // print('Output written to output.json');
    } else {
      print("Request failed with status: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  } catch (error) {
    print("Error: $error");
  }
  print(trainName);
  return trainName;
}
