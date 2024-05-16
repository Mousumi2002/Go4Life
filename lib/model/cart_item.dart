class CartItem {
  String name;
  int quantity;

  CartItem({required this.name, required this.quantity});

  //from map
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(name: map['name'] ?? '', quantity: map['quantity'] ?? 0);
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "quantity": quantity,
    };
  }
}
