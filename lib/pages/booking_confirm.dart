import 'package:app_go/components/appbar.dart';
import 'package:app_go/model/doctor.dart';
import 'package:app_go/utils/int_to_day.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ConfirmBookDocPage extends StatefulWidget {
  final Doctor doctor;

  const ConfirmBookDocPage({super.key, required this.doctor});

  @override
  State<ConfirmBookDocPage> createState() => _ConfirmBookDocPageState();
}

class _ConfirmBookDocPageState extends State<ConfirmBookDocPage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctor;
    final availableDays = doctor.availableDays.map((e) => intToDay(e)).join(', ');
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarTitle(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 31.0,
                ),
                const Text(
                  'Confirm Booking',
                  style: TextStyle(color: Color.fromARGB(255, 10, 55, 214), fontSize: 22),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: 1.3,
                          child: CachedNetworkImage(
                            imageUrl: doctor.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Center(
                      child: Text(
                        doctor.name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: Text(
                        doctor.specialisation,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Container(
                        height: 320,
                        width: 360,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 235, 242, 255), borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                              child: Text(
                                "Booking Slots",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 10, 55, 214),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                "For appointment, Please book the slot",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 113, 111, 111),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                selectedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                  selectableDayPredicate: (DateTime dateTime) =>
                                  widget.doctor.availableDays.contains(dateTime.weekday),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                child: DecoratedBox(
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                                    child: Text(
                                      selectedDate == null
                                          ? 'Tap to select date of booking'
                                          : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                              child: Text(
                                "This doctor is available on $availableDays",
                                style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              child: Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showAlertDialog(context);
                                  },
                                  // ignore: sort_child_properties_last
                                  child: const Text('Book Now'),
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(const Color.fromARGB(255, 102, 156, 255)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation Notice"),
          content: const Text("Your Booking is successful"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
