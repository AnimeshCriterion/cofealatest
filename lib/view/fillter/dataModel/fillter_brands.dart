// import 'package:flutter_phoenix/generated/i18n.dart';

class FillterBrands {
  int? id;
  String? name;
  String? image;
  int? status;
  int? product_count;
  String? createdAt;
  String? updatedAt;
  int? brandProductsCount;
  List<String>? translations;
  bool? isSelect;

  FillterBrands(
      {this.id,
        this.name,
        this.image,
        this.status,
        this.product_count,
        this.createdAt,
        this.updatedAt,
        this.brandProductsCount,
        this.isSelect,
        this.translations});

  FillterBrands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    product_count = json['product_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brandProductsCount = json['brand_products_count'];
    isSelect = false;
    // if (json['translations'] != null) {
    //   translations = <String>[];
    //   json['translations'].forEach((v) {
    //     translations!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    data['product_count'] = this.product_count;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['brand_products_count'] = this.brandProductsCount;
    // if (this.translations != null) {
    //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}