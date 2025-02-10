class CartItem {
  final String title;
  final double price;
  int quantity;
  final String image;

  CartItem({
    required this.title,
    required this.price,
    this.quantity = 1,
    required this.image,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }
}
