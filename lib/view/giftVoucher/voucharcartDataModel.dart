class VoucharCartModel {
  int? id;
  int? productId;
  int? giftVoucherId;
  String? name;
  String? seller;
  String? image;
  String? price;
  int? discountedPrice;
  int? quantity;
  int? maxQuantity;
  String? variant;
  String? color;
  String? variation;
  int? discount;
  int? discountType;
  int? tax;
  int? taxType;
  int? shippingMethodId;
  String? thumbnail;
  String? sellerId;
  String? sellerIs;
  String? shopInfo;
  List<int>? variationIndexes;
  int? shippingCost;
  String? nShippingType;
  int? productType;
  String? slug;

  VoucharCartModel(

        this.id,
         this.productId,
        this.giftVoucherId,
        this.name,
        this.seller,
        this.image,
        this.price,
        this.discountedPrice,
        this.quantity,
        this.maxQuantity,
        this.variant,
        this.color,
        this.variation,
        this.discount,
        this.discountType,
        this.tax,
        this.taxType,
        this.shippingMethodId,
        this.thumbnail,
        this.sellerId,
        this.sellerIs,
        this.shopInfo,
        this.variationIndexes,
        this.shippingCost,
        this.nShippingType,
        this.productType,
        this.slug);

  VoucharCartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    giftVoucherId = json['gift_voucher_id'];
    name = json['name'];
    seller = json['seller'];
    image = json['image'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    quantity = json['quantity'];
    maxQuantity = json['max_quantity'];
    variant = json['variant'];
    color = json['color'];
    variation = json['variation'];
    discount = json['discount'];
    discountType = json['discount_type'];
    tax = json['tax'];
    taxType = json['tax_type'];
    shippingMethodId = json['shipping_method_id'];
    thumbnail = json['thumbnail'];
    sellerId = json['seller_id'];
    sellerIs = json['seller_is'];
    shopInfo = json['shop_info'];
    variationIndexes = json['variation_indexes'].cast<int>();
    shippingCost = json['shipping_cost'];
    nShippingType = json['_shippingType'];
    productType = json['product_type'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['gift_voucher_id'] = this.giftVoucherId;
    data['name'] = this.name;
    data['seller'] = this.seller;
    data['image'] = this.image;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    data['quantity'] = this.quantity;
    data['max_quantity'] = this.maxQuantity;
    data['variant'] = this.variant;
    data['color'] = this.color;
    data['variation'] = this.variation;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['tax'] = this.tax;
    data['tax_type'] = this.taxType;
    data['shipping_method_id'] = this.shippingMethodId;
    data['thumbnail'] = this.thumbnail;
    data['seller_id'] = this.sellerId;
    data['seller_is'] = this.sellerIs;
    data['shop_info'] = this.shopInfo;
    data['variation_indexes'] = this.variationIndexes;
    data['shipping_cost'] = this.shippingCost;
    data['_shippingType'] = this.nShippingType;
    data['product_type'] = this.productType;
    data['slug'] = this.slug;
    return data;
  }
}