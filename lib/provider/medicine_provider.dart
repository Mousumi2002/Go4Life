
import 'package:app_go/model/medicine_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MedicineProvider extends ChangeNotifier{
  List <MedicineItem> _medicines = [];
  List <MedicineItem> get medicines => _medicines;

  addMedicineItemListener(String uid){
    FirebaseFirestore.instance.collection('medications').snapshots().listen((event) {
      _medicines.clear();
      final data = event.docs;
      if( data != null){
        final List<dynamic> medicines = ['medItems'];
        _medicines = medicines.map((e) => MedicineItem.fromMap(e)).toList();
      }
      notifyListeners();
    });
  }
}