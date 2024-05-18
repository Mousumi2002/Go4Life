
import 'package:app_go/model/vendor_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/cart_item.dart';

class VendorProvider extends ChangeNotifier{
  final List <VendorItem> _vendors = [];
  List <VendorItem> get vendors => _vendors;
  final List <VendorItem> _medicines = [];
  List <VendorItem> get medicines => _medicines;


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
  Map<String, VendorItem> getVendorsForCart(List<CartItem> cartItems) {
    final Map<String, VendorItem> vendors = {};
    for (final cartItem in cartItems) {
      for (final vendor in _vendors) {
        final availableMedicines = vendor.medicines;
        bool wasMedicineFound = false;
        for (final medicine in availableMedicines) {
          if (medicine['name'] == cartItem.name) {
            wasMedicineFound = true;
            medicine['quantity'] = cartItem.quantity;
            bool isOutOfStock = cartItem.quantity > medicine['stock'];

            if (vendors.containsKey(vendor.vid)) {
              if (isOutOfStock) {
                vendors[vendor.vid]!.outOfStockMedicines.add(medicine);
              } else {
                vendors[vendor.vid]!.medicines.add(medicine);
              }
              break;
            }

            final vendorCopy = VendorItem(
              name: vendor.name,
              vid: vendor.vid,
              picture: vendor.picture,
              medicines: isOutOfStock ? [] : [medicine],
              outOfStockMedicines: isOutOfStock ? [medicine] : [],
            );
            vendors[vendor.vid] = vendorCopy;
            break;
          }
        }
        if (!wasMedicineFound) {
          if (vendors.containsKey(vendor.vid)) {
            vendors[vendor.vid]!.outOfStockMedicines.add({
              'name': cartItem.name,
              'quantity': cartItem.quantity,
            });
          } else {
            final vendorCopy = VendorItem(
              name: vendor.name,
              vid: vendor.vid,
              picture: vendor.picture,
              medicines: [],
              outOfStockMedicines: [
                {
                  'name': cartItem.name,
                  'quantity': cartItem.quantity,
                }
              ],
            );
            vendors[vendor.vid] = vendorCopy;
          }
        }
      }
    }

    vendors.removeWhere((key, value) => value.medicines.isEmpty);
    for (final vendor in vendors.values) {
      print(vendor.outOfStockMedicines);
    }
    return vendors;
  }
}