class FillterIntencity {
  String? uRs;
  int? productCount;
  int? reviewsCount;
  bool? isSelect;
  // List<Null>? translations;
  // List<Null>? reviews;

  FillterIntencity(
      {this.uRs,
        this.productCount,
        this.reviewsCount,
        this.isSelect,
        // this.translations,
        // this.reviews
      });

  FillterIntencity.fromJson(Map<String, dynamic> json) {
    uRs = json['u_rs'];
    productCount = json['product_count'];
    reviewsCount = json['reviews_count'];
    isSelect = false;
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
    data['u_rs'] = this.uRs;
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