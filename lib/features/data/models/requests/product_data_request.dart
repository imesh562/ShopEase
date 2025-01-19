import 'dart:convert';

ProductDataRequest productDataRequestFromJson(String str) =>
    ProductDataRequest.fromJson(json.decode(str));

String productDataRequestToJson(ProductDataRequest data) =>
    json.encode(data.toJson());

class ProductDataRequest {
  final int? page;
  final int? perPage;
  final String? sort;
  final String? orderBy;

  ProductDataRequest({
    this.page,
    this.perPage,
    this.sort,
    this.orderBy,
  });

  factory ProductDataRequest.fromJson(Map<String, dynamic> json) =>
      ProductDataRequest(
        page: json["page"],
        perPage: json["perPage"],
        sort: json["sort"],
        orderBy: json["orderBy"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "perPage": perPage,
        "sort": sort,
        "orderBy": orderBy,
      };
}
