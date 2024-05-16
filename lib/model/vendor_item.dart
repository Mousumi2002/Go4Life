class VendorItem{
  String name;
  String vid;
  String picture;

  List <dynamic> medicines;

VendorItem({
  required this.name,
  required this.vid,
  required this.picture,
  required this.medicines,
  });
  factory VendorItem.fromMap(Map<String,dynamic> map){
    return VendorItem(
      name: map['name'] ?? '',
      vid: map['id'] ?? '',
      picture: map['picture'] ?? '',
      medicines: map['medications'] ?? [],
    );
  }
  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'id': vid,
      'picture': picture,
      'medications': medicines,
    };
  }
}