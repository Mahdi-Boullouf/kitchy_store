// // lib/models/order_model.dart

// class OrderModel {
//   final int id;
//   final String fullName;
//   final String mobileNumber;
//   final String wilaya;
//   final String commune;
//   final String exactAddress;
//   final String status;
//   final List<int> productIds;
//   final bool hidden;
//   final DateTime createdAt;

//   OrderModel({
//     required this.id,
//     required this.fullName,
//     required this.mobileNumber,
//     required this.wilaya,
//     required this.commune,
//     required this.exactAddress,
//     required this.status,
//     required this.productIds,
//     required this.hidden,
//     required this.createdAt,
//   });

//   factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
//         id: json['id'],
//         fullName: json['full_name'],
//         mobileNumber: json['mobile_number'],
//         wilaya: json['wilaya'],
//         commune: json['commune'],
//         exactAddress: json['exact_address'],
//         status: json['status'],
//         productIds: List<int>.from(json['product_ids']),
//         hidden: json['hidden'] ?? false,
//         createdAt: DateTime.parse(json['created_at']),
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'full_name': fullName,
//         'mobile_number': mobileNumber,
//         'wilaya': wilaya,
//         'commune': commune,
//         'exact_address': exactAddress,
//         'status': status,
//         'product_ids': productIds,
//         'hidden': hidden,
//         'created_at': createdAt.toIso8601String(),
//       };
// }
