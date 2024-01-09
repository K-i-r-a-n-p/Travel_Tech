import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BusLayout extends StatefulWidget {
  const BusLayout({Key? key}) : super(key: key);

  @override
  State<BusLayout> createState() => _BusLayoutState();
}

class SeatNumber {
  final int rowI;
  final int colI;

  SeatNumber({required this.rowI, required this.colI});
}

class _BusLayoutState extends State<BusLayout> {
  Set<SeatNumber> selectedSeats = {};
  final paymentUrl = 'https://rzp.io/l/l738RHk';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text("Front side"),
            const SizedBox(
              height: 32,
            ),
            Flexible(
              child: SizedBox(
                width: double.maxFinite,
                height: 500,
                child: SeatLayoutWidget(
                  onSeatStateChanged: (rowI, colI, seatState) {
                    if (seatState == SeatState.selected) {
                      selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                    } else {
                      selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                    }
                  },
                  stateModel: const SeatLayoutStateModel(
                    rows: 10,
                    cols: 7,
                    seatSvgSize: 45,
                    pathSelectedSeat: 'assests/seat_selected.svg',
                    pathDisabledSeat: 'assests/seat_disabled.svg',
                    pathSoldSeat: 'assests/seat_sold.svg',
                    pathUnSelectedSeat: 'assests/seat_unselected.svg',
                    currentSeatsState: [
                      [
                        SeatState.disabled,
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.sold,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.sold,
                        SeatState.sold,
                        SeatState.sold,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.sold,
                        SeatState.sold,
                      ],
                      [
                        SeatState.sold,
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.sold,
                        SeatState.sold,
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.sold,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.unselected,
                        SeatState.sold,
                        SeatState.sold,
                        SeatState.sold,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 2),
                      const Text('Disabled')
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.lightBlueAccent,
                      ),
                      const SizedBox(width: 2),
                      const Text('Sold')
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff0FFF50))),
                      ),
                      const SizedBox(width: 2),
                      const Text('Available')
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: const Color(0xff0FFF50),
                      ),
                      const SizedBox(width: 2),
                      const Text('Selected by you')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedSeats.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('No Seats Selected'),
                        content: const Text('Please book at least 1 seat.'),
                        icon: const Icon(
                          Icons.warning,
                          color: Colors.red,
                        ),
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
                } else {
                  launchRazorpayPaymentWebsite();
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => const Color(0xFFfc4c4e)),
              ),
              child: const Text('Book Seats'),
            ),
            const SizedBox(height: 12),
            Text(selectedSeats.join(" , "))
          ],
        ),
      ),
    );
  }

  Future<void> launchRazorpayPaymentWebsite() async {
    var data = Uri.parse('https://rzp.io/l/l738RHk');
    // Launch the Razorpay payment website in the default browser
    await launchUrl(data);

    // Handle return from website to the app (deep linking or custom URL scheme)
    // ...

    // Example using deep linking: you may need to configure the website
    // to redirect back to a custom URL scheme registered by the app
    // (e.g., myapp://payment-completed)

    // When the user returns to the app, you can handle the navigation accordingly
    // (e.g., show a success message or navigate to a confirmation screen).
  }
}
