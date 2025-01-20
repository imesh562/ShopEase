import 'dart:convert';

import 'package:hive/hive.dart';

part 'product_data_reponse.g.dart';

ProductDataResponse productDataResponseFromJson(String str) =>
    ProductDataResponse.fromJson(json.decode(str));

String productDataResponseToJson(ProductDataResponse data) =>
    json.encode(data.toJson());

class ProductDataResponse {
  final int? status;
  final bool success;
  final String? message;
  final List<Product>? data;

  ProductDataResponse({
    this.status,
    required this.success,
    this.message,
    this.data,
  });

  factory ProductDataResponse.fromJson(Map<String, dynamic> json) =>
      ProductDataResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "products": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  int? itemCount;
  @HiveField(2)
  final String? productName;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? thumbnail;
  @HiveField(5)
  final double? priceLabel;
  @HiveField(6)
  final Store? store;
  @HiveField(7)
  Product({
    this.id,
    this.itemCount,
    this.productName,
    this.description,
    this.thumbnail,
    this.priceLabel,
    this.store,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        itemCount: json["item_count"],
        productName: json["product_name"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        priceLabel: json["price_label"]?.toDouble(),
        store: json["store"] == null ? null : Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_count": itemCount,
        "product_name": productName,
        "description": description,
        "thumbnail": thumbnail,
        "price_label": priceLabel,
        "store": store?.toJson(),
      };
}

@HiveType(typeId: 1)
class Store {
  final int? storeId;
  @HiveField(0)
  final String? storeLogo;
  @HiveField(1)
  final String? storeName;
  @HiveField(2)
  final String? address;
  @HiveField(3)
  Store({
    this.storeId,
    this.storeLogo,
    this.storeName,
    this.address,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        storeId: json["store_id"],
        storeLogo: json["store_logo"],
        storeName: json["store_name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "store_logo": storeLogo,
        "store_name": storeName,
        "address": address,
      };
}
