import 'package:app_go/components/custom_button.dart';
import 'package:app_go/pages/user_info_screen.dart';
import 'package:app_go/utils/snackbar.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:app_go/provider/auth_provider.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading = 
    Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true ? const Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 9, 9, 136))):
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset("assets/moblogin.png"),
                  ),
                  const SizedBox(height: 15),
                  const Text("Verification",
                style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text("Enter the OTP send to your phone number",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey
                ),
                textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blue.shade400,
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
                const SizedBox(height: 25,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: CustomButton(
                    text: "Verify",
                    onPressed: (){
                      if(otpCode != null){
                        verifyOtp(context,otpCode!);
                      }
                      else{
                        showSnackBar(context, "Enter 6-digit code");
                      }
                    }),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Didn't receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 58, 166)
                  ),
                ),
                ],
                ),
            ),
                ),
                ),
                ),
                );
  }
  void verifyOtp(BuildContext context, String userOtp){
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess:(){
        ap.checkExistingUser().then((value) async{
          if (value == true){
            //user exists in our app
        }else{
          //new user
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const UserInformationScreen()), (route) => false);
        };
      },
      );
      }
    );
  }
}