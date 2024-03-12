class CouponModel {
  int? _id;
  String? _couponType;
  String? _title;
  String? _code;
  String? _startDate;
  String? _expireDate;
  double? _minPurchase;
  double? _maxDiscount;
  double? _discount;
  String? _discountType;
  int? _status;
  String? _createdAt;
  String? _updatedAt;

  CouponModel(
      {int? id,
        String? couponType,
        String? title,
        String? code,
        String? startDate,
        String? expireDate,
        double? minPurchase,
        double? maxDiscount,
        double? discount,
        String? discountType,
        int? status,
        String? createdAt,
        String? updatedAt}) {
    _id = id;
    _couponType = couponType;
    _title = title;
    _code = code;
    _startDate = startDate;
    _expireDate = expireDate;
    _minPurchase = minPurchase;
    _maxDiscount = maxDiscount;
    _discount = discount;
    _discountType = discountType;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  int? get id => _id;
  String? get couponType => _couponType;
  String? get title => _title;
  String? get code => _code;
  String? get startDate => _startDate;
  String? get expireDate => _expireDate;
  double? get minPurchase => _minPurchase;
  double? get maxDiscount => _maxDiscount;
  double? get discount => _discount;
  String? get discountType => _discountType;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  CouponModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _couponType = json['coupon_type'];
    _title = json['title'];
    if(json['code'] != null){
      _code = json['code'];
    }else{
      _code = '';
    }
    _startDate = json['start_date'];
    _expireDate = json['expire_date'];
    _minPurchase = json['min_purchase'].toDouble();
    _maxDiscount = json['max_discount'].toDouble();
    _discount = json['discount'].toDouble();
    _discountType = json['discount_type'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['coupon_type'] = _couponType;
    data['title'] = _title;
    data['code'] = _code;
    data['start_date'] = _startDate;
    data['expire_date'] = _expireDate;
    data['min_purchase'] = _minPurchase;
    data['max_discount'] = _maxDiscount;
    data['discount'] = _discount;
    data['discount_type'] = _discountType;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
class VoucharModel {
  int? id;
  String? couponType;
  String? title;
  String? code="0";
  String? startDate;
  String? expireDate;
  int? minPurchase;
  double? maxDiscount;
  double? discount;
  String? discountType;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? limit;

  VoucharModel(
      {this.id,
        this.couponType,
        this.title,
        this.code,
        this.startDate,
        this.expireDate,
        this.minPurchase,
        this.maxDiscount,
        this.discount,
        this.discountType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.limit});

  VoucharModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponType = json['coupon_type'];
    title = json['title'];
    code = json['code'];
    startDate = json['start_date'];
    expireDate = json['expire_date'];
    minPurchase = json['min_purchase'];
    maxDiscount = double.parse(json['max_discount'].toString());
    discount = double.parse(json['discount'].toString());
    discountType = json['discount_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coupon_type'] = this.couponType;
    data['title'] = this.title;
    data['code'] = this.code;
    data['start_date'] = this.startDate;
    data['expire_date'] = this.expireDate;
    data['min_purchase'] = this.minPurchase;
    data['max_discount'] = this.maxDiscount;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['limit'] = this.limit;
    return data;
  }
}