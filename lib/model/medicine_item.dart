class MedicineItem{
  String name;
  String id;
  String dosage;
  String picture;
  String manufacturer;
  List <Map<String,dynamic>> vendors;
MedicineItem({
  required this.name,
  required this.id,
  required this.dosage,
  required this.picture,
  required this.manufacturer,
  required this.vendors,
  });
  factory MedicineItem.fromMap(Map<String,dynamic> map){
    return MedicineItem(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      dosage: map['dosage'] ?? '',
      picture: map['picture'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      vendors: map['vendors'] ?? [],
    );
  }
  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'id': id,
      'dosage': dosage,
      'picture': picture,
      'manufacturer': manufacturer,
      'vendors': vendors,
    };
  }
}