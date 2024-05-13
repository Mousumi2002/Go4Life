import 'package:app_go/model/user_data.dart';
import 'package:app_go/pages/otp_screen.dart';
import 'package:app_go/utils/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthProvider extends ChangeNotifier{

  bool _isSignedIn = false;
  bool get isSignIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;
  UserModel get userModel => userModel!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  AuthProvider(){
    checkSignIn();
  }

  void checkSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async{
    try{
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: 
        (PhoneAuthCredential phoneAuthCredential) async{
        await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      }, 
      verificationFailed: (error){
        throw Exception(error.message);
      }, 
      codeSent: (verificationId, forceResendingToken) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPScreen(verificationId: verificationId),),);
      }, 
      codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e){
      showSnackBar(context, e.message.toString());
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async{
    _isLoading = true;
    notifyListeners();

    try{
      PhoneAuthCredential creds = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: userOtp);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user!;
      if(user != null){
        _uid = user.uid;
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch(e){
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
  //DATABASE Operations

  Future<bool> checkExistingUser() async{
    DocumentSnapshot snapshot = await _firebaseFirestore.collection("users").doc(_uid).get();
    if(snapshot.exists){
      print("USER EXISTS");
      return true;
    }
    else{
      print("NEW USER");
      return false;
    }
  }
  void saveUserDataToFirebase({required BuildContext context, required UserModel userModel,required Function onSuccess,})async{
    _isLoading = true;
    notifyListeners();
  }
}