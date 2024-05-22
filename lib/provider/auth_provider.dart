// ignore_for_file: use_build_context_synchronously

import 'package:app_go/model/user_data.dart';
import 'package:app_go/pages/otp_screen.dart';
import 'package:app_go/provider/cart_provider.dart';
import 'package:app_go/utils/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _uid;

  String get uid => _uid ?? '';
  String? _city;
  String? _pincode;
  String get city => _city ?? '';
  String get pincode => _pincode ?? '';

  late String? phoneNo;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  AuthProvider() {
    checkSignIn();
  }

  Future<void> checkSignIn() async {
    final s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    _uid = _firebaseAuth.currentUser?.uid;
    _city = s.getString("city");
    _pincode = s.getString("pincode");

    //Check signed in status in firebase auth
    if (_uid != null) {
      //If signed in, get the phone number
      phoneNo = _firebaseAuth.currentUser?.phoneNumber;

    } else {
      //If not signed in, trigger sign out
      _isSignedIn = false;
      s.setBool("is_signedin", false);
    }

    notifyListeners();
  }

  Future<void> logOut(CartProvider cartProvider) async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", false);
    await FirebaseAuth.instance.signOut();
    _isSignedIn = false;
    cartProvider.clearData();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(verificationId: verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: userOtp);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user!;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        _uid = user.uid;
        phoneNo = user.phoneNumber;
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
  //DATABASE Operations

  Future<bool> checkExistingUser() async {
    DocumentSnapshot <Map<String, dynamic>>snapshot = await _firebaseFirestore.collection("users").doc(_uid).get();
    if (snapshot.exists) {
      final data = snapshot.data();
      setCityAndPincode(data!['city'], data['pincode']);
      //USER EXISTS
      return true;
    } else {
      //NEW USER
      return false;
    }
  }

  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
  }
  void setCityAndPincode(String city, String pincode) async{
    final s = await SharedPreferences.getInstance();
    s.setString("city", city);
    s.setString("pincode", pincode);
    _city = city;
    _pincode = pincode;
  }
}