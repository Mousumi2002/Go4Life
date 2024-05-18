class Doctor {
  String name;
  String specialisation;
  String image;
  String id;
  List availableDays;
  String availableTime;
  String location;
  String charge;
  List <dynamic> clinics;
  Doctor({
    required this.id,
    required this.name,
    required this.specialisation,
    required this.image,
    this.availableDays = const [],
    required this.availableTime,
    required this.location,
    required this.charge,
    required this.clinics,
  });

  //from map
  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      specialisation: map['specialisation'] ?? '',
      image: map['profile_picture'] ?? '',
      availableDays: map['availableDays'],
      availableTime: map['availableTime'] ?? '',
      location: map['location'] ?? '',
      charge: map['charge'] ?? '',
      clinics: map['clinics'] ??  [],
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "specialisation": specialisation,
      "profile_picture": image,
      "id": id,
      "available_days": availableDays,
      "available_time": availableTime,
      "location": location,
      "charge": charge,
      "clinics": clinics
    };
  }
}
