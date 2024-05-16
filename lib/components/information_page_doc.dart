import 'package:app_go/model/doctor.dart';
import 'package:app_go/pages/booking_confirm.dart';
import 'package:app_go/utils/int_to_day.dart';
import 'package:flutter/material.dart';

class InfoDoc extends StatelessWidget {
  final Doctor doctor;

  const InfoDoc({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    final availableDays = doctor.availableDays.map((e) => intToDay(e)).join(', ');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.calendar_month_rounded,
                    color: Color.fromARGB(255, 10, 55, 214),
                    size: 20,
                  )),
              Text(
                availableDays,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          //SizedBox(height: 0.2),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.access_time,
                  color: Color.fromARGB(255, 10, 55, 214),
                  size: 20,
                ),
              ),
              Text(
                doctor.availableTime,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 10, 55, 214),
                  size: 25,
                ),
              ),
              Expanded(
                child: Text(
                  doctor.location,
                  //overflow: TextOverflow.clip,
                  maxLines: 4,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.currency_rupee,
                    color: Color.fromARGB(255, 10, 55, 214),
                    size: 25,
                  ),
                ),
              ),
              Text(
                doctor.charge,
                //overflow: TextOverflow.clip,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmBookDocPage(
                        doctor: doctor,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 102, 156, 255)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text('Book Now'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
