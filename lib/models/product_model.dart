// lib/models/product_image_model.dart
// lib/models/product_model.dart

class ProductModel {
  final int id;
  final String name;
  final double price;
  final double netPrice;
  final String description;
  final List<ColorModel> colors;
  final List<ProductImageModel> images;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.netPrice,
    required this.description,
    required this.colors,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        price: (json['price'] as num).toDouble(),
        netPrice: (json['net_price'] as num).toDouble(),
        description: json['description'],
        colors: (json['colors'] as List<dynamic>)
            .map((e) => ColorModel.fromJson(e))
            .toList(),
        images: (json['images'] as List<dynamic>)
            .map((e) => ProductImageModel.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'net_price': netPrice,
        'description': description,
        'colors': colors.map((e) => e.toJson()).toList(),
        'images': images.map((e) => e.toJson()).toList(),
      };
}

class ProductImageModel {
  final String path;
  final bool primary;
  final int sortOrder;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      ProductImageModel(
          path: json['path'],
          primary: json['is_primary'] == 1,
          sortOrder: json['sort_order']);

  ProductImageModel(
      {required this.path, required this.primary, required this.sortOrder});

  Map<String, dynamic> toJson() => {
        // 'id': id,
        // 'url': url,
      };
}

// lib/models/color_model.dart

class ColorModel {
  final int id;
  final String name;
  final String hex;

  ColorModel({required this.id, required this.name, required this.hex});

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        id: json['id'],
        name: json['name'],
        hex: json['hex'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'hex': hex,
      };
}
