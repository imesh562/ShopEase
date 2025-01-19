import 'dart:convert';

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

class Product {
  final int? id;
  final String? productName;
  final String? description;
  final String? thumbnail;
  final double? priceLabel;
  final Store? store;

  Product({
    this.id,
    this.productName,
    this.description,
    this.thumbnail,
    this.priceLabel,
    this.store,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["product_name"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        priceLabel: json["price_label"]?.toDouble(),
        store: json["store"] == null ? null : Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "description": description,
        "thumbnail": thumbnail,
        "price_label": priceLabel,
        "store": store?.toJson(),
      };
}

class Store {
  final int? storeId;
  final String? storeLogo;
  final String? storeName;
  final String? address;

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
