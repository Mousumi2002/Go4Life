class VendorItem {
  String name;
  String vid;
  String picture;
  int deliveryTime;
  List<dynamic> medicines;
  List<dynamic> outOfStockMedicines;

  VendorItem({
    required this.name,
    required this.vid,
    required this.picture,
    required this.medicines,
    required this.deliveryTime,
    this.outOfStockMedicines = const [],
  });
  factory VendorItem.fromMap(Map<String, dynamic> map) {
    return VendorItem(
      name: map['name'] ?? '',
      vid: map['vid'] ?? '',
      picture: map['picture'] ?? '',
      medicines: map['medications'] ?? [],
      deliveryTime: map['deliveryTime'] ?? 0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'vid': vid,
      'picture': picture,
      'medications': medicines,
      'deliveryTime': deliveryTime,
    };
  }
}
