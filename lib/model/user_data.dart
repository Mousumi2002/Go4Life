class UserModel{
  String name;
  String email;
  String address;
  String pincode;
  String gender;
  String dob;
  String createdAt;
  String phoneNumber;
  String uid;

  UserModel({required this.name, required this.email, required this.address, required this.pincode, required this.gender, required this.dob, required this.createdAt, required this.phoneNumber,required this.uid});

  //from map
  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      pincode: map['pincode'] ?? '',
      gender: map['gender'] ?? '',
      dob: map['dob'] ?? '',
      createdAt: map['createdAt'] ?? '',
      phoneNumber :map["phoneNumber"]?? '',
      uid: map['uid'] ?? '',
    );
  }
  //to map
  Map<String ,dynamic> toMap(){
    return {
      "name" : name,
      "email": email,
      "uid" : uid,
      "address" : address,
      "pincode" : pincode,
      "gender" : gender,
      "dob" : dob,
      "createdAt" : createdAt,
      "phoneNumber" : phoneNumber
  };
  }
}