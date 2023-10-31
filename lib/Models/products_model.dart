class WooCommerceProduct {
  final int id;
  int? quantity;
  final String? name;
  final String? stockStatus;
  final String? price;
  final String? regularPrice;
  final String? discount;
  final List<WooCommerceProductImage> images;

  WooCommerceProduct({
    required this.id,
    this.quantity,
    required this.name,
    required this.stockStatus,
    required this.price,
    required this.regularPrice,
    required this.discount,
    required this.images,
  });

  factory WooCommerceProduct.fromJson(Map<String, dynamic> json) {
    return WooCommerceProduct(
      id: json['id'],
      quantity: json['quantity'],
      name: json['name'],
      stockStatus: json['stock_status'],
      price: json['price'],
      regularPrice: json['regular_price'],
      discount: json['discount'],
      // You need to determine how to calculate the discount
      images: List<WooCommerceProductImage>.from((json['images'] as List)
          .map((image) => WooCommerceProductImage.fromJson(image))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'name': name,
      'stock_status': stockStatus,
      'price': price,
      'regular_price': regularPrice,
      'discount': discount,
      'images': images.map((image) => image.toJson()).toList(),
    };
  }
}

class WooCommerceProductImage {
  final int id;
  final String src;
  final String name;

  WooCommerceProductImage({
    required this.id,
    required this.src,
    required this.name,
  });

  factory WooCommerceProductImage.fromJson(Map<String, dynamic> json) {
    return WooCommerceProductImage(
      id: json['id'],
      src: json['src'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'src': src,
      'name': name,
    };
  }
}
