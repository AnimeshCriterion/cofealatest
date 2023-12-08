class FillterTypes {
  String? uBn;
  int? productCount;
  int? reviewsCount;
  // List<Null>? translations;
  // List<Null>? reviews;

  FillterTypes(
      {this.uBn,
        this.productCount,
        this.reviewsCount,
        // this.translations,
        // this.reviews
      });

  FillterTypes.fromJson(Map<String, dynamic> json) {
    uBn = json['u_bn'];
    productCount = json['product_count'];
    reviewsCount = json['reviews_count'];
    // if (json['translations'] != null) {
    //   translations = <Null>[];
    //   json['translations'].forEach((v) {
    //     translations!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['reviews'] != null) {
    //   reviews = <Null>[];
    //   json['reviews'].forEach((v) {
    //     reviews!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['u_bn'] = this.uBn;
    data['product_count'] = this.productCount;
    data['reviews_count'] = this.reviewsCount;
    // if (this.translations != null) {
    //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    // }
    // if (this.reviews != null) {
    //   data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}