import 'package:flutter/material.dart';
import 'package:software_project/train.dart';

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
  Map<String, String> stationCodes = {
    'Thrissur': 'TCR',
    'Calicut': 'CLT',
    'Ernakulam': 'ERS',
    'Trivandrum': 'TVC',
    'Aluva': 'AWY',
    'Kollam': 'QLN',
    'Palghat': 'PGT',
    'Kayamkulam': 'KYJ',
    'Shoranur': 'SRR',
    'Cannanore': 'CAN',
    'Ernakulam Town': 'ERN',
    'Kottayam': 'KTYM',
    'Tirur': 'TIR',
    'Chengannur': 'CNGR',
    'Tellicherry': 'TLY',
    'Badagara': 'BDJ',
    'Alappuzha': 'ALLP',
    'Trivandrum Kochuveli': 'KCVL',
    'Kasaragod': 'KGQ',
    'Tiruvalla': 'TRVL',
    'Payyanur': 'PAY',
    'Kanhangad': 'KZE',
    'Ottappalam': 'OTP',
    'Varkala Sivagiri Station': 'VAK',
    'Angamaly': 'AFK',
    'Changanacherry': 'CGY',
    'Kuttippuram': 'KTU',
    'Koyilandy': 'QLD',
    'Guruvayur': 'GUV',
    'Mavelikara': 'MVLK',
    'Chalakudi': 'CKI',
    'Karunagappally': 'KPY',
    'Irinjalakuda': 'IJK',
    'Parpanangadi': 'PGI',
    'Cherthala': 'SRTL',
    'Wadakanchery': 'WKI',
    'Feroke': 'FK',
    'Paravur': 'PVU',
    'Pattambi': 'PTB',
    'Nileshwar': 'NLE',
    'Ambalappuzha': 'AMPA',
    'Haripad': 'HAD',
    'Tripunittura': 'TRTR',
    'Kannapuram': 'KPQ',
    'Sasthamkotta': 'STKT',
    'Tanur': 'TA',
    'Charvattur': 'CHV',
    'Payangadi': 'PAZ',
    'Piravam Road': 'PVRD',
    'Neyyattinkara': 'NYY',
    'Chirayinkil': 'CRY',
    'Kazhakkottam': 'KZK',
    'Parassala': 'PASA',
    'Kumbala': 'KMQ',
    'Palakkad Town': 'PGTN',
    'Vaniyambalam': 'VNB',
    'Angadippuram': 'AAM',
    'Nilambur Road': 'NIL',
    'Thiruvananthapuram Pettah': 'TVP',
    'Kadakkavoor': 'KVU',
    'Turavur': 'TUVR',
    'Idaplli': 'IPL',
    'Manjeshwar': 'MJS',
    'Kundara': 'KUV',
    'Mararikulam': 'MAKM',
    'Vallikunnu': 'VLI',
    'Auvaneswarem': 'AVS',
    'Kotikulam': 'KQK',
    'Kottarakara': 'KKZ',
    'Mayyanad': 'MYY',
    'Pudukad': 'PUK',
    'Punalur': 'PUU',
    'Punkunnam': 'PNQ',
    'Vaikam Road': 'VARD',
    'Mulanturutti': 'MNTT',
    'Valapattanam': 'VAPM',
    'Ettumanur': 'ETM',
    'Trikarpur': 'TKQ',
    'Cheriyanad': 'CYN',
    'Payyoli': 'PYOL',
    'Kilikollur': 'KLQ',
    'Bekal Fort': 'BFR',
    'Kuruppanthara': 'KRPP',
    'Edamann': 'EDN',
    'Kollengode': 'KLGD',
    'Perinad': 'PRND',
    'Aryankavu New Block': 'AYVN',
    'Tirunnavaya': 'TUA',
    'Ezhukone': 'EKN',
    'Uppala': 'UAA',
    'Elimala': 'ELM',
    'Murukkumpuzha': 'MQU',
    'Ochira': 'OCR',
    'Kadalundi': 'KN',
    'Cheppad': 'CHPD',
    'Lakkiti': 'LDY',
    'Mulangunnathukavu': 'MGK',
    'Trivandrum Nemom': 'NEM',
    'Pappinissery': 'PPNS',
    'Balaramapuram': 'BRAM',
    'Pudunagaram': 'PDGM',
    'Muthalamada': 'MMDA',
    'Ottakkal': 'OKL',
    'Elattur': 'ETR',
    'Karukkutty': 'KUC',
    'Kallayi Kozhikode South': 'KUL',
    'Vallathol Nagar': 'VTK',
    'Kumbalam': 'KUMM',
    'West Hill': 'WH',
    'Walayar': 'WRA',
    'Kanjikode': 'KJKD',
    'Cannanore South': 'CS',
    'Pallippuram': 'PUM',
    'Jagannath Temple Gate': 'JGE',
    'Tikkotti': 'TKT',
    'Parli': 'PLL',
    'Kalamassery': 'KLMR',
    'Ollur': 'OLR',
    'Kaniyapuram': 'KXP',
    'Edakkad': 'ETK',
    'Edavai': 'EVA',
    'Mankarai': 'MNY',
    'Mannanur': 'MNUR',
    'Karakkad': 'KRKD',
    'Chingavanam': 'CGV',
    'Divinenagar': 'DINR',
    'Munroturuttu': 'MQO',
    'Tuvvur': 'TUV',
    'Vallapuzha': 'VPZ',
    'Pattikkad': 'PKQ',
    'Cherukara': 'CQA',
    'Arayankavu': 'AYV',
    'Melattur': 'MLTR',
    'Dhanuvachapuram': 'DAVM',
    'Punnapra': 'PNPR',
    'Takazhi': 'TZH',
    'Nadapuram Road': 'NAU',
    'Vellarakkad': 'VEK',
    'Amaravila Halt': 'AMVA',
    'Vadanam Kurussi Halt': 'VDKS',
    'Akathumuri': 'AMY',
    'Kaduturutti Halt': 'KDTY',
    'Chandanattop Halt': 'CTPE',
    'Vellayil': 'VLL',
    'Chullimada': 'CLMD',
    'Kurikad': 'KFE',
    'Edapalayam Halt': 'EDP',
    'Kumaranallur': 'KFQ',
    'Iravipuram': 'IRP',
    'Aroor Halt': 'AROR',
    'Ezhuppunna': 'EZP',
    'Chirakkal': 'CQL',
    'Iringal': 'IGL',
    'Kappil': 'KFI',
    'Palappuram': 'PLPM',
    'Kulukkalur': 'KZC',
    'Chovvara': 'CWR',
    'Karuvatta Halt': 'KVTA',
    'Veli': 'VELI',
    'Nellayi': 'NYI',
    'Kalanad Halt': 'KLAD',
    'Tumboli': 'TMPY',
    'Kanjiramattom': 'KPTM',
    'Chemancheri': 'CMC',
    'Tiruvizha': 'TRVZ',
    'Perunguzhi': 'PGZ',
    'Kodumunda': 'KODN',
    'Dharmadam': 'DMD',
    'Kundara East': 'KFV',
    'Kazhuthuruthy': 'KTHY',
    'Perssannur': 'PEU',
    'Mullurkara': 'MUC',
    'Mukkali': 'MUKE',
    'Kuri': 'KIF',
    'Kalavur Halt': 'KAVR',
    'Koratti Angadi': 'KRAN',
    'Chandera': 'CDRA',
    'Vayalar': 'VAY',
  };

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
          buildDropdown1("class", cvalue, isDarkMode),
          const SizedBox(
            height: 20,
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

  Widget buildDropdown1(String label, String? selectedValue, bool isDarkMode) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Center(
            child: DropdownButton(
          isExpanded: true,
          style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black, fontSize: 20),
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

  void trainDetails() {
    String fplace = fromValue;
    String tplace = toValue;
    String fcode = stationCodes[fplace]!;
    String tcode = stationCodes[tplace]!;
    codes.add(fcode);
    codes.add(tcode);
    trainName = main(codes);

    setState(() {
      _searching = true;
    });

    if (fromValue == '' || toValue == '') {
      setState(() {
        _searching = false;
      });
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
      setState(() {
        _searching = false;
      });

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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Train Details'),
          content: Text('Train Name: $trainName'),
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
  }
}
