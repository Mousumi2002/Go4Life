
import 'package:app_go/model/vendor_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VendorProvider extends ChangeNotifier{
  final List <VendorItem> _vendors = [];
  List <VendorItem> get vendors => _vendors;

  addVendorItemListener(){
    FirebaseFirestore.instance.collection('vendors').snapshots().listen((event) {
      _vendors.clear();
      final docs = event.docs;
      for(final doc in docs){
        final data = doc.data();
        final vendor = VendorItem.fromMap(data);
        _vendors.add(vendor);
      }
      notifyListeners();
    });
  }
}