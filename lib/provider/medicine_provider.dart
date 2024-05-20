import 'package:app_go/model/medicine_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MedicineProvider extends ChangeNotifier {
  final List<MedicineItem> _medicines = [];

  List<MedicineItem> get medicines => _medicines;

  final List<MedicineItem> _medicinesSearch = [];

  List<MedicineItem> get medicinesSearch => _medicinesSearch;

  addMedicineItemListener() {
    FirebaseFirestore.instance.collection('medications').snapshots().listen((event) {
      _medicines.clear();
      final docs = event.docs;
      for (final doc in docs) {
        final data = doc.data();
        final medicine = MedicineItem.fromMap(data['medItems']);
        _medicines.add(medicine);
      }
      notifyListeners();
    });
  }

  void searchMedicine(String value) {
    _medicinesSearch.clear();
    for (final medicine in _medicines) {
      if (medicine.name.toLowerCase().contains(value.toLowerCase())) {
        _medicinesSearch.add(medicine);
      }
    }
    notifyListeners();
  }
}
