import 'package:app_go/components/appbar.dart';
import 'package:app_go/pages/clinicdetails.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  final String doctorName;
  final String doctorSpeciality;
  final String doctorId;
  final String doctorImage;
  const DoctorInfo(
      {super.key,
      required this.doctorName,
      required this.doctorSpeciality,
      required this.doctorId,
      required this.doctorImage});

  @override
  Widget build(BuildContext context) {
    var clinicMap = <String,String>{};
    for(var clinic in ClinicList.clicName){
      clinicMap[clinic.name]=clinic.id;
    }
    return Scaffold(
      appBar: AppBarTitle(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 31.0,
                ),
                Text(
                  'Doctor',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 10, 55, 214),
                      fontSize: 22),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 116, vertical: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image(
                  image: AssetImage(doctorImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 14)),
          Center(
            child: Text(
              doctorName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              doctorSpeciality,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 18),
          Center(
            child: Container(
              height: 320,
              width: 350,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 242, 255),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                    child: Text(
                      'Select Location',
                      style: TextStyle(
                          color: Color.fromARGB(255, 10, 55, 214),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(0.2),
                      child: DropdownSearch<String>(
                        items: clinicMap.keys.toList(),
                        popupProps: PopupProps.menu(
                          constraints: BoxConstraints(maxHeight: 220),
                          menuProps: MenuProps(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                          showSearchBox: false,
                        ),
                        dropdownButtonProps: DropdownButtonProps(
                          color: const Color.fromARGB(255, 10, 55, 214),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          textAlignVertical: TextAlignVertical.center,
                          dropdownSearchDecoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8.0),
                              hintText: 'Clinic Names',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.5),
                              )),
                        ),
                        onChanged: (value) {
                          print(ClinicList.getDetailsById(clinicMap[value]).address);
                          print((clinicMap[value]));
                        },
                        selectedItem: 'All',
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
