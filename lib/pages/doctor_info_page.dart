// ignore_for_file: avoid_print

import 'package:app_go/components/appbar.dart';
import 'package:app_go/components/information_page_doc.dart';
import 'package:app_go/model/doctor.dart';
import 'package:app_go/pages/clinicdetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  final Doctor doctor;

  const DoctorInfo({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    var clinicMap = <String, String>{};
    for (var clinic in ClinicList.clicName) {
      clinicMap[clinic.name] = clinic.id;
    }
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
                  'Doctor',
                  style: TextStyle(color: Color.fromARGB(255, 10, 55, 214), fontSize: 22),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: CachedNetworkImage(
                    imageUrl: doctor.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
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
                height: 360,
                width: 360,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 242, 255), borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Text(
                        'Select Location',
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 55, 214), fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(0.2),
                        child: DropdownSearch<String>(
                          items: clinicMap.keys.toList(),
                          popupProps: PopupProps.menu(
                            constraints: const BoxConstraints(maxHeight: 220),
                            menuProps: MenuProps(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            showSearchBox: false,
                          ),
                          dropdownButtonProps: const DropdownButtonProps(
                            color: Color.fromARGB(255, 10, 55, 214),
                          ),
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            textAlignVertical: TextAlignVertical.center,
                            dropdownSearchDecoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8.0),
                              hintText: 'Clinic Names',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            print(ClinicList.getDetailsById(clinicMap[value]).address);
                            print((clinicMap[value]));
                          },
                          selectedItem: 'All',
                        ),
                      ),
                    ),
                    InfoDoc(
                      doctor: doctor,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
