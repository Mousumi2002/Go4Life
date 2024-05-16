import 'package:app_go/model/cart_item.dart';
import 'package:app_go/model/medicine_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addCartItemListener(String uid) {
    FirebaseFirestore.instance.collection('cart').doc(uid).snapshots().listen((event) {
      _cartItems.clear();
      final data = event.data();
      if (data != null) {
        final List<dynamic> cartItems = data['items'];
        _cartItems = cartItems.map((e) => CartItem.fromMap(e)).toList();
      }
      notifyListeners();
    });
  }

  void updateCartItemQuantity(String name, bool isIncrement, String uid) {
    final index = _cartItems.indexWhere((element) => element.name == name);
    if (isIncrement) {
      _cartItems[index].quantity++;
    } else {
      _cartItems[index].quantity--;
    }

    if (_cartItems[index].quantity == 0) {
      removeCartItem(name, uid);
      return;
    }

    FirebaseFirestore.instance.collection('cart').doc(uid).update({
      'items': cartItemsMap,
    });
  }

  void removeCartItem(String name, String uid) {
    _cartItems.removeWhere((element) => element.name == name);
    FirebaseFirestore.instance.collection('cart').doc(uid).update({
      'items': cartItemsMap,
    });
  }

  List<Map<String, dynamic>> get cartItemsMap => _cartItems.map((e) => e.toMap()).toList();

  CartItem? getCartItemFromName(String name){
    return _cartItems.firstWhereOrNull((element) => element.name == name);
  }

  void addItem(MedicineItem medicineItem, String uid) {
    final index = _cartItems.indexWhere((element) => element.name == medicineItem.name);
    if (index == -1) {
      _cartItems.add(CartItem(
        name: medicineItem.name,
        quantity: 1,));
    }
    else{
      _cartItems[index]= CartItem(
        name: medicineItem.name,
        quantity: _cartItems[index].quantity + 1);
    }
    FirebaseFirestore.instance.collection('cart').doc(uid).update({
      'items': cartItemsMap,});
  }
}