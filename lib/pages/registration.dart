import 'package:app_go/components/custom_button.dart';
import 'package:app_go/provider/auth_provider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91", 
    countryCode: "IN", 
    e164Sc: 0, 
    geographic: true, 
    level: 1, 
    name: "India", 
    example: "India", 
    displayName: "India", 
    displayNameNoCountryCode: "IN", 
    e164Key: "",
    );

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(TextPosition(offset: phoneController.text.length));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 35),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset("assets/moblogin.png"),
                  ),
                  const SizedBox(height: 20),
                  const Text("Register",
                style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text("Add your phone number. We'll send you a verfication code",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey
                ),
                textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: phoneController,
                  onChanged: (value){
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  cursorColor: const Color.fromARGB(255, 0, 58, 166),
                  decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    hintStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black12
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black12
                      ),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context, 
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 500
                            ),
                            onSelect: (value){
                            setState(() {
                              selectedCountry = value;
                            });
                          });
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: phoneController.text.length > 9 ? Container(
                      height: 30,
                      width:  30,
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color.fromARGB(255, 0, 58, 166),
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20
                      ),
                    ) : null
                ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(text: "Login", onPressed: () => sendPhoneNumber()),
                )
                ],
                        ),
            ),
        ),),
    ),
    );
  }
  void sendPhoneNumber(){

    final ap = Provider.of<AuthProvider>(context,listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}