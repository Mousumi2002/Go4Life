import 'package:app_go/pages/booking_confirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoDoc extends StatelessWidget {
  //String time;
  // String address;
  // String? fees;
  InfoDoc({super.key,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Row(
            children: [
              // IconTheme(
              //   data: IconThemeData(color: Color.fromARGB(255, 10, 55, 214)), 
              //   child: Icon(),
              //   ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.calendar_month_rounded,color: Color.fromARGB(255, 10, 55, 214),size: 20,)
              ),
              Text("Mon, Wed, Tue",style: TextStyle(fontSize: 14),),
            ],
          ),
          //SizedBox(height: 0.2),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.access_time,color: Color.fromARGB(255, 10, 55, 214),size: 20,)
              ),
              Text("6 PM - 7 PM",style: TextStyle(fontSize: 14),),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.location_on,color: Color.fromARGB(255, 10, 55, 214),size: 25,)
              ),
              Expanded(
                child: Text(
                  "B 400, Prince Anwar Shah Rd, Lake Gardens,Tollygunge, Kolkata, West Bengal 700045",
                  //overflow: TextOverflow.clip,
                  maxLines: 4,
                  style: TextStyle(
                    fontSize: 14
                    ),
                    ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.currency_rupee,color: Color.fromARGB(255, 10, 55, 214),size: 25,)
                ),
              ),
              Text(
                "500",
                //overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 14
                  ),
                  ),
            ],
          ),
          //SizedBox(height: 2,),
          SizedBox(
            height: 40,
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const ConfirmBookDocPage()));
                }, 
                // ignore: sort_child_properties_last
                child: const Text('Book Now'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 102, 156, 255)),
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
    );
  }
}