class Order {
  final int id;
  final String fullName;
  final String mobileNumber;
  final String wilaya;
  final String commune;
  final String exactAddress;
  final String status;
  final bool hidden;
  final int subtotal;
  final int total;
  final List<OrderItem> items;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.fullName,
    required this.mobileNumber,
    required this.wilaya,
    required this.commune,
    required this.exactAddress,
    required this.status,
    required this.hidden,
    required this.subtotal,
    required this.total,
    required this.items,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      fullName: json['full_name'],
      mobileNumber: json['mobile_number'],
      wilaya: json['wilaya'],
      commune: json['commune'],
      exactAddress: json['exact_address'],
      status: json['status'],
      hidden: json['hidden'],
      subtotal: json['subtotal'],
      total: json['total'],
      items: (json['items'] as List<dynamic>)
          .map((i) => OrderItem.fromJson(i))
          .toList(),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'mobile_number': mobileNumber,
      'wilaya': wilaya,
      'commune': commune,
      'exact_address': exactAddress,
      'status': status,
      'hidden': hidden,
      'subtotal': subtotal,
      'total': total,
      'items': items.map((i) => i.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}

class OrderItem {
  final int productId;
  final int quantity;
  final int price;
  final int netPrice;
  final Product? product;
  final ColorR? colorR;

  OrderItem(
      {required this.productId,
      required this.quantity,
      required this.price,
      required this.netPrice,
      this.product,
      this.colorR});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['product_id'],
      quantity: json['quantity'],
      price: json['price'],
      netPrice: json['net_price'],
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
      colorR: json['color'] != null ? ColorR.fromJson(json['color']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'price': price,
      'net_price': netPrice,
      'product': product?.toJson(),
    };
  }
}

class Product {
  final int id;
  final String name;

  Product({required this.id, required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class ColorR {
  final int id;
  final String name;

  ColorR({required this.id, required this.name});

  factory ColorR.fromJson(Map<String, dynamic> json) {
    return ColorR(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
