// ignore_for_file: avoid_print

import 'package:app_go/components/appbar.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class ConfirmBookDocPage extends StatefulWidget {
    // final String doctorName;
    // final String doctorSpeciality;
    // final String doctorId;
    // final String doctorImage;
  const ConfirmBookDocPage({super.key});

  @override
  State<ConfirmBookDocPage> createState() => _ConfirmBookDocPageState();
}

class _ConfirmBookDocPageState extends State<ConfirmBookDocPage> {
  @override
  Widget build(BuildContext context) {
    // var clinicMap = <String,String>{};
    // for(var clinic in ClinicList.clicName){
    //   clinicMap[clinic.name]=clinic.id;
  //   bool _isChecked = true;
  //   List<String> _texts = [
  //   " 7:30 AM - 10:00 AM " ,
  //   " 6:00 PM - 8:00 PM " ,
  //   " 9:00 PM - 10:00 PM " ,
  // ];
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
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 55, 214),
                        fontSize: 22),
                  ),
                ],
              ),
              Expanded(child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 100),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: 1.3,
                          child: Image.asset(
                            'assets/doc.jpg',
                            fit: BoxFit.cover,
                            ),
                          ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
              const Center(
                child: Text(
                  "Dr. Sneha Mallick",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 6),
              const Center(
                child: Text(
                  "Gynecologist",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Container(
                height: 320,
                width: 360,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 242, 255),
                    borderRadius: BorderRadius.circular(10.0)
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
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
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: DecoratedBox(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.white
                            ),
                          child: DateTimePicker(
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(15.0),
                              hintText: "Tap and select your date of booking",
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                  color: Colors.white, width: 1.5),
                                  ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                  ),
                            ),
                            initialValue: '',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            dateLabelText: 'Date',
                            onChanged: (val) => print(val),
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                        child: Text(
                          "This doctor is available on Monday, Tuesday, Wednesday",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                          ),
                          ),
                      ),
                      SizedBox(
            height: 100,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){
                  showAlertDialog(context);
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
                  ],),
                ),
                ),
                ],
                ),
              ),),
       
           ],
               ),
        ),
      
    );
 }
 showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () { },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Confirmation Notice"),
    content: const Text("Your Booking is successful"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
}