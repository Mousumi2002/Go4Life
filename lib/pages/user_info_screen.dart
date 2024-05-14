import 'package:app_go/components/custom_button.dart';
import 'package:app_go/model/user_data.dart';
import 'package:app_go/nav.dart';
import 'package:app_go/provider/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// enum AutovalidateMode{
//     disable,
//     always,
//     onUserInteraction,
//   }
class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final cityController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    dobController.dispose();
    genderController.dispose();
    cityController.dispose();
  }
 
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 5.0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Welcome to Go4Life,",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue.shade900,
                          ),
                          ),
                      ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                          "Please enter the following details :",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  margin: const EdgeInsets.only(top: 20),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        //username
                        label(labelText: "Name"),
                        TextField(hintText: "John Smith", 
                        inputType: TextInputType.name, 
                        maxlines: 1,
                        controller: nameController, 
                        validator: (String? name) { 
                          if (name!.isEmpty){
                            return 'Please Enter Your Name';
                          } else{
                            return null;
                          }
                         },
                         ),
                        //email id
                        label(labelText: "Email Address"),
                        TextField(hintText: "abc@example.com", 
                        inputType: TextInputType.emailAddress, 
                        maxlines: 1, 
                        controller: emailController, 
                        validator: (String? emailAddress) { 
                          if (emailAddress!.isEmpty){
                            return 'Please Enter Your Email Id';
                          } else{
                            return null;
                          }
                         },
                        ),
                        //address
                        label(labelText: "Address"),
                        TextField(hintText: "2/1 Don Bosco Lane", 
                        inputType: TextInputType.streetAddress, 
                        maxlines: 2, 
                        controller: addressController,
                        validator: (String? address) { 
                          if (address!.isEmpty){
                            return 'Please Enter Your Address';
                          } else{
                            return null;
                          }
                         },
                        ),
                        //City
                        label(labelText: "City"),
                        TextField(
                        hintText: "Kolkata", 
                        inputType: TextInputType.number, 
                        maxlines: 1, 
                        controller: cityController,
                        validator: (String? city) { 
                          if (city!.isEmpty){
                            return 'Please Enter Your City';
                          } else{
                            return null;
                          }
                         },
                        ),
                        //pincode
                        label(labelText: "Pincode"),
                        TextField(
                        hintText: "724561", 
                        inputType: TextInputType.number, 
                        maxlines: 1, 
                        controller: pincodeController,
                        validator: (String? pincode) { 
                          if (pincode!.isEmpty){
                            return 'Please Enter Your Pincode';
                          } else{
                            return null;
                          }
                         },
                        ),
                        //dob
                        label(labelText: "Date of Birth"),
                        TextField(
                        hintText: "01-01-1973", 
                        inputType: TextInputType.datetime, 
                        maxlines: 1, 
                        controller: dobController,
                        validator: (String? dob) { 
                          if (dob!.isEmpty){
                            return 'Enter your Date of birth';
                          } else{
                            return null;
                          }
                         },
                        ),
                        //gender
                        label(labelText: "Gender"),
                        TextField(
                        hintText: "Enter your Gender", 
                        inputType: TextInputType.text, 
                        maxlines: 1, 
                        controller: genderController, 
                        validator: (String? gender) { 
                          if (gender!.isEmpty){
                            return 'Please Enter Your Gender';
                          } else{
                            return null;
                          }
                         },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: CustomButton(
                    text: "Continue",
                    onPressed: () => storeData(_formKey),
                    ),
                ),
              ],
            ),
          ),
        ),
        ),
    );
  }
  Widget label({
    required String labelText,
  }){
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black87,
        ),
        ));
  }
  Widget TextField({
    required String hintText,
    required TextInputType inputType,
    required int maxlines,
    required TextEditingController controller,
    required String? Function(String?) validator,
    }){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.black87,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxlines,
        validator: (value) => validator(value),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color.fromARGB(255, 82, 171, 244))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 82, 171, 244)), 
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 82, 171, 244),
            ),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 237, 53, 53)),
      ),
      ),
      ),);
  }

  //store user data in database
  void storeData( GlobalKey<FormState> formKey)async{
    if(!formKey.currentState!.validate()){
      return ;
    }
    final ap = Provider.of<AuthProvider>(context,listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(), 
      email: emailController.text.trim(), 
      address: addressController.text, 
      pincode: pincodeController.text.trim(), 
      gender: genderController.text.trim(), 
      dob: dobController.text, 
      createdAt: DateTime.now().toString(), 
      phoneNumber: ap.phoneNo ?? "", 
      uid: ap.uid);
    final docRef = FirebaseFirestore.instance.collection("users").doc(userModel.uid); 
    await docRef.set(userModel.toMap());
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool("is_signedin", true);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()),);
  }
}