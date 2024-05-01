import 'package:get/get.dart';

class LoginPageController extends GetxController{
  var isSignIn = true.obs;
  //toggleSignIn() => isSignIn.value = !isSignIn.value;
  void setSignIn(bool value){
    isSignIn.value = value;
  }
}
