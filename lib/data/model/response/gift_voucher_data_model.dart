class GiftVoucherDataModel {
  String? voucherItemNo;
  int? giftVoucherId;
  String? productId;
  int? countryId;
  String? name;
  String? slug;
  int? price;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? status;

  GiftVoucherDataModel(
      {this.voucherItemNo,
        this.giftVoucherId,
        this.productId,
        this.countryId,
        this.name,
        this.slug,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.status});

  GiftVoucherDataModel.fromJson(Map<String, dynamic> json) {
    voucherItemNo = json['voucher_item_no'];
    giftVoucherId = json['gift_voucher_id'];
    productId = json['product_id'].toString();
    countryId = json['country_id'];
    name = json['name'];
    slug = json['slug'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voucher_item_no'] = this.voucherItemNo;
    data['gift_voucher_id'] = this.giftVoucherId;
    data['product_id'] = this.productId;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}