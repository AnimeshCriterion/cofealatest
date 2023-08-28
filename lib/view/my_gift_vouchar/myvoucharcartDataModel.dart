class MygiftVoucharDataModel {
  int? giftVoucherPurchaseId;
  int? userId;
  int? giftVoucherId;
  String? code;
  int? isPurchase;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? status;
  Gift? gift;

  MygiftVoucharDataModel(
      {this.giftVoucherPurchaseId,
        this.userId,
        this.giftVoucherId,
        this.code,
        this.name,
        this.status,
        this.isPurchase,
        this.createdAt,
        this.updatedAt,
        this.gift});

  MygiftVoucharDataModel.fromJson(Map<String, dynamic> json) {
    giftVoucherPurchaseId = json['gift_voucher_purchase_id'];
    userId = json['user_id'];
    giftVoucherId = json['gift_voucher_id'];
    code = json['code'];
    name = json['name'];
    status = json['status'];
    isPurchase = json['is_purchase'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gift = json['gift'] != null ? new Gift.fromJson(json['gift']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gift_voucher_purchase_id'] = this.giftVoucherPurchaseId;
    data['user_id'] = this.userId;
    data['gift_voucher_id'] = this.giftVoucherId;
    data['code'] = this.code;
    data['is_purchase'] = this.isPurchase;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.gift != null) {
      data['gift'] = this.gift!.toJson();
    }
    return data;
  }
}

class Gift {
  String? voucherItemNo;
  int? giftVoucherId;
  int? productId;
  int? countryId;
  String? name;
  String? slug;
  int? price;
  String?createdAt;
  String? updatedAt;
  String? image;
  String? status;

  Gift(
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

  Gift.fromJson(Map<String, dynamic> json) {
    voucherItemNo = json['voucher_item_no'];
    giftVoucherId = json['gift_voucher_id'];
    productId = json['product_id'];
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