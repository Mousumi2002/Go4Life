import 'package:app_go/model/doctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DoctorProvider extends ChangeNotifier {
  List<Doctor> _doctors = [];

  List<Doctor> get doctors => _doctors;

  List<Doctor> _filteredDoctors = [];

  List<Doctor> get filteredDoctors => _filteredDoctors;

  bool _isFilterActive = false;

  bool get isFilterActive => _isFilterActive;

  List<String> _specialisations = [];

  List<String> get specialisations => _specialisations;

  String _selectedSpecialisation = 'All';

  String get selectedSpecialisation => _selectedSpecialisation;

  final docNameCtrl = TextEditingController();

  void addDoctorsListener() {
    FirebaseFirestore.instance.collection('doctors').snapshots().listen((event) {
      _doctors.clear();
      final docs = event.docs;
      _doctors = docs.map((e) => Doctor.fromMap(e.data())).toList();
      _specialisations = _doctors.map((e) => e.specialisation).toSet().toList();
      _specialisations.insert(0, 'All');
      notifyListeners();
    });
  }

  void setSelectedSpecialisation(String specialisation) {
    _selectedSpecialisation = specialisation;
    notifyListeners();
  }

  void clearFilter() {
    _isFilterActive = false;
    _filteredDoctors = [];
    notifyListeners();
  }

  void filterDoctors() {
    if (selectedSpecialisation == 'All') {
      clearFilter();
      return;
    }

    _isFilterActive = true;
    _filteredDoctors = _doctors.where((element) => element.specialisation == selectedSpecialisation).toList();
    notifyListeners();
  }

  void searchDoctors(String query) {
    if (query.isEmpty) {
      return;
    }

    List<Doctor> listForSearch = _isFilterActive ? _filteredDoctors : _doctors;

    _filteredDoctors =
        listForSearch.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();

  }
}
